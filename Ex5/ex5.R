set.seed(1529)

amostra<-rexp(738, 0.37) #Generate random distribution with given seed

FD=ecdf(amostra) #Get distribution function

ev = FD(3.0) #Empirical value

tv = pexp(3.0, rate=0.37, log=FALSE) #Theoric value

#Diference:
dif=tv-ev

#With 6 decimal places
format(round(dif, 6), nsmall=6)