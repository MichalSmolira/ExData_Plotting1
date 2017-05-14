# Create Vector with classes for the columns
	columnclasses<-c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
#read table 
	hps<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",colClasses=columnclasses,na.strings=c("NA", "?"))
# subset data frame to two days
	hps1<-subset(hps, Date=='1/2/2007' |Date=="2/2/2007")
#add new variables with datetime
	hps1$Date1<-strptime(paste(hps1$Date,hps1$Time),"%d/%m/%Y %H:%M:%S")
#change graphic Graphics devices 
png(filename="./plot4.png")
#change layout 
	par(mfcol=c(2,2))
#make plot 1,1
	plot(hps1$Date1,hps1$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#make plot1,2
	plot(hps1$Date1,hps1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
	# add Sub_metering_2
	points(hps1$Date1,hps1$Sub_metering_2,type="l",col="red")
	# add Sub_metering_3
	points(hps1$Date1,hps1$Sub_metering_3,type="l",col="blue")
	#add legend
	legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
#make plot 2,1
	plot(hps1$Date1,hps1$Voltage,type="l",ylab="Voltage",xlab="datetime")
#make plot2,2
	plot(hps1$Date1,hps1$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
#close file
dev.off()
