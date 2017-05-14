# Create Vector with classes for the columns
columnclasses<-c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
#read table 
hps<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",colClasses=columnclasses,na.strings=c("NA", "?"))
# subset data frame to two days
hps1<-subset(hps, Date=='1/2/2007' |Date=="2/2/2007")
#add new variables with datetime
hps1$Date1<-strptime(paste(hps1$Date,hps1$Time),"%d/%m/%Y %H:%M:%S")
#change graphic Graphics devices 
png(filename="./plot1.png")
#plot his
hist(hps1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#close file
dev.off()
