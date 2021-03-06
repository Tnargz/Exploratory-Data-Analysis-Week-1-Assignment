RawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",
      stringsAsFactors = FALSE, na.strings = "?")
Datasub1 <- subset(RawData, Date %in% c("1/2/2007","2/2/2007"))

Global_active_power <- as.numeric(Datasub1$Global_active_power)
datetime <- strptime(paste(Datasub1$Date, Datasub1$Time, sep =" "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(Datasub1$Sub_metering_1)
Sub_metering_2 <- as.numeric(Datasub1$Sub_metering_2)
Sub_metering_3 <- as.numeric(Datasub1$Sub_metering_3)
Global_reactive_power <- as.numeric(Datasub1$Global_reactive_power)
Voltage <- as.numeric(Datasub1$Voltage)

png("Plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(datetime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")
plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(datetime, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy Sub Metering")
      lines(datetime, Sub_metering_2, type = "l", col = "red")
      lines(datetime, Sub_metering_3, type = "l", col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            col = c("black", "blue","red"), lty = 1:2, cex = 0.6)
plot(datetime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
