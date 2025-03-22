mtcars
dim(mtcars)
names(mtcars)
mtcars$cyl
row.names.data.frame(mtcars)
teste<-c("Dodge Challenger","Mazda RX4")
teste
match(teste,row.names.data.frame(mtcars))
mtcars[match(teste,row.names.data.frame(mtcars)),c(2,4,10)]

mtcars
mtcars[c(1,3,4),]
mtcars[,c(1,5,6)]
mtcars[c(1,3,4),c(1,5,6)]

which(mtcars$gear==3|mtcars$gear==4) # Localizando os valores 3 ou 4
which(mtcars$gear>2&mtcars$gear<5)   # Localizando os valores maiores que 2 e menores que 5

mtcars[which(mtcars$gear==3|mtcars$gear==4), ]