plotdata = read.table("./household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plotsubset = plotdata[plotdata$Date=="1/2/2007" | plotdata$Date=="2/2/2007" ,]
mydate = plotsubset$Date
mytime = plotsubset$Time
mydt = paste(mydate,mytime,sep=" ")
mydatetime = strptime(mydt,"%d/%m/%Y %H:%M:%S")
mydata = cbind(plotsubset,mydatetime)

png("./plot1.png",width=480, height=480)
hist(as.numeric(mydata$Global_active_power),col="red",xlab="Global Active Power(kilowatts)",main="Global Active Power")
dev.off()