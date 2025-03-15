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

# Tabela 1
media_tabela1 <- weighted.mean(tabela1$Xi, tabela1$fi)

# Tabela 2
media_tabela2 <- weighted.mean(tabela2$Xi, tabela2$fi)

# Tabela 3
media_tabela3 <- weighted.mean(tabela3$Xi, tabela3$fi)

calcular_moda <- function(tabela) {
  moda <- tabela$Xi[which.max(tabela$fi)]
  return(moda)
}

# Tabela 1
moda_tabela1 <- calcular_moda(tabela1)

# Tabela 2
moda_tabela2 <- calcular_moda(tabela2)

# Tabela 3
moda_tabela3 <- calcular_moda(tabela3)


calcular_mediana <- function(tabela) {
  valores_expandidos <- rep(tabela$Xi, tabela$fi)
  mediana <- median(valores_expandidos)
  return(mediana)
}

# Tabela 1
mediana_tabela1 <- calcular_mediana(tabela1)

# Tabela 2
mediana_tabela2 <- calcular_mediana(tabela2)

# Tabela 3
mediana_tabela3 <- calcular_mediana(tabela3)

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
