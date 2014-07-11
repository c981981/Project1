setwd("C:/Users/chiemi yokota/Desktop/Exploratory-Data-Analysis")

Data_All <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')


Data_All$Date <- as.Date(Data_All$Date, format = "%d/%m/%Y")

Data <- subset(Data_All, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

DateTime <- paste(as.Date(Data$Date), Data$Time)
Data$DateTime <- as.POSIXct(DateTime)

with(Data, {
    plot(Sub_metering_1 ~ DateTime, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7, 
       x.intersp = 1, y.intersp = 0.7)
})


dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

