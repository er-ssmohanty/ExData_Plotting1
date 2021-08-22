loadit <- function(){
	if(!file.exists("household_power_consumption.txt")){
		download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","un.zip")
		unzip("un.zip")
	}

	power = read.table("household_power_consumption.txt",header=TRUE,sep=";")
	power = power[power$Date %in% c("1/2/2007","2/2/2007"),]

	return(power)
}

secondplt <- function(){
	power = loadit()
	png("plot2.png")
	div_ = as.integer(dim(power)[1]/2)
	plot(power$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt = 'n')
	axis(side=1,at=c(0,div_,div_*2),labels=c("Thu","Fri","Sat"))
	dev.off()
}
	
