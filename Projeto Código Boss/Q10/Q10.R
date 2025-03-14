library(ggplot2)

set.seed(369)

maNC=c()  #Store non-contaminated amplitude averages
maC=c()   #Store contaminated amplitude averages
nv=c()    #Store n values

for(i in 1:50)
{
  ampNC=c() #Store non-contaminated amplitudes
  ampC=c()  #Store contaminated amplitudes
  n=i*100
  nv<-append(nv, n)
  contaminationN=0.3*n    #Number of contaminated observations
  for(j in 1:950)
  {
    amostraC<-rnorm(contaminationN, 15, 2.31)                  #Generate contaminated sample
    
    amostra<-rnorm(n-contaminationN, 9.11, 2.31)               #Generate 70% of non-contaminated sample
    
    amostraC=append(amostraC, amostra)                         #Finish contaminated sample
    
    cfi = t.test(amostraC, conf.level=0.99)$"conf.int"         #Get contaminated confidence level
    ampC<-append(ampC, cfi[2]-cfi[1])                          #Get contaminated amplitude 
    
    amostra=append(amostra, rnorm(contaminationN, 9.11, 2.31)) #Finish non-contaminated sample
    
    cfi = t.test(amostra, conf.level=0.99)$"conf.int"          #Get non-contaminated confidence level
    ampNC<-append(ampNC, cfi[2]-cfi[1])                        #Get non-contaminated amplitude
  }
  maNC<-append(maNC, mean(ampNC))
  maC<-append(maC, mean(ampC))
}

data<-data.frame(nv, maNC, maC)
#Plot
ggplot(data, aes())+
  geom_point(aes(nv, maNC, color="Nao contaminada"), size=1.5)+
  geom_point(aes(nv, maC, color="Contaminada"), size=1.5)+
  scale_color_manual(name="Amostra", values=c("Nao contaminada"="dodgerblue2", "Contaminada"="firebrick3"))+
  labs(title = "Variacao da amplitude de intervalos de confianca", x = "Dimensao da amostra", y = "Amplitude dos intervalos de confianca")+
  theme_bw()+
  theme(legend.position="right", legend.title=element_text(face="bold", size=12), legend.text=element_text(size = 10), legend.box.background=element_rect(color="black", size=1.2))