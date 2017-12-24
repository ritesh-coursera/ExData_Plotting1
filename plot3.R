fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "./epc.zip")
EPC <- read.table(unz("epc.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";",dec = ".",na.strings = "?")
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPC = subset(data,Date=="2007-02-01"|Date=="2007-02-02")
EPC$Datetime = paste(EPC$Date,EPC$Time)
EPC$Datetime = strptime(EPC$Datetime,"%Y-%m-%d %H:%M:%S")


plot(EPC$Datetime,EPC$Sub_metering_1,type="o",pch=-2,ylab = "Energy sub metering",xlab="")
lines(EPC$Datetime,EPC$Sub_metering_2, type = "o", col = "red",pch=-2)
lines(EPC$Datetime,EPC$Sub_metering_3, type = "o", col = "blue",pch=-2)
legend("topright", pch="-",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
