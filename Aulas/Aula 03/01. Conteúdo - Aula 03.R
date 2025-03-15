#Aula 003

#ordenacao de vetores
x <- c(4,7,6,5,6,7) 	#vetor
sum(x) 				        # soma vetor
rev(x) 				        #inverte o vetor
sort (x) 				      #ordena em ordem crescente
sort (x, decreasing = T) 			#ordena em ordem decrescente
order (x) 				    #retorna a posicao dos valores ordenados
rank (x) 				      #determina o rank onde x,5 esta empatado com outro valor

which (x==max(x)) 		#retorna todas as posicoes dos valores max
which (x==min(x)) 		#retorna todas as posicoes dos valores min
which (x == 7)  			# retorna a posicao do valor 7
which.max(x)    			# retorna a posicao do primeiro valor maximo 
which.min(x)    		  # retorna a posicao do primeiro valor minimo

x
unique(x)                               			#retorna os elementos de um vetor sem repetir    
match(x,unique(x))                      		#localiza em um vetor x o elemento sugerido no caso "unique(x)"
tabulate(match(x,unique(x)))            		#tabula os valores encontrados
which(tabulate(match(x,unique(x)))==max(tabulate(match(x,unique(x)))))   #verifica posição de todos com valor maximo 
unique(x)[which(tabulate(match(x,unique(x)))==max(tabulate(match(x,unique(x)))))]