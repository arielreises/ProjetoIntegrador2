# --------------------------------------------------
# Aluno: Ariel Ladislau Reises
# Disciplina: Projeto Integrador II
# Aula 02
# Conteúdo:
# Operadores Lógicos e Aritiméticos, Funções e Vetores
# --------------------------------------------------

# Primeiro, a funçãozinha pra calcular a média
calcular_media <- function(vetor) {
  soma <- 0
  for (i in vetor) {
    soma <- soma + i
  }
  media <- soma / length(vetor)
  return(media)
}

# Depois, a função pra calcular a mediana
calcular_mediana <- function(vetor) {
  vetor <- sort(vetor)  # Usando o sort pra organizar os dados em ordem crescente
  n <- length(vetor) # Usando o lenght
  
  # Se o número de elementos for ímpar, a mediana é o valor do meio
  if (n %% 2 != 0) {
    mediana <- vetor[(n + 1) / 2]
  } else {
    # E quando for par, a mediana é a média dos dois valores do meio
    mediana <- (vetor[n / 2] + vetor[(n / 2) + 1]) / 2
  }
  
  return(mediana)
}

# Dados passados no slide
x <- c(2, 2, 5, 7, 8, 9, 20)
y <- c(3, 3, 4, 5, 5, 7, 8, 9, 9, 14)
z <- c(2.34, 4.56, 5.35, 6.45)

# Criando as variáveis pra guardar os dados da média e da mediana para cada vetor, e puxando a função
media_x <- calcular_media(x)
mediana_x <- calcular_mediana(x)

media_y <- calcular_media(y)
mediana_y <- calcular_mediana(y)

media_z <- calcular_media(z)
mediana_z <- calcular_mediana(z)

# Mostando os resultados (usei o cat ao invés do print pra deixar o código mais limpo e organizado)

print("Projeto Integrador II - Aula 02")
print("Aluno: Ariel Ladislau Reises")

cat("Média e Mediana de x: \n")
cat("Média: ", media_x, "\n")
cat("Mediana: ", mediana_x, "\n")

cat("\nMédia e Mediana de y: \n")
cat("Média: ", media_y, "\n")
cat("Mediana: ", mediana_y, "\n")

cat("\nMédia e Mediana de z: \n")
cat("Média: ", media_z, "\n")
cat("Mediana: ", mediana_z, "\n")
