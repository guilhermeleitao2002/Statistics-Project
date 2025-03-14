library("ggplot2")
library("openxlsx")

#Import Data
ResiduosPerCapita <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estatística/Projeto/Ex1/ResiduosPerCapita.xlsx",
                               rows = c(26, 38, 21), cols = 1:3, colNames = FALSE)

#Name Columns For Easier Reference
colnames(ResiduosPerCapita) <- c('Países', '2004', '2018')

#Build Frame From Data Imported
residuospercapita <- data.frame(
  Países <- rep(ResiduosPerCapita$Países, 2),
  Valores <- c(ResiduosPerCapita$`2004`, ResiduosPerCapita$`2018`),
  Anos <- c(rep('2004', 3), rep('2018', 3))
)

#Build Bar Plot
ggplot(data = residuospercapita, aes(x = Países, y = Valores, fill = Anos)) + 
  geom_bar(position = 'dodge', stat = 'identity') + labs(y = "toneladas por pessoa") +
  labs(title = "Resíduos Per Capita")