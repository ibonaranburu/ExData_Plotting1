##  Plot 1

##Reading and filtering the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip", method="curl")
data<-read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?", 
                 colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                 nrows=70000,stringsAsFactors=FALSE)
data2<-subset(data,Date %in% c('1/2/2007','2/2/2007'))

##Ploting
hist(as.numeric(data2$Global_active_power),breaks=12,
     main="Global Active Power",xlab="Global Active Power (kilowatts)",
     col="red")
dev.copy(png,file="plot1.png",width=480,height=480,units = "px")
dev.off()
