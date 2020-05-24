#Load data from "household_power_consumption" file.

#Load data from "household_power_consumption" file.
#Data is separated by ";" and missing values are represented by "?".

power_full<-read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")

#Convert Date field to date format.
power_full$Date=as.Date(power_full$Date, "%d/%m/%Y")

#Subset data to only review dates 2007-02-01 and 2007-02-02
power<-subset(power_full, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Combine date and time variables
power=mutate(power, concat_DateTime=paste(power$Date, power$Time))

power$Time=strptime(power$concat_DateTime, "%Y-%m-%d %H:%M:%S")

png(filename="plot4.png")
par(mfrow= c(2,2))

#Plot 1 - Top left
plot(power$Time, power$Global_active_power, type="l", ylab = "Global Active Power", xlab="")

#Plot 2 - Top right
plot(power$Time, power$Voltage, type="l", ylab = "Voltage", xlab="datetime")

#Plot 3 - Bottom left
plot(power$Time, power$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(power$Time, power$Sub_metering_2, col="red")
lines(power$Time, power$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

#Plot 4 - Bottom right
plot(power$Time, power$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()