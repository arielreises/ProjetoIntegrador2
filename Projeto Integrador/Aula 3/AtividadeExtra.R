#limpeza
rm(list=ls())

#Biblioteca
library(readr)   # Para CSV
library(readxl)  # Para XLSX
library(dplyr)   # Manipulação de dados
library(ggplot2) # Visualização de dados
library(writexl) # Exportação para Excel

#Ler arquivo
PATH<-"C:/Users/User/Documents/Projeto Integrador/Aula 3/Atividade"
setwd(PATH)


# Definir caminhos dos arquivos (ajuste conforme necessário)
caminho_csv <- "populacao_canada.csv"
caminho_xlsx <- "populacao_canada.xlsx"

# Importar arquivo CSV
dados <- read_csv(caminho_csv)
dados
# Se quiser importar o arquivo XLSX, use a linha abaixo (descomente se necessário)
dados1 <- read_excel(caminho_xlsx)

# Visualizar os primeiros registros
print("Primeiras linhas do dataset:")
print(head(dados))
head(dados)
# Verificar estrutura dos dados
print("Estrutura do dataset:")
print(str(dados))
str(dados)
# Resumo estatístico das variáveis numéricas
print("Resumo estatístico:")
print(summary(dados))
summary(dados)

# Contar valores ausentes
print("Total de valores ausentes:")
print(sum(is.na(dados)))
dados
# Manipulação de dados
dados <- dados %>%
  arrange(desc(Populacao)) %>%  # Ordenar por população (decrescente)
  mutate(Densidade_hab_km2 = Populacao / Area_km2)  # Calcular densidade populacional


dados
# Estatísticas básicas
print("Média da população:")
print(mean(dados$Populacao, na.rm = TRUE))

print("Províincia mais populosa:")
print(dados$Provincia[which.max(dados$Populacao)])

print("Províincia menos populosa:")
print(dados$Provincia[which.min(dados$Populacao)])

# Gráfico de barras - População por província
print("Gerando gráfico de população por província...")
ggplot(dados, aes(x = reorder(Provincia, -Populacao), y = Populacao)) +
  geom_bar(stat = "identity", fill = "blue") +
  theme_minimal() +
  labs(title = "População das Províncias do Canadá", x = "Província", y = "População") +
  coord_flip()  # Inverter eixo para melhor visualização

# Gráfico de dispersão - População vs Área
print("Gerando gráfico de dispersão...")
ggplot(dados, aes(x = Area_km2, y = Populacao)) +
  geom_point(color = "red") +
  theme_minimal() +
  labs(title = "Relação entre Área e População", x = "Área (km²)", y = "População")

# Exportar os dados limpos para CSV e Excel
write_csv(dados, "populacao_canada_tratada.csv")
write_xlsx(dados, "populacao_canada_tratada.xlsx")