library("ggplot2")
library("openxlsx")

#Import data
Utentes <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estatística/Projeto/Ex4/Utentes.xlsx", sheet = 1, colNames = TRUE, cols = c(2, 4))

#Plot
ggplot(Utentes, aes(x = Colesterol, y = TAD)) +
  geom_point(size=1, color="red") +
  geom_smooth(method=lm, se=FALSE) +
  labs(title = "TAD em Função do Colesterol", x = "Colesterol", y = "TAD")