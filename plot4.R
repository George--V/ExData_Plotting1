# This script generates for plotsfrom the household_power_consumption.txt dataset
# in the range 1/2/2007-2/2/2007 and display them in one split page.
# the resulting graphs are saved to a png image file

x<-read.table("household_power_consumption.txt")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
times<-strptime(paste(as.character.Date(y$Date,format="%d/%m/%Y"),y$Time), 
                format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

# Split screen

par(mfrow=c(2,2))

# Plot 1

plot(times, y$Global_active_power,type="l",
     ylab="Global Active Power(kilowatts)",xlab="")

# Plot 2

plot(times, y$Voltage,type="l",
     ylab="Voltage",xlab="Datetime",ylim=c(234,246))

# Plot 3

with(y, plot(times, Sub_metering_1, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40)))
par(new=T)
with(y, plot(times, Sub_metering_2, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40), col="Red"))
par(new=T)
with(y, plot(times, Sub_metering_3, ylab="Energy sub metering", xlab="",
             type="l", ylim=c(0,40), col="Blue"))
legend("topright", pch = "_", col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
# Plot 4

plot(times, y$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="Datetime",ylim=c(0.0,0.5))
dev.off()