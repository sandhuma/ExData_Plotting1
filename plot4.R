plotdata = read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotsubset = plotdata[plotdata$Date=="1/2/2007" | plotdata$Date=="2/2/2007" ,]
mydate = plotsubset$Date
mytime = plotsubset$Time
mydt = paste(mydate,mytime,sep=" ")
mydatetime = strptime(mydt,"%d/%m/%Y %H:%M:%S")
mydata = cbind(plotsubset,mydatetime)

png("./plot4.png",width=480, height=480)

par(mfcol=c(2,2))

plot(mydata$mydatetime,as.numeric(mydata$Global_active_power),type='l',ylab="Global Active Power",xlab="")

sm1 = as.numeric(mydata$Sub_metering_1)
sm2 = as.numeric(mydata$Sub_metering_2)
sm3 = as.numeric(mydata$Sub_metering_3)
plot(mydata$mydatetime,sm1,ylab="Energy Sub Metering",xlab="",type='n')
lines(mydata$mydatetime,sm1,type="l",col="black")
lines(mydata$mydatetime,sm2,type="l",col="red")
lines(mydata$mydatetime,sm3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 3,col=c("black","red","blue"))

plot(mydata$mydatetime,as.numeric(mydata$Voltage),type='l',ylab="Voltage",xlab="datetime")

plot(mydata$mydatetime,as.numeric(mydata$Global_reactive_power),type='l',ylab="Global_reactive_power",xlab="datetime")

dev.off()
