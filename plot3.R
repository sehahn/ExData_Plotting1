# Plot3.R is part of Project 1 for Johns Hopkins' Exploratory Data Analysis
# course.  This script uses data from the "Individual household consumption
# data set" from the UCI Machine Learning Repository, and creates a plot to
# match one provided for the assignment.

# Data from the "Individual household consumption data set" is read in
powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
#head(powconData)

# A subset is created based on dates provided in the assignment, and the
# original dataset is released from memory
pcData <- powconData[strptime(powconData$Date, "%d/%m/%Y") == "2007-02-01" | strptime(powconData$Date, "%d/%m/%Y") == "2007-02-02", ]
pcData$DT <- strptime(paste(pcData$Date,pcData$Time), "%d/%m/%Y %H:%M:%S")
#summary(pcData)
rm("powconData")

# A line plot with separate lines for the three energy sub-metering variables
# is created and saved as plot3.png
png("plot3.png", 480, 480)
with(pcData, plot(DT, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
with(pcData, lines(DT, Sub_metering_2, col="red"))
with(pcData, lines(DT, Sub_metering_3, col="blue"))
legend("topright", lwd=1,  col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
