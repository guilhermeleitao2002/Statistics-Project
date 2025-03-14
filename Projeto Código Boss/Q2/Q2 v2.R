library("openxlsx")
library("tidyverse")

#Set directory to current folder
setwd(getwd())

#Import data and separate columns
Pacientes_data <- read.xlsx("src/HFC.xlsx", sheet=1, colNames=TRUE, rowNames=FALSE, cols=1, rows=1:300)
Pacientes_data <- separate(Pacientes_data, col=1, into=c("Idade", "Anemia","Creatina fosfoquinase", "Diabetes", "Fracao de ejecao", "Hipertensao arterial", "Plaquetas",  "Creatinina serica", "Sodio", "Sexo", "Fumador", "Tempo", "Morte" 
), sep=",")

#Plot
ggplot(Pacientes_data, aes(Idade, fill=Morte))+
  geom_bar(stat="count")+
  theme_bw()+
  theme(legend.position="none", axis.text.x=element_text(size=7))+
  labs(title = "Estado de pacientes com insuficiencia cardiaca", x = "Idade", y = "Quantidade")+
  facet_wrap(vars(Morte), nrow=1, ncol=2, labeller=as_labeller(c("0"="Sobrevivente", "1"="Falecido")))