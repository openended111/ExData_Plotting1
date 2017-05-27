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


powersub$Global_active_power <- as.numeric(powersub$Global_active_power)

with(powersub,plot(powersub$DateTime,powersub$Global_active_power/1000,type="l",xlab="",ylab="Global Active Power (killowatts)"))
dev.copy(png,file="plot2.png",width = 480,height = 480)
dev.off()
