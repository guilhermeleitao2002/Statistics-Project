set.seed(375)

medias=c()

for(i in 1:6000)
{
  amostra<-runif(37, 0, 4)
  medias<-append(medias, mean(amostra))
}

#Media das medias
ve = mean(medias)

#Media teorica
vt = (0+4)/2

#Diferenca
dif=vt - ve

#With 6 decimal places
format(round(dif, 6), nsmall=6)