# Lists. Data of different type and length.
onelist <- list("Fred", "Mary", 3, c(4, 7, 9))
onelist
# List indexing.
onelist[[2]]
onelist[[4]]
onelist[[4]][2]
# Names in the list elements.
# Index using names.
onelist <- list(name="Fred", wife="Mary", no.children=3, child.ages=c(4, 7, 9))
onelist
onelist$wife
onelist$child.ages
onelist$child.ages[2]
x <- "name"
onelist[[x]]
onelist[2]
# Caution!!. Difference between sub-list and list elements.
class(onelist[2])
onelist[[2]]
class(onelist[[2]])
onelist[1:2]
# You can't do this...
onelist[[1:2]]
