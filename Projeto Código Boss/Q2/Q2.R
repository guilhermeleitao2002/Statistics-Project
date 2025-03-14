library("openxlsx")
library("tidyverse")

#Set directory to current folder
setwd(getwd())

#Import data and separate columns
Pacientes_data <- read.xlsx("src/HFC.xlsx", sheet=1, colNames=TRUE, rowNames=FALSE, cols=1, rows=1:300)
Pacientes_data <- separate(Pacientes_data, col=1, into=c("Idade", "Anemia","Creatina fosfoquinase", "Diabetes", "Fracao de ejecao", "Hipertensao arterial", "Plaquetas",  "Creatinina serica", "Sodio", "Sexo", "Fumador", "Tempo", "Morte" 
), sep=",")

#Plot
ggplot(Pacientes_data, aes(as.numeric(Idade), fill=Morte, color=Morte))+
  geom_histogram(binwidth=5, alpha=0.3)+
  theme_bw()+
  theme(legend.position="none")+
  labs(title = "Estado de pacientes com insuficiencia cardiaca", x = "Idade", y = "Quantidade")+
  facet_wrap(vars(Morte), nrow=2, ncol=1, labeller=as_labeller(c("0"="Sobrevivente", "1"="Falecido")))