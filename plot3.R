# This script generates a plot of the variables Sub_metering_1,Sub_metering_2
# and Sub_metering_3 (taken from the household_power_consumption.txt dataset
# in the range 1/2/2007-2/2/2007) as a function of date/time
# the resulting graph is saved to a png image file

x<-read.table("household_power_consumption.txt")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
times<-strptime(paste(as.character.Date(y$Date,format="%d/%m/%Y"),y$Time), 
                format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

with(y, plot(times, Sub_metering_1, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40)))
par(new=T)
with(y, plot(times, Sub_metering_2, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40), col="Red"))
par(new=T)
with(y, plot(times, Sub_metering_3, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40), col="Blue"))
dev.off()