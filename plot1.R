
data <- read.delim("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", quote = "", stringsAsFactors = FALSE)
str(data)
twodays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
str(twodays)
both <- paste(twodays$Date, twodays$Time)
strptime(both, format = "%d/%m/%Y %H:%M:%S") -> datetimes
cbind(twodays, datetimes) -> twodays

# first plot
png("plot1.png", width = 480, height = 480)
hist(twodays$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off(which = dev.cur())



