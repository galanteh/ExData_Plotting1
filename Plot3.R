library(data.table)
# Locale is Spanish, so I need to be sure that . is a decimal separator
options(digits=10) 
options(OutDec= ".")
setwd("C:/Hernan Galante/Autonomy/Certification/Explore Data Analysis/Week 1/Course Project 1")
txt_file <- "household_power_consumption.txt"
power_consumption <- read.table(txt_file, sep=";", header=TRUE, dec = ".")
power_consumption$Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption_2007 <- subset(power_consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
power_consumption_2007$Sub_metering_1 <- as.numeric(as.character.numeric_version(power_consumption_2007$Sub_metering_1))
power_consumption_2007$Sub_metering_2 <- as.numeric(as.character.numeric_version(power_consumption_2007$Sub_metering_2))
power_consumption_2007$Sub_metering_3 <- as.numeric(as.character.numeric_version(power_consumption_2007$Sub_metering_3))
power_consumption_2007$DateTime <- strptime(paste(as.character.Date(power_consumption_2007$Date, "%d/%m/%Y"),power_consumption_2007$Time),"%d/%m/%Y %H:%M:%S")
power_consumption_2007$Weekday<- weekdays(as.Date(power_consumption_2007$DateTime))
png("Plot3.png",width = 480, height = 480)
plot(power_consumption_2007$DateTime, power_consumption_2007$Sub_metering_1,
     ylab="Energy sub meetering",
     xlab="",
     type = "l",
     ylim=c(0,40),
     col=c("Black"))     
par(new=T)
plot(power_consumption_2007$DateTime, power_consumption_2007$Sub_metering_2,
     ylab="Energy sub meetering",
     xlab="",
     type = "l",
     ylim=c(0,40),
     col=c("Red"))     
par(new=T)
plot(power_consumption_2007$DateTime, power_consumption_2007$Sub_metering_3,
     ylab="Energy sub meetering",
     xlab="",
     type = "l", 
     ylim=c(0,40),
     col=c("Blue"))
legend('topright', 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=1, 
       col=c('black', 'red', 'blue'), 
       box.col="black",
       cex=.75)
dev.off()
