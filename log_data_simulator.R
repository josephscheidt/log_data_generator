##Logistic regression model simulated data generator

##Generate random x1 data using whatever distribution you like (eg rnorm, rbinom)
x1 <- rnorm(1000, mean = 0)

##Record true mean of x
mean_x <- 0

##Define b1
b1 <- 0.5

##Define desired median probability of y
p <- 0.1

##Define b0 using p, subracting mean of x
b0 <- log(p/(1-p)) - mean_x

##Generate linear combinations
z <- b0 + b1*x1

##Run through inverse logit function to create probabilities for each observation
p_vector <- 1/(1+exp(-z))

##The median value of probability vector is close to p
median(p_vector)

##But the mean value may be wildly different
mean(p_vector)

##Generate random Bernoulli response variable data using probability vector
y <- rbinom(n = length(x1), size = 1, prob = p_vector)

##Overall proportion of y=1 in sample
sum(y)/length(y)

##Estimate original parameters from sample data
model <- glm(y ~ x1, family = "binomial")
summary(model)
