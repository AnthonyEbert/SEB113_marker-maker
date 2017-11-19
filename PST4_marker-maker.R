

library(dplyr)

name <- "Ace"

input <- read.csv("input/allocation.csv", header = TRUE) %>%
  filter(Marker == name)

n <- dim(input)[1]

output <- rep(NA, n)

ic <- "=(OFFSET(INDIRECT(ADDRESS(ROW(), COLUMN())), 0, -1) - 1)/6 *(OFFSET(INDIRECT(ADDRESS(ROW(), COLUMN())), 0, -2))/10"

for(i in 1:n){
  output[i] <- paste0('
                   Last Name,,,,
                   First Name,,,,
                   Student No.,',input[i,1],',,,
                   R script?,,,,
                   ,,,,
                   Section,Available Percent,Grade,Marks obtained,Notes
                   1.1 Context,5,1,"',ic,'"
                   1.2 Aim,5,1,"',ic,'"
                   2.1.1 Description,5,1,"',ic,'"
                   2.1.2 Table 1,5,1,"',ic,'"
                   2.1.3 Figure 1,5,1,"',ic,'"
                   2.2 Model,10,1,"',ic,'"
                   3.1.1 Table 2,7.5,1,"',ic,'"
                   3.1.2 Effect discussion,7.5,1,"',ic,'"
                   3.2.1 Fitted vs residuals,5,1,"',ic,'"
                   3.2.2 QQ,5,1,"',ic,'"
                   3.2.3 Are they normal?,5,1,"',ic,'"
                   3.3.1 Prediction,5,1,"',ic,'"
                   3.3.2 Confidence,5,1,"',ic,'"
                   3.3.3 Plot,5,1,"',ic,'"
                   4.1 Effect of weight,5,1,"',ic,'"
                   4.2 Prediction,5,1,"',ic,'"
                   4.3 Model improvements,5,1,"',ic,'"
                   4.4 Comparison to now,5,1,"',ic,'"
                   Total,NA,NA,NA
                   ,,,,
                   ')
}

write(paste(output, sep = ""), file = paste0("template_", name, ".csv"))

