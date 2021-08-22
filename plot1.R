loadit <- function(){
	if(!file.exists("household_power_consumption.txt")){
		download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","un.zip")
		unzip("un.zip")
	}

	power = read.table("household_power_consumption.txt",header=TRUE,sep=";")
	power = power[power$Date %in% c("1/2/2007","2/2/2007"),]

	return(power)
}

firstplt <- function(){
	power = loadit()
	png("plot1.png")	
	hist(as.numeric(power$Global_active_power),col='red',xlab='Global Active Power (kilowatts)',main='Global Active Power')
	dev.off()
}
