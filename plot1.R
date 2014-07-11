setwd("C:/Users/chiemi yokota/Desktop/Exploratory-Data-Analysis")

Data_All <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')


Data_All$Date <- as.Date(Data_All$Date, format = "%d/%m/%Y")

Data <- subset(Data_All, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

DateTime <- paste(as.Date(Data$Date), Data$Time)
Data$DateTime <- as.POSIXct(DateTime)

hist(Data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab="Frequency", col = "Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()


