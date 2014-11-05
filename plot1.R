## Loading dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting dataset
data_Feb <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data) ## Removing from memory

## Adapting dates
datetime <- paste(as.Date(data_Feb$Date), data_Feb$Time)
data_Feb$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(data_Feb$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

