library("ggplot2")
library("openxlsx")

#Import Data
QualidadeAr <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estatística/Projeto/Ex3/QualidadeARO3.xlsx",
                         cols = c(3, 9), colNames = TRUE)

#Build Frame From Data Imported
qualidadear <- data.frame(
  Estacoes <- c(rep("Estarreja", 8784), rep("Sobreiras-Porto", 8784)),
  Valores <- c(as.numeric(QualidadeAr$Estarreja), as.numeric(QualidadeAr$`Sobreiras-Porto`))
)

#Build Time Plot
ggplot(data = qualidadear, aes(x = Valores, color = Estacoes)) +
  geom_histogram(binwidth = 10) +
  labs(y = "Frequência", x = "Valores ??g/m³", title = "Qualidade do Ar") +
  scale_color_manual(name = "Estações", values = c("Estarreja" = "red", "Sobreiras-Porto" = "green"))