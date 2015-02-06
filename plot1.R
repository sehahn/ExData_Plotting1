# Plot1.R is part of Project 1 for Johns Hopkins' Exploratory Data Analysis
# course.  This script uses data from the "Individial household consumption
# data set" from the UCI Machine Learning Repository, and creates a plot to 
# match one provided for the assignment.

# Data from the "Individual household consumption data set" is read in
powconData <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
# head(powconData)

# A subset is created based on dates provided in the assignment, and the
# original dataset is released from memory
powconData$Date <- strptime(powconData$Date, "%d/%m/%Y")
pcData <- powconData[powconData$Date == "2007-02-01" | powconData$Date == "2007-02-02", ]
# summary(pcData)
rm("powconData")

# A frequency distribution histogram of the Global_active_power variable is
# created and saved as plot1.png
png("plot1.png", 480, 480)
hist(pcData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
