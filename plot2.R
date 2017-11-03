## Getting, subseting and adjusting the data for the task.

library(crayon)
complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
plot2_data <- subset(complete_data, complete_data$Date == "1/2/2007")
plot2_data <- rbind(plot2_data, subset(complete_data, complete_data$Date == "2/2/2007"))
plot2_data$Date <- as.character(plot2_data$Date)
plot2_data$Time <- as.character(plot2_data$Time)
plot2_data$DT <- plot2_data$Date %+% " " %+% plot2_data$Time
plot2_data$DT <- strptime(plot2_data$DT, format = "%d/%m/%Y %H:%M:%S")
plot2_data$Global_active_power <- as.character(plot2_data$Global_active_power)
plot2_data$Global_active_power <- as.numeric(plot2_data$Global_active_power)

## Ploting the data

png("plot2.png", width = 480, height = 480)
plot(plot2_data$DT, plot2_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()