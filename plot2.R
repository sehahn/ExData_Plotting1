# Plot2.R is part of Project 1 for Johns Hopkins' Exploratory Data Analysis
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

# A line plot of Global_active_power by DT is created and saved as plot2.png
png("plot2.png", 480, 480)
plot(pcData$DT, pcData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
