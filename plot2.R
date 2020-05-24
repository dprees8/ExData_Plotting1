library(dplyr)

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

png(filename="plot2.png")
plot(power$Time, power$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()