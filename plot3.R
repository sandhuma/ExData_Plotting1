plotdata = read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotsubset = plotdata[plotdata$Date=="1/2/2007" | plotdata$Date=="2/2/2007" ,]
mydate = plotsubset$Date
mytime = plotsubset$Time
mydt = paste(mydate,mytime,sep=" ")
mydatetime = strptime(mydt,"%d/%m/%Y %H:%M:%S")
mydata = cbind(plotsubset,mydatetime)

png("./plot3.png",width=480, height=480)
sm1 = as.numeric(mydata$Sub_metering_1)
sm2 = as.numeric(mydata$Sub_metering_2)
sm3 = as.numeric(mydata$Sub_metering_3)
plot(mydata$mydatetime,sm1,ylab="Energy Sub Metering",xlab="",type='n')
lines(mydata$mydatetime,sm1,type="l",col="black")
lines(mydata$mydatetime,sm2,type="l",col="red")
lines(mydata$mydatetime,sm3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd = 3,col=c("black","red","blue"))
dev.off()
