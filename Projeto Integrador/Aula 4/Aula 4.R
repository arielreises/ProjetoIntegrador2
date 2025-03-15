# Limpeza do ambiente
rm(list=ls())

# Carregar bibliotecas necessárias
library(readr)   # Leitura de CSV
library(dplyr)   # Manipulação de dados
library(ggplot2) # Visualização de dados
library(writexl) # Exportação para Excel

# Definir o caminho do arquivo
PATH <- "C:/Users/User/Documents/Projeto Integrador/Aula 4/dataset"
setwd(PATH)

# Verificar se o arquivo existe
if (!file.exists("populacao2021.csv")) {
  stop("Erro: O arquivo 'populacao2021.csv' não foi encontrado no diretório especificado.")
}

# Tentar ler o arquivo CSV com diferentes encodings
df <- tryCatch({
  read_csv2("populacao2021.csv", locale = locale(encoding = "UTF-8"))
}, error = function(e) {
  read_csv2("populacao2021.csv", locale = locale(encoding = "latin1"))
})

# Verificar se o dataframe foi carregado corretamente
if (nrow(df) == 0) {
  stop("Erro: O arquivo CSV está vazio ou não foi lido corretamente.")
}

# Exibir um resumo do dataframe
print(head(df))
print(colnames(df))

# Ajustar nomes das colunas
colnames(df) <- gsub("\\.", " ", colnames(df))  # Substituir pontos por espaços
colnames(df) <- trimws(colnames(df))  # Remover espaços extras

# Verificar se as colunas necessárias existem
if (!"População" %in% colnames(df)) {
  stop("Erro: A coluna 'População' não foi encontrada no arquivo.")
}

if (!"Porte Populacional" %in% colnames(df)) {
  stop("Erro: A coluna 'Porte Populacional' não foi encontrada no arquivo.")
}

# Converter a coluna População para numérico (removendo pontos de milhares, se houver)
df$População <- as.numeric(gsub("\\.", "", df$População))

# Calcular métricas da população
media_populacao <- mean(df$População, na.rm=TRUE)
max_populacao <- max(df$População, na.rm=TRUE)
min_populacao <- min(df$População, na.rm=TRUE)

# Criar um dataframe para as estatísticas
estatisticas <- data.frame(
  Métrica = c("Média", "Máximo", "Mínimo"),
  População = c(media_populacao, max_populacao, min_populacao)
)

# Remover espaços extras na coluna "Porte Populacional"
df$`Porte Populacional` <- trimws(df$`Porte Populacional`)

# Contar quantidade de cidades por porte populacional
porte_populacional_count <- as.data.frame(table(df$`Porte Populacional`))
colnames(porte_populacional_count) <- c("Porte Populacional", "Quantidade de Cidades")

# Salvar os resultados em arquivos CSV
write.csv(estatisticas, "analise_populacao.csv", row.names=FALSE)
write.csv(porte_populacional_count, "porte_populacional.csv", row.names=FALSE)

# Exibir as estatísticas no console
print("Métricas de População:")
print(estatisticas)
print("Quantidade de cidades por porte populacional:")
print(porte_populacional_count)

