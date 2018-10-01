# General options.
options(digits=15)
options(scipen=999)

# "data.table" package installation, if it hasn't been installed before.
install.packages("data.table")

# Load "data.table" and "plyr" packages.
library(data.table)
library(plyr)

# Load and select input data fields.
load("cell2grid")
cell2grid <- cell2grid[, c("ci", "gridid", "area", "lu_area")]
cell2grid[1:10,]
nrow(cell2grid)

# Select records. 
cell2grid_dt <- data.table(cell2grid, key="ci")
system.time(out <- cell2grid[cell2grid$ci == "065534003281",])
system.time(out1_dt <- cell2grid_dt[cell2grid_dt$ci == "065534003281",])
system.time(out1_dt <- cell2grid_dt[cell2grid_dt$ci == "065534003281"])
system.time(out2_dt <- cell2grid_dt[data.table(ci="065534003281", key="ci"),])
system.time(out2_dt <- cell2grid_dt[data.table(ci="065534003281", key="ci")])

# Merge (join).
dt_1 <- data.table(var1=c(1,2,4), var2=c("pepe", "juan", "pedro"), key="var1")
dt_2 <- data.table(var1=c(1,2,3), var3=c("garcía", "rodríguez", "gómez"),
                   key="var1")
dt_1
dt_2
dt_1[dt_2]
dt_2[dt_1]
dt_2[dt_1, nomatch=0]
dt_1[dt_2, nomatch=0]
sub_full1 <- dt_1[dt_2]
sub_full2 <- dt_2[dt_1][, list(var1, var2, var3)]
sub_full1
sub_full2
unique(rbindlist(list(sub_full1, sub_full2)))

# Select records and fields.
cell2grid[cell2grid$ci == "065534003281", c("ci", "gridid", "lu_area")]
somefields <- c("ci", "gridid", "lu_area")
cell2grid[cell2grid$ci == "065534003281", somefields]
cell2grid_dt[cell2grid_dt$ci == "065534003281", c("ci", "gridid", "lu_area")]
cell2grid_dt[cell2grid_dt$ci == "065534003281", somefields]
cell2grid_dt[cell2grid_dt$ci == "065534003281", somefields, with=F]
cell2grid_dt[cell2grid_dt$ci == "065534003281", list(ci, gridid, lu_area)]
cell2grid_dt[cell2grid_dt$ci == "065534003281",
             list(newci=ci, newgridid=gridid, newlu_area=lu_area)]

# Make computations on different parts of the data (map and reduce)
# Group and summarize.
part_cell2grid <- cell2grid[1:1000000,]
part_cell2grid_dt <- data.table(part_cell2grid, key="ci")
system.time(out <- ddply(part_cell2grid, "ci", summarise,
                         ngrid=length(gridid)))
out[1:10,]
system.time(out_dt <- part_cell2grid_dt[, list(ngrid=length(gridid)), by="ci"])
out_dt
# Transform data. Add new fields obtained from computations made on
# different data groups.
part_cell2grid <- cell2grid[1:100000,]
part_cell2grid_dt <- data.table(part_cell2grid, key="ci")
system.time(out <- ddply(part_cell2grid, "ci", transform,
                         factor=area / sum(area),
                         lu_factor=lu_area / sum(lu_area)))
out[1:10,]
system.time(out_dt1 <- part_cell2grid_dt[, list(gridid=gridid,
                                                ngrid=length(gridid),
                                                area=area,
                                                lu_area=lu_area,
                                                factor=area / sum(area),
                                                lu_factor=lu_area / sum(lu_area)),
                                         by=ci])
out_dt1

# Now, using the whole data set. Two data "transform" and one "JOIN" of
# both "transform" results.
# First "transform".
system.time(out_dt2 <- cell2grid_dt[, list(gridid=gridid,
                                           ngrid=length(gridid),
                                           area=area,
                                           lu_area=lu_area,
                                           factor=area / sum(area),
                                           lu_factor=lu_area / sum(lu_area)),
                                    by=ci])
out_dt2
# "key" modification and second "transform".
setkey(cell2grid_dt, gridid)
system.time(out_dt3 <- cell2grid_dt[, list(ci=ci, nci=length(ci),
                                           invfactor=area / sum(area)),
                                    by=gridid])
out_dt3
# New "key" for both tables, then "JOIN" them.
# The "key" can have more than a "field", like in this case.
setkey(out_dt2, ci, gridid)
setkey(out_dt3, ci, gridid)
# We join both tables. We can control which fields are in the output,
# their names and their order.
system.time(cell2grid_lookup <- out_dt3[out_dt2,])
cell2grid_lookup
system.time(cell2grid_lookup <- out_dt3[out_dt2,][, list(ci, gridid, ngrid,
                                                         nci, area, lu_area,
                                                         factor, lu_factor,
                                                         invfactor)])
cell2grid_lookup
