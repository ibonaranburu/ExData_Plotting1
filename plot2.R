##  Plot 2

##Reading and filtering the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method="curl")
data<-read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?", 
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                 nrows=70000,stringsAsFactors=FALSE)
data2<-subset(data,Date %in% c('1/2/2007','2/2/2007'))
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")

##Ploting
plot(data2$DateTime,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480,units = "px")
dev.off()
