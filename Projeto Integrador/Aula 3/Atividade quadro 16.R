# Ariel Ladislau Reises
# Aula 003 - Quadro 16


# Inserindo as tabelas como data.frame

# Tabela 1
tabela1 <- data.frame(
  Xi = c(2, 3, 4, 5),
  fi = c(2, 3, 6, 1)
)

# Tabela 2
tabela2 <- data.frame(
  Xi = c(1, 3, 5, 7),
  fi = c(6, 3, 8, 1)
)

# Tabela 3
tabela3 <- data.frame(
  Xi = c(2, 4, 6, 8),
  fi = c(4, 5, 5, 3)
)

# Criando as funções

# Função pra calcular a média
calcular_media <- function(tabela) {
  soma_produtos <- sum(tabela$Xi * tabela$fi)
  soma_frequencias <- sum(tabela$fi)
  media <- soma_produtos / soma_frequencias
  return(media)
}

# Função pra calcular a moda
calcular_moda <- function(tabela) {
  moda <- tabela$Xi[which.max(tabela$fi)]
  return(moda)
}

# Função pra calcular a mediana
calcular_mediana <- function(tabela) {
  valores_expandidos <- rep(tabela$Xi, tabela$fi)
  valores_ordenados <- sort(valores_expandidos)
  n <- length(valores_ordenados)
  if (n %% 2 == 0) {
    mediana <- (valores_ordenados[n/2] + valores_ordenados[n/2 + 1]) / 2
  } else {
    mediana <- valores_ordenados[(n + 1) / 2]
  }
  return(mediana)
}

# Fazendo os calculos

# Calculando a Tabela 1
media_tabela1 <- calcular_media(tabela1)
moda_tabela1 <- calcular_moda(tabela1)
mediana_tabela1 <- calcular_mediana(tabela1)

# Calculando a Tabela 2
media_tabela2 <- calcular_media(tabela2)
moda_tabela2 <- calcular_moda(tabela2)
mediana_tabela2 <- calcular_mediana(tabela2)

# Calculando a Tabela 3
media_tabela3 <- calcular_media(tabela3)
moda_tabela3 <- calcular_moda(tabela3)
mediana_tabela3 <- calcular_mediana(tabela3)


# Mostrando os resultados

cat("Resultados Tabela 1:\n")
cat("Média:", media_tabela1, "\n")
cat("Moda:", moda_tabela1, "\n")
cat("Mediana:", mediana_tabela1, "\n\n")

cat("Resultados Tabela 2:\n")
cat("Média:", media_tabela2, "\n")
cat("Moda:", moda_tabela2, "\n")
cat("Mediana:", mediana_tabela2, "\n\n")

cat("Resultados Tabela 3:\n")
cat("Média:", media_tabela3, "\n")
cat("Moda:", moda_tabela3, "\n")
cat("Mediana:", mediana_tabela3, "\n")
