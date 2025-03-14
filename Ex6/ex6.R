library("ggplot2")

medias=c()
nvals <- c(n1 <- 5, n2 <- 29, n3 <- 87) #store values of n

#create samples
for(i in nvals)
{
  set.seed(526)
  for(j in 1:1910)
  {
    amostra <- runif(i, 10, 14) #temporarily storing the sample
    medias<-append(medias, mean(amostra)) #adding to the average vector
  }
}

#Build Histograms
ggplot() +
  geom_histogram(aes(x = medias[1:1910], y = ..density..), color = "blue", bins = 12) +
  stat_function(fun = dnorm, args = list(mean = 12, sd = 4 / sqrt(12*n1)), col = "black", size = 2) +
  labs(title = "Amostra para n = 5", x = "Values", y = "Density")

ggplot() +
  geom_histogram(aes(x = medias[1911:3820], y = ..density..), color = "yellow", bins = 12) +
  stat_function(fun = dnorm, args = list(mean = 12, sd = 4 / sqrt(12*n2)), col = "black", size = 2) +
  labs(title = "Amostra para n = 29", x = "Values", y = "Density")

ggplot() +
  geom_histogram(aes(x = medias[3821:5730], y = ..density..), color = "red", bins = 12) +
  stat_function(fun = dnorm, args = list(mean = 12, sd = 4 / sqrt(12*n3)), col = "black", size = 2) +
  labs(title = "Amostra para n = 29", x = "Values", y = "Density")