
## Reading the data from the table
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

## Creating a subset of data for the 2 days we are looking for '1/2/2007' and '2/2/2007'
subset_data <-household_power_consumption[which( household_power_consumption$Date =="1/2/2007"| household_power_consumption$Date == "2/2/2007"),]

## converting the column to proper type
subset_data <- mutate(subset_data,DateTime = paste(Date,Time,sep = " " ))
subset_data$DateTime <- as.POSIXct(subset_data$DateTime, format="%d/%m/%Y %H:%M:%S")

## set the output file and format
png("./plot2.png", width = 480, height = 480)

## create the graph to output
plot(x = subset_data$DateTime, y = subset_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

## close output
dev.off()