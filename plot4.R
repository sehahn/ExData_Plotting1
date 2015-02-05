powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#head(powconData)

pcData <- powconData[strptime(powconData$Date, "%d/%m/%Y") == "2007-02-01" | strptime(powconData$Date, "%d/%m/%Y") == "2007-02-02", ]
pcData$DT <- strptime(paste(pcData$Date,pcData$Time), "%d/%m/%Y %H:%M:%S")
#summary(pcData)
rm("powconData")

png("plot4.png", 480, 480)
par(mfrow=c(2,2), mar=c(4, 4, 3, 2))
with(pcData, {
    plot(DT, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(DT, Voltage, type="l", xlab="datatime", ylab="Voltage")
with(pcData, plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
with(pcData, lines(DT, Sub_metering_2, col="red"))
with(pcData, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lwd=1, bty="n",  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(DT, Global_reactive_power, type="l", xlab="datetime")
})
dev.off()
