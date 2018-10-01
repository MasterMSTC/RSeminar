# "plyr" package installation.
# It is only needed once in your R installation.
install.packages("plyr")

# Load "plyr" package.
# It is needed in every R session thar uses functions from that
# package.
library(plyr)

datos <- data.frame(color=c(rep("blanco", 3), rep("rojo", 2), rep("verde", 5)),
                    valor=c(1, 3, 2, 5, 2, 1, 2, 4, 5, 6),
                    stringsAsFactors=F)
datos
# We modify the order of the rows, to emphasize how the aggregation works.
datos <- datos[order(datos$valor),]
datos
# Aggregation ("GROUP BY")
result <- ddply(datos, "color",
                function(X) data.frame(ncasos=nrow(X), sumvalor=sum(X$valor)))
result
# There is a special function to make aggregations.
result <- ddply(datos, "color",
                summarize, ncasos=length(valor), sumvalor=sum(valor))
result
# There is a special function to add new aggregated fields
# to the original data ("GROUP BY" followed by a "JOIN")
result <- ddply(datos, "color", transform, sumvalor=sum(valor))
result
