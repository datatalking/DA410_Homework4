library(readr)

beetles <- read.delim ('https://raw.githubusercontent.com/zdealveindy/anadat-r/master/data/beetles.txt', row.names = 1)

# write.table(beetles_matrix, "beetles.txt", append = FALSE, sep = " ", dec = ".", row.names = TRUE, col.names = TRUE)

write_tsv(beetles, file ='beetles.txt')

beetles <- read.table('beetles.txt', col.names = c('Measurement.Number', 'Species', 'transverse.groove.dist', 'elytra.length', 'second.antennal.joint.length', 'third.antennal.joint.length'))

beetle1 <- beetles[beetles$Species == 1,][,3:6]
beetle2 <- beetles[beetles$Species == 2,][,3:6]

n1 <- nrow(beetle1)
n2 <- nrow(beetle2)

beetle1.means <- apply(beetle1, 2, mean)
beetle2.means <- apply(beetle2, 2, mean)

w1 <- (n1 - 1) * var(beetle1)
w2 <- (n2 - 1) * var(beetle2)

sp1 <- 1 / (n1 + n2 - 2) * (w1 + w2)