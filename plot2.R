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

##Plot2
plot(data$Global_active_power~data$DateTime, type ="l", ylab ="Global Active Power (kilowatts)", xlab="")

#export
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
