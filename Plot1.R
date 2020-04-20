RawData <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",
                      stringsAsFactors = FALSE, na.strings = "?")
Datasub1 <- subset(RawData, Date %in% c("1/2/2007","2/2/2007"))

Global_active_power <- as.numeric(Datasub1$Global_active_power)

png(file = "Plot1.png", width = 480, height = 480)
with(Datasub1, hist(Global_active_power, col = "RED", main = "Global Active Power",
                    xlab = "Global Active Power (Kilowatts)", ylab = "Frequency"))
dev.off()
