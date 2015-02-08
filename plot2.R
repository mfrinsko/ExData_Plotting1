##This file assumes that the data files (household_power_consumption.txt) has been downloaded
##and unzipped into a folder called Data immediately under your working directory

##Set the working directory
setwd("~/Data")

##Requires the plyr and dplyr packages
library("plyr")
library("dplyr")

##Read the file for only the specified dates.  The dates are in d/m/yyyy format.
data2 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
data2 <- na.omit(data2)
data2 <- filter(data2, Date %in% c("1/2/2007", "2/2/2007"))

##Deal with the dates
data2$Date <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

##Set the background - it is transparent on the example file
par(bg = "transparent")

##Generate the line plot
plot(data2$Date, data2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)",
     xlab = "", cex.axis = .75, cex.lab = .75, cex.main = .75)

##Copy to PNG file
dev.copy(png, file = "plot2.png")
dev.off()
