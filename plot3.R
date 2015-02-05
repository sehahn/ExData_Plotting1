powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#head(powconData)

pcData <- powconData[strptime(powconData$Date, "%d/%m/%Y") == "2007-02-01" | strptime(powconData$Date, "%d/%m/%Y") == "2007-02-02", ]
pcData$DT <- strptime(paste(pcData$Date,pcData$Time), "%d/%m/%Y %H:%M:%S")
#summary(pcData)
rm("powconData")

png("plot3.png", 480, 480)
with(pcData, plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
with(pcData, lines(DT, Sub_metering_2, col="red"))
with(pcData, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lwd=1,  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
