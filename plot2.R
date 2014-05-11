# This script generates a plot of the variable Global_active_power
# taken from the household_power_consumption.txt dataset
# in the range 1/2/2007-2/2/2007, in function of date/time
# the resulting graph is saved to a png image file

x<-read.table("household_power_consumption.txt")
y<-subset(x,Date=="1/2/2007" | Date=="2/2/2007")
png("plot2.png", width=480, height=480)
times<-strptime(paste(as.character.Date(y$Date,format="%d/%m/%Y"),y$Time), 
                format="%d/%m/%Y %H:%M:%S")
plot(times, y$Global_active_power,type="l",
     ylab="Global Active Power(kilowatts)",xlab="")


