# The first three columns are the SAT scores on the 3 tests,
# the last column (called gradu) is an indicator of whether the student successfully graduated
# (1 = graduated, 0 = did not graduate)
# Using the built-in lda function in the MASS package # for linear discriminant analysis:
library(MASS)
library(readr)

# assuming equal (1=graduated, 0=did not graduate)
#  prior probabilities of graduating or not:
#5.16a
male_psych <- psych(c('m1y1','m1y2','m1y3','m1y4'))
female_psych <- psych(c('f1y1','f1y2','f1y3','f1y4'))

both_psych <- cbind(male_psych, female_psych)

n1 <- nrow(male_psych)
n2 <- nrow(female_psych)

male_psych.means <- apply(male_psych, 2, mean)
female_psych.means <- apply(female_psych, 2, mean)

w1 <- (n1 - 1) * var(male_psych)
w2 <- (n2 - 1) * var(female_psych)

sp1 <- 1 / (n1 + n2 - 2) * (w1 + w2)

a <- solve(sp1) %*% (male_psych.means - female_psych.means)
a
#5.16b
