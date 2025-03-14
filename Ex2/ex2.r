library("ggplot2")
library("openxlsx")

#Import Data
EsperancaVidaNascenca <- read.xlsx("C:/Users/maste/Desktop/Probabilidade e Estatística/Projeto/Ex2/EsperancaVida.xlsx",
                               rows = 51:69, cols = c(1, 43, 54, 61, 77, 88, 95), colNames = TRUE)

#Name Columns For Easier Reference
colnames(EsperancaVidaNascenca) <- c('Anos', 'CY - H', 'IE - H', 'PL - H', 'CY - M', 'IE - M', 'PL - M')

#Build Time Plot
ggplot(data = EsperancaVidaNascenca) +
  geom_line(aes(Anos, `IE - H`, linetype = "Homens", colour = "Irlanda"), size = 1) +
  geom_line(aes(Anos, `PL - H`, linetype = "Homens", colour = "Polónia"), size = 1) +
  geom_line(aes(Anos, `CY - H`, linetype = "Homens",colour = "Chipre"), size = 1) +
  geom_line(aes(Anos, `IE - M`, linetype = "Mulheres", colour = "Irlanda"), size = 1) +
  geom_line(aes(Anos, `PL - M`, linetype = "Mulheres", colour = "Polónia"), size = 1) +
  geom_line(aes(Anos, `CY - M`, linetype = "Mulheres", colour = "Chipre"), size = 1) +
  scale_color_manual(name = "Paises", values = c("Irlanda" = "green", "Polónia" = "red", "Chipre" = "blue")) +
  scale_linetype_manual(name = "Sexo", values = c("Homens" = 1, "Mulheres" = 2)) +
  labs(title = "Esperança Média de Vida", x = "Ano", y = "Esperança de Vida / anos") +
  theme(legend.position = "right", legend.title = element_text(face = "bold", size = 11),
        legend.text = element_text(size = 11))