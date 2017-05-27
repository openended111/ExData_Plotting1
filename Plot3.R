library("dplyr")
Sys.setlocale("LC_TIME", "English")

power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
t1 <- as.Date("2007-2-1")
t2 <- as.Date("2007-2-2")
powersub <- subset(power,as.Date(power$Date,format="%d/%m/%Y") %in% t1:t2)


powersub$Date <- as.Date(powersub$Date,format="%d/%m/%Y")
powersub$Datechr <- as.character(powersub$Date)
powersub$Timechr <- as.character(powersub$Time)
powersub$DateTime <- as.POSIXct(paste(powersub$Datechr, powersub$Timechr), format="%Y-%m-%d %H:%M:%S")

powersub$Day <- as.factor(substr(weekdays(powersub$Date),1,3))

levels(powersub$Day) <- c("Thu","Fri")

powersub$Sub_metering_1 <- as.numeric(powersub$Sub_metering_1)
powersub$Sub_metering_2 <- as.numeric(powersub$Sub_metering_2)
powersub$Sub_metering_3 <- as.numeric(powersub$Sub_metering_3)


with(powersub,
     plot(powersub$DateTime,powersub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"),ylim=c(0,40))
lines(powersub$DateTime,powersub$Sub_metering_2,type="o",xlab="",col='red')
lines(powersub$DateTime,powersub$Sub_metering_3,type="o",xlab="",col='blue')
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),lty=c(1,1,1),cex=0.75)     
    

dev.copy(png,file="plot3.png",width = 480,height = 480)
dev.off()
