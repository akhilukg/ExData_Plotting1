#unzipping the file and loading data into R
unzip(zipfile = "./Coursera4.zip")
dataFile <- "./household_power_consumption.txt"
tidydata <- read.table(dataFile, header=TRUE, sep=";")
dataextract <- tidydata[tidydata$Date %in% c("1/2/2007","2/2/2007"),]

#Data subsetting as per requirement i.e Global Active Power 
ActivePower <- as.numeric(dataextract$Global_active_power)

#creating plot file with 480x480 dimension
png("plot1.png", width=480, height=480)

#plotting of histogram
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
graphics.off()