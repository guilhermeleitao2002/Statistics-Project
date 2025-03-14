library("ggplot2")

set.seed(1819)
Slambda=26*35

#Generate empirical data
empiricalX=c(0)

for(i in 1:35)
{
  empiricalX<- empiricalX + rpois(45, 26)
}

empiricalY=dpois(empiricalX, mean(empiricalX))

#Generate normal distribution
normalX=seq(840, 980, length=45)
normalY=dnorm(normalX, Slambda, sqrt(Slambda))

#Generate exact distribution
exactX=floor(normalX)
exactY=dpois(exactX, Slambda)

data<-data.frame(empiricalX, empiricalY, normalX, normalY)
#Plot
ggplot(data, aes())+
  geom_line(aes(exactX, exactY, color="Exata"), size=0.8)+             #Exact poisson distribution
  geom_line(aes(normalX, normalY, color="Normal"), size=0.8)+          #Approx by normal distribution
  geom_point(aes(empiricalX, empiricalY, color="Empirica"), size=1.5)+ #Poisson empirical plot
  scale_color_manual(name = "Distribuicoes", values = c("Empirica"="deepskyblue3", "Normal"="firebrick2", "Exata"="green2"))+
  labs(title = "Distribuicoes empirica, exata e aproximada de S35", x = "x", y = "y") +
  theme_bw()+
  theme(legend.position = "right", legend.title = element_text(face = "bold", size = 12), legend.text = element_text(size = 10), legend.box.background = element_rect(color="black", size=1.2))
