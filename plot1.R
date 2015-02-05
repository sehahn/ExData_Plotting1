powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# head(powconData)

powconData$Date <- strptime(powconData$Date, "%d/%m/%Y")
pcData <- powconData[powconData$Date == "2007-02-01" | powconData$Date == "2007-02-02", ]
# summary(pcData)
rm("powconData")

png("plot1.png", 480, 480)
hist(pcData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
