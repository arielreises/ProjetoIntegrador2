# ------------------------------------------------------------
# Tutorial dplyr com o dataset mtcars
# ------------------------------------------------------------

# Instala e carrega o pacote dplyr
# install.packages("dplyr")  # Execute esta linha apenas uma vez
library(dplyr)

# Visualizando as primeiras linhas do dataset mtcars
head(mtcars)

# ------------------------------------------------------------
# Funções principais do dplyr:
# - filter(): filtrar linhas
# - select(): selecionar colunas
# - mutate(): criar novas colunas
# - arrange(): ordenar linhas
# - summarise(): resumir dados
# - group_by(): agrupar dados
# - %>% : encadeia operações (pipe)
# ------------------------------------------------------------

# 1. Selecionar colunas
mtcars %>%
  select(mpg, cyl)

# 2. Filtrar linhas
mtcars %>%
  filter(cyl > 6)

mtcars %>%
  filter(mpg > 20, cyl == 4)

# 3. Criar novas colunas com mutate
mtcars %>%
  mutate(km_litro = mpg * 0.4251)

# 4. Ordenar linhas com arrange
mtcars %>%
  arrange(mpg)  # ordem crescente

mtcars %>%
  arrange(desc(mpg))  # ordem decrescente

# 5. Resumo simples com summarise
mtcars %>%
  summarise(media_mpg = mean(mpg))

# 6. Agrupar e resumir
mtcars %>%
  group_by(cyl)%>%
  summarise(media_mpg = mean(mpg))

mtcars %>%
  group_by(am) %>%
  summarise(qtd = n())

#Useful functions
#Center: mean(), median()
#Spread: sd(), IQR(), mad()
#Range: min(), max(),
#Position: first(), last(), nth(),
#Count: n(), n_distinct()
#Logical: any(), all()


# 7. Encadeando múltiplas operações
mtcars %>%
  filter(mpg > 20) %>%
  mutate(km_litro = mpg * 0.4251) %>%
  group_by(cyl) %>%
  summarise(media_km_l = mean(km_litro))

# 8. Renomear colunas
mtcars %>%
  rename(milhas_por_galao = mpg)

# ------------------------------------------------------------
# Fim do tutorial dplyr com mtcars
# ------------------------------------------------------------

