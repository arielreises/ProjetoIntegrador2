library(readxl) # Carrega a biblioteca para ler arquivos Excel
library(dplyr) # Carrega a biblioteca para manipulação de dados
library(ggplot2) # Carrega a biblioteca para fazer gráficos

# Carrega os dados do Excel e do CSV
rm_jundiai <- read_excel("C:/Users/User/Documents/Projeto Integrador/Aula 5/database/RM JUNDIAI.xlsx") 
populacao_data <- read.csv("C:/Users/User/Documents/Projeto Integrador/Aula 5/database/estimativa_pop_idade_sexo_esp.csv", sep = ";") # Carrega o arquivo CSV, alterando o separador para ponto e vírgula

# Verifica as primeiras linhas dos dados para garantir que foram carregados corretamente
head(rm_jundiai) 
head(populacao_data) 

# Cria uma lista com os nomes das cidades da Região Metropolitana de Jundiaí (RMJ)
cidades_rmj <- rm_jundiai$CIDADE 

# Usando o which() para filtrar os dados da população para pegar apenas as cidades que estão na RMJ
indices_rmj <- which(populacao_data$nome_mun %in% cidades_rmj)
populacao_rmj <- populacao_data[indices_rmj, ]

# Verifica se o filtro foi feito corretamente
head(populacao_rmj)

# Usando o which() para criar um novo grupo de faixa etária com base na variável "idade"
populacao_grupos <- populacao_rmj
populacao_grupos$grupo_idade <- NA  # Cria a coluna "grupo_idade" vazia inicialmente

# Aplica o agrupamento por faixa etária com which()
populacao_grupos$grupo_idade[which(populacao_grupos$idade %in% c("00 a 04", "05 a 09", "10 a 14", "15 a 19"))] <- "0 a 19"
populacao_grupos$grupo_idade[which(populacao_grupos$idade %in% c("20 a 24", "25 a 29", "30 a 34", "35 a 39", "40 a 44", "45 a 49"))] <- "20 a 50"
populacao_grupos$grupo_idade[which(populacao_grupos$idade %in% c("50 a 54", "55 a 59", "60 a 64", "65 a 69", "70 a 74", "75 a 79", "80 a 84", "85 a 89", "90 e +"))] <- "50+"

# Remove linhas com valores faltando na coluna "grupo_idade"
populacao_grupos <- populacao_grupos[!is.na(populacao_grupos$grupo_idade), ]

# Verifica se a coluna de faixa etária foi criada corretamente
head(populacao_grupos)

#################### Plotando os gráficos

# Gráfico de barras empilhadas mostrando a distribuição da população por faixa etária e sexo, para cada cidade
ggplot(populacao_grupos, aes(x = grupo_idade, y = populacao, fill = sexo)) +
  geom_bar(stat = "identity", position = "stack") + # Cria as barras empilhadas
  facet_wrap(~nome_mun) + # Cria um gráfico separado para cada cidade
  labs(title = "Distribuição da População por Faixa Etária e Sexo", # Título do gráfico
       x = "Faixa Etária", # Rótulo do eixo X
       y = "População Total") + # Rótulo do eixo Y
  theme_minimal() + # Aplica um tema minimalista
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) # Rotaciona os rótulos do eixo X para ficarem legíveis

# Gráfico de barras mostrando a população total dividida por sexo, para cada cidade
ggplot(populacao_grupos, aes(x = sexo, y = populacao, fill = sexo)) +
  geom_bar(stat = "identity") + # Cria as barras para cada sexo
  facet_wrap(~nome_mun) + # Cria um gráfico separado para cada cidade
  labs(title = "População Total por Sexo", # Título do gráfico
       x = "Sexo", # Rótulo do eixo X
       y = "População

