library(tidyverse)
library(actuar)

## 3. Non-life insurance
# 3.1 Distribution ----
## Frequency   Eg. Poison distribution
plot(dpois(1:20, 3), type = 'b')

## Size  Eg. Ganmma distribution
### Gamma is used for thin tail
plot(dgamma(1:20, 12, 2), type = 'b')

# 3.2 Model estimation ----
## MLE
library(MASS)

data(dental)
hist(dental)
fitdistr(dental, 'gamma')

data <- rgamma(500, shape=12, rate=2)
hist(data)
fitdistr(data, 'gamma')

# 3.3 Aggregated distribution model by simulation ----
hist(rpois(n=1000, lambda=3))
hist(rgamma(n=1000, shape=100, rate=2))

model.freq <- expression(data = rpois(3))
model.sev <- expression(data = rgamma(100, 2))
Fs <- aggregateDist("simulation", nb.simul = 1000,
                    model.freq, model.sev)
mean(Fs)
plot(Fs)

## TVaR
CTE(Fs)


