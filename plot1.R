fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl,destfile = "./epc.zip")
EPC <- read.table(unz("epc.zip", "household_power_consumption.txt"), header=T, quote="\"", sep=";",dec = ".",na.strings = "?")
EPC$Date = as.Date(EPC$Date,"%d/%m/%Y")
EPC = subset(data,Date=="2007-02-01"|Date=="2007-02-02")
EPC$Datetime = paste(EPC$Date,EPC$Time)
EPC$Datetime = strptime(EPC$Datetime,"%Y-%m-%d %H:%M:%S")



par(mfrow=c(1,1),oma=c(2,2,1,1))
plot(-4:4, -4:4, type = "n")
hist(EPC$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png,file = "plot1.png")
dev.off()
