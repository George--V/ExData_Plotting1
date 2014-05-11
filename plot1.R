# This script generates a histogram of the variable Global_active_power
# taken from the household_power_consumption.txt dataset
# in the range 1/2/2007-2/2/2007
# the resulting graph is saved to a png image file

x<-read.table("household_power_consumption.txt")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
png("plot1.png", width=480, height=480)
hist(y$Global_active_power, breaks=6, col="Red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)",xlim=c(0, 8), ylim=c(0, 1200))
dev.off()