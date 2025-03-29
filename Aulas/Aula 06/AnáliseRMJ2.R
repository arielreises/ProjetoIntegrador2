# Carrega as bibliotecas necessárias
library(readxl)
library(dplyr)
library(ggplot2)

# Carrega os dados do Excel e CSV
rm_jundiai <- read_excel("C:/Users/User/Documents/GitHub/ProjetoIntegrador2/Aulas/Aula 06/database/RM JUNDIAI.xlsx") 
populacao_data <- read.csv("C:/Users/User/Documents/GitHub/ProjetoIntegrador2/Aulas/Aula 06/database/estimativa_pop_idade_sexo_esp.csv", sep = ";")

# Verifica os primeiros registros
head(rm_jundiai)
head(populacao_data)

# Lista de cidades da RM Jundiaí
cidades_rmj <- rm_jundiai$CIDADE 

# Filtra apenas as cidades da RM Jundiaí
populacao_rmj <- populacao_data %>% filter(nome_mun %in% cidades_rmj)
head(populacao_rmj)

# Filtragem simples por município: Jundiaí
populacao_jundiai <- populacao_rmj %>% filter(nome_mun == "Jundiaí")
head(populacao_jundiai)

# Seleção de colunas específicas
populacao_selecionada <- populacao_rmj %>% select(nome_mun, sexo, populacao)
head(populacao_selecionada)

# Filtragem composta: ano de 2023 e apenas 'Mulheres'
populacao_mulheres_2023 <- populacao_rmj %>% filter(ano == 2023, sexo == "Mulheres")
head(populacao_mulheres_2023)

# Criando uma nova coluna "milhares"
populacao_rmj <- populacao_rmj %>% mutate(milhares = populacao / 1000)
head(populacao_rmj)

# Ordenação decrescente e listagem dos 10 maiores registros
top_10_populacao <- populacao_rmj %>% arrange(desc(populacao)) %>% head(10)
top_10_populacao

# Agrupamento por município e somatório da população (2023)
populacao_por_municipio <- populacao_rmj %>% filter(ano == 2023) %>% group_by(nome_mun) %>% summarise(populacao_total = sum(populacao))
populacao_por_municipio

# Cálculo da média da população por faixa etária (2023)
populacao_media_idade <- populacao_rmj %>% filter(ano == 2023) %>% group_by(idade) %>% summarise(media_populacao = mean(populacao))
populacao_media_idade

# Contagem de registros por sexo
contagem_sexo <- populacao_rmj %>% count(sexo)
contagem_sexo

# Filtro por população mínima de 5000
populacao_maior_5000 <- populacao_rmj %>% filter(populacao > 5000)
head(populacao_maior_5000)

# Renomeação da coluna nome_mun para municipio
populacao_rmj <- populacao_rmj %>% rename(municipio = nome_mun)
head(populacao_rmj)

