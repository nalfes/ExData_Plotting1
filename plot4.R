
## Reading the data from the table
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")

## Creating a subset of data for the 2 days we are looking for '1/2/2007' and '2/2/2007'
subset_data <-household_power_consumption[which( household_power_consumption$Date =="1/2/2007"| household_power_consumption$Date == "2/2/2007"),]

## converting the column to proper type
subset_data <- mutate(subset_data,DateTime = paste(Date,Time,sep = " " ))
subset_data$DateTime <- as.POSIXct(subset_data$DateTime, format="%d/%m/%Y %H:%M:%S")

## set the output file and format
png("./plot4.png", width = 480, height = 480)

## Setting format for 4 plots on the same output
par(mfrow = c(2,2))

## creating 1st graph
plot(x = subset_data$DateTime, y = subset_data$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")

## creating 2nd graph
plot(x = subset_data$DateTime, y = subset_data$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")

## create the graph to output 3rd graph
plot(x = subset_data$DateTime, y = subset_data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(x = subset_data$DateTime, y = subset_data$Sub_metering_2,type = "l",col = "red")
lines(x = subset_data$DateTime, y = subset_data$Sub_metering_3,type = "l",col = "blue")
legend("topright",legend=colnames(subset_data[7:9]), col=c("black","red","blue"),pch=c("-","-","-"),lty=c(1,1,1), ncol=1)

##creating the 4th graph
plot(x = subset_data$DateTime, y = subset_data$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_reactive_power")

## close output
dev.off()