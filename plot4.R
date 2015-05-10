xdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
startdate = as.Date("01/02/2007", "%d/%m/%Y")
enddate = as.Date("02/02/2007", "%d/%m/%Y")
h <- xdata[as.Date(xdata$Date, "%d/%m/%Y")>=startdate & as.Date(xdata$Date, "%d/%m/%Y")<=enddate, ]
allRange <- range(0,h$Sub_metering_1,h$Sub_metering_2,h$Sub_metering_3)
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(h,{
  plot(h$Global_active_power, type="l", axes=F, ann=T, ylab="Global active power", xlab="", xaxt="n",cex.lab=0.8)
  axis(2)
  #data is every minute, only two days, so I can be sure of this bar
  axis(1, c(1,1440,2880), labels=c("Thu", "Fri","Sat"))
  box()
  
  plot(h$Voltage, type="l", axes=F, ann=T, ylab="Voltage", xlab="datetime", xaxt="n",cex.lab=0.8)
  axis(2)
  #data is every minute, only two days, so I can be sure of this bar
  axis(1, c(1,1440,2880), labels=c("Thu", "Fri","Sat"))
  box()
  
  plot(h$Sub_metering_1, type="l", axes=F, ann=T, ylab="Energy sub metering", xlab="", xaxt="n",cex.lab=0.8, ylim=allRange)
  lines(h$Sub_metering_2, col="red", type="l")
  lines(h$Sub_metering_3, col="blue", type="l")
  axis(2)
  axis(1, c(1,1440,2880), labels=c("Thu", "Fri","Sat"))
  box()
  legend("topright",allRange[2],c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8, col=c("black","red","blue"), pch=21:22, lty=1:2, bty="n")
  
  plot(h$Global_reactive_power, type="l", axes=F, ann=T, ylab="Global_reactive_power", xlab="datetime", xaxt="n",cex.lab=0.8)
  axis(2)
  #data is every minute, only two days, so I can be sure of this bar
  axis(1, c(1,1440,2880), labels=c("Thu", "Fri","Sat"))
  box()  
})
dev.off()