## Getting, subseting and adjusting the data for the task.

library(crayon)
complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
plot3_data <- subset(complete_data, complete_data$Date == "1/2/2007")
plot3_data <- rbind(plot3_data, subset(complete_data, complete_data$Date == "2/2/2007"))
plot3_data$Date <- as.character(plot3_data$Date)
plot3_data$Time <- as.character(plot3_data$Time)
plot3_data$DT <- plot3_data$Date %+% " " %+% plot3_data$Time
plot3_data$DT <- strptime(plot3_data$DT, format = "%d/%m/%Y %H:%M:%S")
plot3_data$Sub_metering_1 <- as.character(plot3_data$Sub_metering_1)
plot3_data$Sub_metering_1 <- as.numeric(plot3_data$Sub_metering_1)
plot3_data$Sub_metering_2 <- as.character(plot3_data$Sub_metering_2)
plot3_data$Sub_metering_2 <- as.numeric(plot3_data$Sub_metering_2)
plot3_data$Sub_metering_3 <- as.character(plot3_data$Sub_metering_3)
plot3_data$Sub_metering_3 <- as.numeric(plot3_data$Sub_metering_3)

## Ploting the data

png("plot3.png", width = 480, height = 480)
plot(plot3_data$DT, plot3_data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
points(plot3_data$DT, plot3_data$Sub_metering_2, type = "l", col = "red")
points(plot3_data$DT, plot3_data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))
dev.off()