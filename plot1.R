## Getting, subseting and adjusting the data for the task.

complete_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
plot1_data <- subset(complete_data, complete_data$Date == "1/2/2007")
plot1_data <- rbind(plot1_data, subset(complete_data, complete_data$Date == "2/2/2007"))
plot1_data$Date <- as.Date(plot1_data$Date, format = "%d/%m/%Y")
plot1_data$Global_active_power <- as.character(plot1_data$Global_active_power)
plot1_data$Global_active_power <- as.numeric(plot1_data$Global_active_power)

## Contructing the histogram

png(filename = "plot1.png", width = 480, height = 480)
hist(plot1_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()