
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", quote = "", stringsAsFactors = FALSE)
str(data)
twodays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
str(twodays)
both <- paste(twodays$Date, twodays$Time)
strptime(both, format = "%d/%m/%Y %H:%M:%S") -> datetimes
cbind(twodays, datetimes) -> twodays

#third plot
png("plot3.png", width = 480, height = 480)
with(twodays, plot(datetimes, Sub_metering_1, typ ="l", ylab = "Energy sub metering", xlab = NA))
lines(twodays$datetimes, twodays$Sub_metering_2, col = "red")
lines(twodays$datetimes, twodays$Sub_metering_3, col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off(which = dev.cur())
