loadit <- function(){
	if(!file.exists("household_power_consumption.txt")){
		download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","un.zip")
		unzip("un.zip")
	}

	power_ = read.table("household_power_consumption.txt",header=TRUE,sep=";")
	power_ = power_[power_$Date %in% c("1/2/2007","2/2/2007"),]

	return(power_)
}

finalplt <- function(){
	power_ = loadit()
    png("plot4.png")
	par(mfrow=c(2,2))
	y1 <- power_$Sub_metering_1
	y2 <- power_$Sub_metering_2
	y3 <- power_$Sub_metering_3
	div_ = as.integer(dim(power_)[1]/2)

	plot(power_$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt = 'n')
	axis(side=1,at=c(0,div_,div_*2),labels=c("Thu","Fri","Sat"))
	plot(power_$Voltage, type="l",ylab="Voltage",xlab="datetime",xaxt = 'n')
	axis(side=1,at=c(0,div_,div_*2),labels=c("Thu","Fri","Sat"))
	
	plot(y1, type="l", col="black", ylab="Energy sub metering", xlab="",,xaxt = 'n')	
	axis(side=1,at=c(0,div_,div_*2),labels=c("Thu","Fri","Sat"))
	lines(y2,type='l',col='red')
	lines(y3,type='l',col='blue')
	legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),ncol=1,lwd=1)
	plot(power_$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime",xaxt = 'n')
	axis(side=1,at=c(0,div_,div_*2),labels=c("Thu","Fri","Sat"))
	dev.off()
}

