xdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
startdate = as.Date("01/02/2007", "%d/%m/%Y")
enddate = as.Date("02/02/2007", "%d/%m/%Y")
h <- xdata[as.Date(xdata$Date, "%d/%m/%Y")>=startdate & as.Date(xdata$Date, "%d/%m/%Y")<=enddate, ]
png('plot2.png',width=480,height=480)
par(mar=c(4.0, 4.0, 0.2, 0.2))
plot(h$Global_active_power, type="l", axes=F, ann=T, ylab="Global active power", xlab="", xaxt="n",cex.lab=0.8)
axis(2)
#data is every minute, only two days, so I can be sure of the accuracy of this bar
axis(1, c(1,1440,2880), labels=c("Thu", "Fri","Sat"))
box()
dev.off()


