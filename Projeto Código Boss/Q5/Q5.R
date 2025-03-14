set.seed(1520)

amostra<-rexp(532, 0.14) #Generate random distribution with given seed

FD=ecdf(amostra) #Get distribution function

ev = FD(2.0) #Empirical value

tv = pexp(2.0, rate=0.14, log=FALSE) #Theoric value

#Diference:
dif=tv-ev

#With 6 decimal places
format(round(dif, 6), nsmall=6)