#Load data from "household_power_consumption" file.
#Data is separated by ";" and missing values are represented by "?".

power_full<-read.table("household_power_consumption.txt", sep = ";", header=TRUE, na.strings="?")

#Convert Date field to date format.
power_full$Date=as.Date(power_full$Date, "%d/%m/%Y")

#Subset data to only review dates 2007-02-01 and 2007-02-02
power<-subset(power_full, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

png(filename="plot1.png")
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Activer Power")
dev.off()