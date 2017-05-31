#download and unzip file
download.file ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip", exdir =".")

#read data
data_full <- read.table("household_power_consumption.txt",header=TRUE, na.strings="?",sep=";")
data <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007"), ]

#Setting of locale to english and formatting of date and time
Sys.setlocale("LC_TIME","C")
data$Date <- as.Date(data$Date, format ="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(dateTime, tz= 'UTC')

##Plot3
with(data, {
 plot(Sub_metering_1~DateTime,type="l",
      ylab="Energy sub metering",xlab="",cex=0.8)
 lines(Sub_metering_2~DateTime, col='Red')
 lines(Sub_metering_3~DateTime, col='Blue')
})
legend("topright", col=c("black","red","blue"),lty=1, lwd=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.8) 
#export
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
