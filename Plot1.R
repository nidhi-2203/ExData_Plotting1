raw <- read.table("household_power_consumption.txt",sep=";", header=T, stringsAsFactors = FALSE, na.strings = "?")

raw_filter <- raw %>% filter(Date == "1/2/2007" | Date == "2/2/2007")
raw_filter$Date <- dmy(raw_filter$Date)

raw_filter$Global_active_power <- as.numeric(raw_filter$Global_active_power)

hist(raw_filter$Global_active_power, 
     col = "red", 
     border = "black",
     ylim = range(0,1200),
     main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency")

dev.copy(png, file = "Plot1.png", width=480, height=480, units='px')
dev.off()