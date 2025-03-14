set.seed(63)

amp=c()

# variáveis do enunciado
m <- 1300
n <- 1194
lambda <- 2.42
alpha <- 0.08 # não é o 1 - alpha, é o alpha

for(i in 1:m)
{
  amostra<-rexp(n, lambda)                          #Generate sample
  lambda_mle <- 1/mean(amostra)
  lower <- lambda_mle * (1 - (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(n))
  upper <- lambda_mle * (1 + (qnorm(1-(alpha/2), mean = 0, sd=1)) / sqrt(n))
  amp<-append(amp, upper - lower)                    #Get amplitude
}

#Mean of the amplitudes
res=mean(amp)

#With 6 decimal places
format(round(res, 6), nsmall=6)