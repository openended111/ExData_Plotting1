library("dplyr")
power <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
t1 <- as.Date("2007-2-1")
t2 <- as.Date("2007-2-2")
powersub <- subset(power,as.Date(power$Date,format="%d/%m/%Y") %in% t1:t2)
powersub$Global_active_power <- as.numeric(powersub$Global_active_power)/1000
with(powersub,hist(powersub$Global_active_power,xlab="Global Active Power (killowatts)",col='red',main="Global Active Power"))
dev.copy(png,file="plot1.png",width = 480,height = 480)
dev.off()

