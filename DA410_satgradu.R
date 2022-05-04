# The first three columns are the SAT scores on the 3 tests,
# the last column (called gradu) is an indicator of whether the student successfully graduated
# (1 = graduated, 0 = did not graduate)
# Using the built-in lda function in the MASS package # for linear discriminant analysis:
library(MASS)

satgradu <- read.table("satgradu.txt")
attach(satgradu)

# assuming equal (1=graduated, 0=did not graduate)
#  prior probabilities of graduating or not:
dis <- lda((gradu ~ math + reading + writing), data=satgradu, prior=c(0.5, 0.5))

# a1, a2, a3 are given as "Coefficients of linear discriminants"
# Let's predict whether a new applicant with
# SAT scores of: math = 550, reading = 610, writing = 480 # will graduate:
newobs <- rbind(c(550,610,480))
dimnames(newobs) <- list(NULL,c('math','reading', 'writing'))
newobs <- data.frame(newobs)
predict(dis,newdata=newobs)$class

# Posterior probabilities of this applicant being in each group: predict(dis,newdata=newobs)$posterior
# Making predictions for several new individuals at once:
newobs <- rbind(c(300,420,280), c(510,480,470), c(780,760,710))
dimnames(newobs) <- list(NULL,c('math','reading', 'writing'))
newobs <- data.frame(newobs)
predict(dis,newdata=newobs)

# assuming prior probabilities of graduating is about twice as large # as probability of not graduating:
# dis <- lda(gradu ~ math + reading + writing, data=satgradu, prior=c(0.33, 0.67))
# If we do not specify any prior probabilities, it will by default use the proportions
# of the sampled individuals that are in each group as the prior probabilities.
dis2 <- lda(gradu ~ math + reading + writing, data=satgradu)
dis2

