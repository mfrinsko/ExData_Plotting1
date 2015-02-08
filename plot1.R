##This file assumes that the data files (household_power_consumption.txt) has been downloaded
##and unzipped into a folder called Data immediately under your working directory

##Set the working directory
setwd("~/Data")

##Requires the plyr and dplyr packages
library("plyr")
library("dplyr")

##Read the file for only the specified dates.  The dates are in d/m/yyyy format.
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
data <- na.omit(data)
data <- filter(data, Date %in% c("1/2/2007", "2/2/2007"))

##Set the background - it is transparent on the example file
par(bg = "transparent")

##Generate the histogram plot
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", cex.axis = .75, cex.lab = .75, cex.main = .9, font.main = 2)

##Copy to PNG file
dev.copy(png, file = "plot1.png")
dev.off()
