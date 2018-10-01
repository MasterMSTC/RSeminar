# "JOIN"-like operations.
data1 <- data.frame(id=c(1, 3, 4, 5, 7),
                    firstname=c("Juan", "Pedro", "Ana", "David", "Leire"))
data1
data2 <- data.frame(id=c(1, 2, 3, 4),
                    lastname=c("Pérez", "Bueno", "Montoya", "Vidal"))
data2
# Data existing in both tables ("INNER JOIN").
data <- merge(data1, data2, by="id")
data
# All the data exiting in the first table ("LEFT JOIN").
data <- merge(data1, data2, by="id", all.x=T)
data
# All the data existing in the second table ("RIGHT JOIN").
data <- merge(data1, data2, by="id", all.y=T)
data
# All the data exiting in any of both tables ("FULL JOIN")
data <- merge(data1, data2, by="id", all=T)
data
