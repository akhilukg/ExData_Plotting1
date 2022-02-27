#unzipping the file and loading data into R
unzip(zipfile = "./Coursera4.zip")
dataFile <- "./household_power_consumption.txt"
tidydata <- read.table(dataFile, header=TRUE, sep=";")
dataextract <- tidydata[tidydata$Date %in% c("1/2/2007","2/2/2007"),]

#creating subsets of data as per requirement i.e active power, reactive power,...
##...,voltage and sub metering 1,2,3 in this case.
datetime <- strptime(paste(dataextract$Date, dataextract$Time),"%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(dataextract$Global_active_power)
ReactivePower <- as.numeric(dataextract$Global_reactive_power)
voltage <- as.numeric(dataextract$Voltage)
subMetering1 <- as.numeric(dataextract$Sub_metering_1)
subMetering2 <- as.numeric(dataextract$Sub_metering_2)
subMetering3 <- as.numeric(dataextract$Sub_metering_3)

#creating plot file with 480x480 dimension in a 2x2 layout 
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#plotting of graphs
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
graphics.off()