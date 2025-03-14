library("openxlsx")
library("tidyverse")

#Set directory to current folder
setwd(getwd())

#Import data and name columns
casamentos_data <- read.xlsx("Sources/Casamentos.xlsx", sheet = 1, colNames = FALSE, rowNames = FALSE, cols = c(1, 12, 21, 30), rows = 9:68)
colnames(casamentos_data) <- c("Anos", "Casamentos_Eslováquia", "Casamentos_Itália", "Casamentos_Roménia")
divorcios_data <- read.xlsx("Sources/Divorcios.xlsx", sheet = 1, colNames = FALSE, rowNames = FALSE, cols = c(12, 21, 30), rows = 9:68)
colnames(divorcios_data) <- c("Divórcios_Eslováquia", "Divórcios_Itália", "Divórcios_Roménia")

#Merge datasets
full_data = cbind(casamentos_data, divorcios_data)

#Plot
ggplot(data = full_data,
       mapping = aes()) +
       geom_point(aes(Anos,Casamentos_Eslováquia, colour = "Eslováquia"), size = 1.5) +
       geom_line(aes(Anos,Casamentos_Eslováquia, colour = "Eslováquia", linetype = "Casamentos"), size = 0.7, alpha = 0.8) +
       geom_point(aes(Anos,Casamentos_Itália, colour = "Itália"), size = 1.5) +
       geom_line(aes(Anos,Casamentos_Itália, colour = "Itália", linetype = "Casamentos"), size = 0.7, alpha = 0.8) +
       geom_point(aes(Anos,Casamentos_Roménia, colour = "Roménia"), size = 1.5) +
       geom_line(aes(Anos,Casamentos_Roménia, colour = "Roménia", linetype = "Casamentos"), size = 0.7, alpha = 0.8) +
       geom_point(aes(Anos,Divórcios_Eslováquia, colour = "Eslováquia"), size = 1.5) +
       geom_line(aes(Anos,Divórcios_Eslováquia, colour = "Eslováquia", linetype = "Divórcios"), size = 0.7, alpha = 0.8) +
       geom_point(aes(Anos,Divórcios_Itália, colour = "Itália"), size = 1.5) +
       geom_line(aes(Anos,Divórcios_Itália, colour = "Itália", linetype = "Divórcios"), size = 0.7, alpha = 0.8) +
       geom_point(aes(Anos,Divórcios_Roménia, colour = "Roménia"), size = 1.5) +
       geom_line(aes(Anos,Divórcios_Roménia, colour = "Roménia", linetype = "Divórcios"), size = 0.7, alpha = 0.8) +
       scale_color_manual(name = "Países", values = c("Eslováquia" = "red", "Itália" = "dodgerblue3", "Roménia" = "goldenrod2")) +
       scale_linetype_manual(name = "Tipo", values = c("Casamentos" = 1, "Divórcios" = 3)) +
       labs(title = "Casamentos e Divórcios", x = "Ano", y = "Quantidade") +
       theme_bw()+
       theme(legend.position = "right", legend.title = element_text(face = "bold", size = 12), legend.text = element_text(size = 10), legend.box.background = element_rect(color="black", size=1.2))