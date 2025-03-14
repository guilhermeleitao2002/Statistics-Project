library("ggplot2")

set.seed(941)
lambda <- 2.36
cfiaa <- c() #confidence interval average amplitude
alpha <- 0.06

n <- seq(from = 100, to = 5000, by = 100)

for(i in n)
{
  amps <- c()
  for(j in 1:500)
  {
    amostra<-rexp(i, lambda)  #Generate sample
    lambda_mle <- 1/mean(amostra)
    lower <- lambda_mle * (1 - (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(i))
    upper <- lambda_mle * (1 + (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(i))
    amps<-append(amps, upper - lower) #Get amplitude (using CLT)
  }
  cfiaa <- append(cfiaa, mean(amps)) #Getting the average of the amplitudes
}

#Build Data Frame
av <- data.frame(
  dim <- n,
  amp <- cfiaa
)

#Build Plot
ggplot(data = av, aes(x = dim, y = amp)) +
  geom_point(color = "blue") +
  labs(x = "Dimensão", y = "Amplitude", title = "Amplitude dos intervalos de confiança em função da dimensão da amostra")
