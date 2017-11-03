## Getting, subseting and adjusting the data for all the graph.

library(crayon)
complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
plot4_data <- subset(complete_data, complete_data$Date == "1/2/2007")
plot4_data <- rbind(plot4_data, subset(complete_data, complete_data$Date == "2/2/2007"))
plot4_data$Date <- as.character(plot4_data$Date)
plot4_data$Time <- as.character(plot4_data$Time)
plot4_data$datetime <- plot4_data$Date %+% " " %+% plot4_data$Time
plot4_data$datetime <- strptime(plot4_data$datetime, format = "%d/%m/%Y %H:%M:%S")
plot4_data$Global_active_power <- as.character(plot4_data$Global_active_power)
plot4_data$Global_active_power <- as.numeric(plot4_data$Global_active_power)
plot4_data$Global_reactive_power <- as.character(plot4_data$Global_reactive_power)
plot4_data$Global_reactive_power <- as.numeric(plot4_data$Global_reactive_power)
plot4_data$Voltage <- as.character(plot4_data$Voltage)
plot4_data$Voltage <- as.numeric(plot4_data$Voltage)
plot4_data$Sub_metering_1 <- as.character(plot4_data$Sub_metering_1)
plot4_data$Sub_metering_1 <- as.numeric(plot4_data$Sub_metering_1)
plot4_data$Sub_metering_2 <- as.character(plot4_data$Sub_metering_2)
plot4_data$Sub_metering_2 <- as.numeric(plot4_data$Sub_metering_2)
plot4_data$Sub_metering_3 <- as.character(plot4_data$Sub_metering_3)
plot4_data$Sub_metering_3 <- as.numeric(plot4_data$Sub_metering_3)

## Ploting the data

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(plot4_data, {
  plot(datetime, Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(datetime, Voltage, type = "l")
  plot(datetime, Sub_metering_1, type = "l",
       xlab = "", ylab = "Energy sub metering")
  points(datetime, Sub_metering_2, type = "l", col = "red")
  points(datetime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = 1, col = c("black", "red", "blue"), bty = "n")
  plot(datetime, Global_reactive_power, type = "l")
})
dev.off()