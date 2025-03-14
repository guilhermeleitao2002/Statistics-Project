library(ggplot2)

set.seed(674)

aaNC=c()                                #Non contaminated amplitude averages
aaC=c()                                   #Contaminated amplitude averages
n <- seq(from = 100, to = 2500, by = 100) #N values
alpha <- 0.03

for(i in n)
{
  amp=c()               #Non contaminated amplitudes
  ampC=c()              #Contaminated amplitudes
  for(j in 1:550)
  {
    amostraC<-rexp(0.2*i, 0.05)           #Generate 20% of contaminated sample
    amostra<-rexp(0.8*i, 2.02)        #Generate 80% of non contaminated sample
    amostraC<- append(amostraC, amostra) #Finish contaminated sample
    amostra <- append(amostra, rexp(0.2*i, 2.02)) #Finish non contaminated sample
    lambda_mle <- 1/mean(amostra)
    
    lower = (mean(amostraC) - qnorm(alpha/2, mean = 0, sd = 1) * sqrt(var(amostraC)/i))**-1
    upper = (mean(amostraC) - qnorm(1 - (alpha/2), mean = 0, sd = 1) * sqrt(var(amostraC)/i))**-1
    ampC<-append(ampC, upper - lower)             #Get contaminated amplitude 
    
    lower <- lambda_mle * (1 - (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(i))
    upper <- lambda_mle * (1 + (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(i))
    amp<-append(amp, upper - lower)               #Get non contaminated amplitude
  }
  aaNC<-append(aaNC, mean(amp))
  aaC<-append(aaC, mean(ampC))
}

#Build Plot
ggplot()+
  geom_point(aes(n, aaNC, color="Não contaminada"), size=2)+
  geom_point(aes(n, aaC, color="Contaminada"), size=2)+
  scale_color_manual(name="Amostra", values=c("Não contaminada"="red", "Contaminada"="blue"))+
  labs(title = "Variação da amplitude de intervalos de confiança", x = "Dimensão", y = "Amplitude")