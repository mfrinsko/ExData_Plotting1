##This file assumes that the data files (household_power_consumption.txt) has been downloaded
##and unzipped into a folder called Data immediately under your working directory

##Set the working directory
setwd("~/Data")

##Requires the plyr and dplyr packages
library("plyr")
library("dplyr")

##Read the file for only the specified dates.  The dates are in d/m/yyyy format.
data3 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
data3 <- na.omit(data3)
data3 <- filter(data3, Date %in% c("1/2/2007", "2/2/2007"))

##Deal with the dates
data3$Date <- strptime(paste(data3$Date, data3$Time), "%d/%m/%Y %H:%M:%S")

##Set the background - it is transparent on the example file
par(bg = "transparent")

##Change the window size - otherwise the legend gets cut off in the PNG
windows(width=6, height=5)

##Generate the histogram plot
plot(data3$Date, data3$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data3$Date, data3$Sub_metering_1)
lines(data3$Date, data3$Sub_metering_2, col = "red")
lines(data3$Date, data3$Sub_metering_3, col = "blue")
legend("topright", lwd = .75, cex = .75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 
                                                              "Sub_metering_3"))

##Copy to PNG file
dev.copy(png, file = "plot3.png")
dev.off()
