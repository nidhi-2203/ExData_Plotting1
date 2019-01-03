raw <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors = FALSE, na.strings = "?")

raw_filter <- raw %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(raw_filter$Date, raw_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(raw_filter$Global_active_power)
SubMetering1 <- as.numeric(raw_filter$Sub_metering_1)
SubMetering2 <- as.numeric(raw_filter$Sub_metering_2)
SubMetering3 <- as.numeric(raw_filter$Sub_metering_3)

plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.copy(png, file = "Plot3.png", width=480, height=480, units='px')
dev.off()