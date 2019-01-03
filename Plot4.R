raw <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors = FALSE, na.strings = "?")

raw_filter <- raw %>% filter(Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(raw_filter$Date, raw_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(raw_filter$Global_active_power)
GlobalReactivePower <- as.numeric(raw_filter$Global_reactive_power)
Voltage <- as.numeric(raw_filter$Voltage)
SubMetering1 <- as.numeric(raw_filter$Sub_metering_1)
SubMetering2 <- as.numeric(raw_filter$Sub_metering_2)
SubMetering3 <- as.numeric(raw_filter$Sub_metering_3)

par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex = 0.6)

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "Plot4.png", width=480, height=480, units='px')
dev.off()