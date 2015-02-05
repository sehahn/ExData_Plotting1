powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#head(powconData)

pcData <- powconData[strptime(powconData$Date, "%d/%m/%Y") == "2007-02-01" | strptime(powconData$Date, "%d/%m/%Y") == "2007-02-02", ]
pcData$DT <- strptime(paste(pcData$Date,pcData$Time), "%d/%m/%Y %H:%M:%S")
#summary(pcData)
rm("powconData")

png("plot2.png", 480, 480)
plot(pcData$DT, pcData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
