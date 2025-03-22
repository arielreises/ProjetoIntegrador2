library(readxl) # carregando biblioteca pra ler excel
library(dplyr) # carregando biblioteca pra manipular dados
library(ggplot2) # carregando biblioteca pra fazer os graficos

rm_jundiai <- read_excel("C:/Users/User/Documents/Projeto Integrador/Aula 5/database/RM JUNDIAI.xlsx")
populacao_data <- read.csv("C:/Users/User/Documents/Projeto Integrador/Aula 5/database/estimativa_pop_idade_sexo_esp.csv", sep = ";") # carregando o csv e mudando o separador pra ;

head(rm_jundiai) # só verificando se tá ok
head(populacao_data) # só verificando se tá ok

cidades_rmj <- rm_jundiai$CIDADE # filtrando as cidades do RMJ

populacao_rmj <- populacao_data %>%
  filter(nome_mun %in% cidades_rmj)

head(populacao_rmj) 

populacao_grupos <- populacao_rmj %>%
  mutate(grupo_idade = case_when(
    idade %in% c("00 a 04", "05 a 09", "10 a 14", "15 a 19") ~ "0 a 19",
    idade %in% c("20 a 24", "25 a 29", "30 a 34", "35 a 39", "40 a 44", "45 a 49") ~ "20 a 50",
    idade %in% c("50 a 54", "55 a 59", "60 a 64", "65 a 69", "70 a 74", "75 a 79", "80 a 84", "85 a 89", "90 e +") ~ "50+"
  )) %>%
  filter(!is.na(grupo_idade))

head(populacao_grupos) # só verificando se o agrupamento tá ok

#################### Plotando os gráficos

# plotando o grafico de total de pessoas pela faixa etária
ggplot(populacao_grupos, aes(x = grupo_idade, y = populacao, fill = sexo)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~nome_mun) +
  labs(title = "Distribuição da População por Faixa Etária e Sexo", 
       x = "Faixa Etária", 
       y = "População Total") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# graf de total de pop por sexo
ggplot(populacao_grupos, aes(x = sexo, y = populacao, fill = sexo)) +
  geom_bar(stat = "identity") +
  facet_wrap(~nome_mun) +
  labs(title = "População Total por Sexo", 
       x = "Sexo", 
       y = "População Total") +
  theme_minimal()



# faixa etária e cidade
ggplot(populacao_grupos, aes(x = grupo_idade, y = populacao, fill = grupo_idade)) +
  geom_bar(stat = "identity", position = "stack") +
  facet_wrap(~nome_mun) +
  labs(title = "Distribuição da População por Faixa Etária e Cidade", 
       x = "Faixa Etária", 
       y = "População Total") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))