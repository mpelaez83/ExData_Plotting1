## Loading dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting dataset
data_Feb <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Adapting dates
datetime <- paste(as.Date(data_Feb$Date), data_Feb$Time)
data_Feb$Datetime <- as.POSIXct(datetime)


## Plot 3
par(cex=0.6)
with(data_Feb, {
  plot(Sub_metering_1 ~ Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ Datetime, col='Red')
  lines(Sub_metering_3 ~ Datetime, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=1.0, pt.cex=0.6)

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

