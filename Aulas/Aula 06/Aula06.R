dados<-mtcars

# Recortar colunas
dados1<-dados[,c(1,2)]
dados1

dados2<-dados[,c(6,7)]
dados2

# Exibir nomes e dimensões
names(dados1)
dim(dados1)

names(dados2)
dim(dados2)

# Colar linhas em novo dataframe
dados3<-cbind.data.frame(dados1,dados2)
dados3

# Recortar linhas
dados4<-dados[c(1:6),]
dados4

dados5<-dados[c(10:22),]
dados5

# Colar linhas
dados6<-rbind.data.frame(dados4,dados5)
dados6

# Filtrando cyl = 6
dados$cyl==6
dados[dados$cyl==6,]

# Filtrando cyl = 4
dados$cyl==4
dados[dados$cyl==4,]

# Filtrando cyl = 4 e cyl = 6
dados[dados$cyl==6|dados$cyl==4,]

