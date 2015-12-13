
rm(list = ls())
setwd("U:/Coursera/EDA")

raw.df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")


raw.df$Date <- as.character(raw.df$Date)


DT <- raw.df[raw.df$Date == "2007-02-01" |  raw.df$Date == "2007-02-02",]
rm(raw.df) 

DT$Time <- as.character(DT$Time)
DT$DateTime <- paste(DT$Date, DT$Time, sep = " ")
DT$DateTime <- strptime(DT$DateTime, format = "%Y-%m-%d %H:%M:%S")

# Plot 1
hist(DT$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", freq = TRUE, main = "Global Active Power")
#end Plot 1

# Plot 2
with(DT, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" ))
# end Plot 2

#Plot 3
with(DT, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Submetering" ))
with(DT, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(DT, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lty = c("solid", "solid","solid"), col = c("black","red","blue"))
# end Plot 3

# Plot 4
par(mfrow = c(2,2))
with(DT, plot(DateTime,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))  
with(DT, plot(DateTime,Voltage, type = "l") )
with(DT, plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Submetering" ))
with(DT, lines(DateTime, Sub_metering_2, type = "l", col = "red"))
with(DT, lines(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), bty = "n",
       lty = c("solid", "solid","solid"), col = c("black","red","blue"), cex = .5, pt.cex = .7,
       y.intersp = .35)
with(DT, plot(DateTime,Global_reactive_power, type = "l"))
# end Plot 4
