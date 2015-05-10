xdata <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("?"))
startdate = as.Date("01/02/2007", "%d/%m/%Y")
enddate = as.Date("02/02/2007", "%d/%m/%Y")
h <- xdata[as.Date(xdata$Date, "%d/%m/%Y")>=startdate & as.Date(xdata$Date, "%d/%m/%Y")<=enddate, ]
xname="Global Active Power"
png('plot1.png',width=480,height=480) 
hist(h$Global_active_power, col="red", main=paste(xname), xlab=xname)
dev.off()

