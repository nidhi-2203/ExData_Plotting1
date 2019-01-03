raw <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors = FALSE, na.strings = "?")

raw_filter <- raw[raw$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(raw_filter$Date, raw_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(raw_filter$Global_active_power)

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,file = "Plot2.png", width=480, height=480, units='px')
dev.off()