
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", quote = "", stringsAsFactors = FALSE)
str(data)
twodays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
str(twodays)
both <- paste(twodays$Date, twodays$Time)
strptime(both, format = "%d/%m/%Y %H:%M:%S") -> datetimes
cbind(twodays, datetimes) -> twodays

#second plot
png("plot2.png", width = 480, height = 480)
with(twodays, plot(datetimes, Global_active_power, typ ="l", ylab = "Global Active Power (kilowatts)", xlab = NA))
dev.off(which = dev.cur())
