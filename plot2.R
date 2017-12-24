fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "./epc.zip")
EPC <- read.table(unz("epc.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";",dec = ".",na.strings = "?")
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPC = subset(data,Date=="2007-02-01"|Date=="2007-02-02")
EPC$Datetime = paste(EPC$Date,EPC$Time)
EPC$Datetime = strptime(EPC$Datetime,"%Y-%m-%d %H:%M:%S")


plot(-4:4, -4:4, type = "n")
plot(EPC$Datetime,EPC$Global_active_power,type = "o",pch=-2,ylab = "Global Active Power (kilowatts)",xlab="")


