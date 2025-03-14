library("ggplot2")
library("openxlsx")

#Import Data
ResiduosPerCapita <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estat�stica/Projeto/Ex1/ResiduosPerCapita.xlsx",
                               rows = c(26, 38, 21), cols = 1:3, colNames = FALSE)

#Name Columns For Easier Reference
colnames(ResiduosPerCapita) <- c('Pa�ses', '2004', '2018')

#Build Frame From Data Imported
residuospercapita <- data.frame(
  Pa�ses <- rep(ResiduosPerCapita$Pa�ses, 2),
  Valores <- c(ResiduosPerCapita$`2004`, ResiduosPerCapita$`2018`),
  Anos <- c(rep('2004', 3), rep('2018', 3))
)

#Build Bar Plot
ggplot(data = residuospercapita, aes(x = Pa�ses, y = Valores, fill = Anos)) + 
  geom_bar(position = 'dodge', stat = 'identity') + labs(y = "toneladas por pessoa") +
  labs(title = "Res�duos Per Capita")