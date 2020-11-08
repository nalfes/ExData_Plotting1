## Reading the data from the table
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

## Creating a subset of data for the 2 days we are looking for '1/2/2007' and '2/2/2007'
subset_data <-household_power_consumption[which( household_power_consumption$Date =="1/2/2007"| household_power_consumption$Date == "2/2/2007"),]
library(dplyr)
## converting the column to proper type
subset_data <- mutate(subset_data,DateTime = paste(Date,Time,sep = " " ))


## Histogram drawing

png(file="./plot1.png",
    width=480, height=480)
with(subset_data, hist(Global_active_power, col = "red", main = "Histogram of Global Active Power",xlab = "Global Active Porwer (kilowatts)"))
dev.off()
