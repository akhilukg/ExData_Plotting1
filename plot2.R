#unzipping the file and loading data into R
unzip(zipfile = "./Coursera4.zip")
dataFile <- "./household_power_consumption.txt"
tidydata <- read.table(dataFile, header=TRUE, sep=";")
dataextract <- tidydata[tidydata$Date %in% c("1/2/2007","2/2/2007"),]

#Data subsetting as per requirement i.e Global Active Power 
datetime <- strptime(paste(dataextract$Date, dataextract$Time),"%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(dataextract$Global_active_power)

#creating plot file with 480x480 dimension
png("plot2.png", width=480, height=480)

#plotting of graphs
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
graphics.off()