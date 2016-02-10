library(data.table)
# Locale is Spanish, so I need to be sure that . is a decimal separator
options(digits=10) 
options(OutDec= ".")
setwd("C:/Hernan Galante/Autonomy/Certification/Explore Data Analysis/Week 1/Course Project 1")
txt_file <- "household_power_consumption.txt"
power_consumption <- read.table(txt_file, sep=";", header=TRUE, dec = ".")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption_2007 <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
power_consumption_2007$Global_active_power <- as.numeric(as.character.numeric_version(power_consumption_2007$Global_active_power))
power_consumption_2007$DateTime <- strptime(paste(as.character.Date(power_consumption_2007$Date, "%d/%m/%Y"),power_consumption_2007$Time),"%d/%m/%Y %H:%M:%S")
power_consumption_2007$Weekday<- weekdays(as.Date(power_consumption_2007$DateTime))
png("Plot2.png",width = 480, height = 480)
plot(power_consumption_2007$DateTime,power_consumption_2007$Global_active_power,
     ylab="Global Active Power (kilowatts)",
     xlab="",
     type = "l")
dev.off()

