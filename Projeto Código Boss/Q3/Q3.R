library("openxlsx")
library("ggplot2")
library("tidyr")

#Set directory to current folder
setwd(getwd())

#Import and organize data
consumo <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estatística/Projeto/Projeto Computacional/Q3/src/ConsumoFamilias.xlsx", sheet = 1, colNames = TRUE, rowNames = FALSE, cols = c(1, 28, 29, 33), rows = c(9, 10, 34))
colnames(consumo) <- c("Ano", "PT", "CZ", "NO")
consumo<-tidyr::gather(consumo, Pais, Valor, -Ano)

#Plot
consumo %>%
  mutate(Ano=as.factor(Ano)) %>%
  ggplot(mapping=aes(Pais, Valor,  fill=Ano))+
    geom_col(position="dodge")+
    labs(title = "Despesas de consumo de familias", x = "Paises", y = "Valor (milhoes de euros)") +
    theme_bw()+
    theme(legend.position = "right", legend.title = element_text(face = "bold", size = 12), legend.text = element_text(size = 10), legend.box.background = element_rect(color="black", size=1.2))
