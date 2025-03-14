library("openxlsx")
library("tidyverse")

#Set directory to current folder
setwd(getwd())

#Import data and separate columns
Pacientes_data <- read.xlsx("src/HFC.xlsx", sheet=1, colNames=TRUE, rowNames=FALSE, cols=1, rows=1:300)
Pacientes_data <- separate(Pacientes_data, col=1, into=c("Idade", "Anemia","Creatina fosfoquinase", "Diabetes", "Fracao de ejecao", "Hipertensao arterial", "Plaquetas",  "Creatinina serica", "Sodio", "Sexo", "Fumador", "Tempo", "Morte" 
), sep=",")

#Plot
ggplot(Pacientes_data, aes(x=Idade, fill=Morte, color=Morte))+
  geom_bar(position="identity", alpha=0.2, stat="count")+
  theme_bw()+
  theme(legend.position = "right", legend.title = element_text(face = "bold", size = 12), legend.text = element_text(size = 10), legend.box.background = element_rect(color="black", size=1.2))+
  labs(title = "Mortes por idade em pacientes com insuficiencia cardiaca", x = "Idade", y = "Quantidade")