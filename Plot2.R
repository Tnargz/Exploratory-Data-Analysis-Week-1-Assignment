RawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",
      stringsAsFactors = FALSE, na.strings = "?")
Datasub1 <- subset(RawData, Date %in% c("1/2/2007","2/2/2007"))

Global_active_power <- as.numeric(Datasub1$Global_active_power)
datetime <- strptime(paste(Datasub1$Date, Datasub1$Time, sep =" "), "%d/%m/%Y %H:%M:%S")

png(file = "Plot2.png", width = 480, height = 480)
with(Datasub1, plot(datetime, Global_active_power, type = "l", main = "Global Active Power",
      xlab = " ", ylab = "Global Active Power (Kilowatts)"))
dev.off()