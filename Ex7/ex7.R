set.seed(151)

medias=c()

for(i in 1:6435)
{
  amostra<-rbinom(153, 1, 0.37)
  medias<-append(medias, mean(amostra))
}

#Media das medias
ve = mean(medias)

#Media teorica
vt = 1*0.37

#Diferenca
dif=vt - ve

#With 6 decimal places
format(round(dif, 6), nsmall=6)