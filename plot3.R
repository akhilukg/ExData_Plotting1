#unzipping the file and loading data into R
unzip(zipfile = "./Coursera4.zip")
dataFile <- "./household_power_consumption.txt"
tidydata <- read.table(dataFile, header=TRUE, sep=";")
dataextract <- tidydata[tidydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Data subsetting as per requirement i.e Global Active Power and sub metering 1,2,3
datetime <- strptime(paste(dataextract$Date, dataextract$Time),"%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(dataextract$Global_active_power)
subMetering1 <- as.numeric(dataextract$Sub_metering_1)
subMetering2 <- as.numeric(dataextract$Sub_metering_2)
subMetering3 <- as.numeric(dataextract$Sub_metering_3)

#creating plot file with 480x480 dimension
png("plot3.png", width=480, height=480)

#plotting of graphs
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
graphics.off()