library(ggplot2)

set.seed(996)

ma=c()  #Store Amplitude averages
nv=c()   #Store n values

for(i in 1:50)
{
  amp=c() #Store amplitudes
  n=i*100
  nv<-append(nv, n)
  for(j in 1:1350)
  {
    amostra<-rnorm(n, 10.11, 1.77)                     #Generate sample
    cfi = t.test(amostra, conf.level=0.95)$"conf.int"  #Get confidence level
    amp<-append(amp, cfi[2]-cfi[1])                    #Get amplitude
  }
  ma<-append(ma, mean(amp))
}

data<-data.frame(nv, ma)
#Plot
ggplot(data, aes(nv, ma))+
  geom_point(color="dodgerblue2", size=1.5)+
  labs(title = "Variacao da amplitude de intervalos de confianca", x = "Dimensao da amostra", y = "Amplitude dos intervalos de confianca")+
  theme_bw()