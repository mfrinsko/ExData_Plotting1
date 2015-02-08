##Check to make sure that the working directory is created - create if not
if (!file.exists("~/Data")) {
        dir.create("~/Data")
}

##Set the working directory
setwd("~/Data")

##Requires the plyr and dplyr packages
library("plyr")
library("dplyr")

##Read the file for only the specified dates.  The dates are in d/m/yyyy format.
data4 <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?")
data4 <- na.omit(data4)
data4 <- filter(data4, Date %in% c("1/2/2007", "2/2/2007"))

##Deal with the dates
data4$Date <- strptime(paste(data4$Date, data4$Time), "%d/%m/%Y %H:%M:%S")

##Change the window size - this makes the graph look better
windows(width=6, height=6)

##Set the background - it is transparent on the example file
par(bg = "transparent")

##Set the plot to have 4 plots, 2 x 2
par(mfrow = c(2, 2))

##Generate the first plot
plot(data4$Date, data4$Global_active_power, type = "l", ylab = "Global Active Power",
     xlab = "")

##Generate the 2nd plot
plot(data4$Date, data4$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##Generate the 3rd plot
plot(data4$Date, data4$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data4$Date, data4$Sub_metering_1)
lines(data4$Date, data4$Sub_metering_2, col = "red")
lines(data4$Date, data4$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lwd = .75, cex = .75, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 
                                                              "Sub_metering_3"))

##Generate 4th plot
plot(data4$Date, data4$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")


##Copy to PNG file
dev.copy(png, file = "plot4.png")
dev.off()
