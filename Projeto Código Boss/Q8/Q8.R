set.seed(96)

amp=c()
cfi=c()

for(i in 1:1250)
{
  amostra<-rnorm(1142, 9.72, 1.52)                   #Generate sample
  cfi = t.test(amostra, conf.level=0.97)$"conf.int"  #Get confidence level
  amp<-append(amp, cfi[2]-cfi[1])                    #Get amplitude
}

#Mean of the amplitudes
res=mean(amp)

#With 6 decimal places
format(round(res, 6), nsmall=6)