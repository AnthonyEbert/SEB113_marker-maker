

library(dplyr)

name <- "Ace"

input <- read.csv("input/allocation.csv", header = TRUE) %>%
	filter(Marker == name)

n <- dim(input)[1]

output <- rep(NA, n)

ic <- "=OFFSET(INDIRECT(ADDRESS(ROW(), COLUMN())), 0, -2)*(OFFSET(INDIRECT(ADDRESS(ROW(), COLUMN())), 0, -1) -1)/6"

for(i in 1:n){
  output[i] <- paste0('Last Name,,,
    First Name,,,
    Student Number,',input[i,1],',,,
    Rscript,,,
,,,,
Section, Marks available, Grade, Marks, Notes
1.1 Data description,0.5,1,"',ic,'"
1.2 Variables of interest,1.5,1,"',ic,'"
2.1 Tables (each worth 5% but grade as a whole),3.00,1,"',ic,'"
2.2.1 Univariate ,0.50,1,"',ic,'"
2.2.2 Multivariate (each worth 5% but graded as a whole),2.50,1,"',ic,'"
3.1 Continent,0.50,1,"',ic,'"
3.2 Efficiency over time,0.50,1,"',ic,'"
3.3 Efficiency vs weight,0.50,1,"',ic,'"
"3.4 Efficiency, weight, origin, cylinders",0.50,1,"',ic,'"
Total,NA,NA,NA
')
}

write(paste(output, sep = ""), file = paste0("template_", name, ".csv"))

