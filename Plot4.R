library(dplyr)
library(lubridate)
## printing the number of MBs required
#print((2075259*9*8)/2^20)

wholedf <- tbl_df(data <- read.delim("household_power_consumption.txt",sep=";"))

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
dfdates<-filter(df,Date=="2007-02-01"|Date=="2007-02-02")

Met1<- as.numeric(paste(dfdates$Sub_metering_1))
Met2<- as.numeric(paste(dfdates$Sub_metering_2))
Met3<- as.numeric(paste(dfdates$Sub_metering_3))

date_time <- ymd_hms(paste(dfdates$Date,dfdates$Time))

png("plot4.png",width=480,height=480)

par(mfcol=c(2,2))

##Plot 1
GAP<- as.numeric(paste(dfdates$Global_active_power))
date_time <- ymd_hms(paste(dfdates$Date,dfdates$Time))
plot(date_time,GAP,type="l",ylab="Global Active Power (kilowatts)",xlab="")

##Plot 2
plot(date_time, Met1, col="black",lty="solid",type="l", xlab="", ylab="Energy sub Metering")
lines(date_time, Met2, col="red",lty="solid",type="l")
lines(date_time, Met3, col="blue",lty="solid",type="l")
legend("topright", c("Sub_metering1","Sub_metering2","Sub_metering3"),col=c("black","red","blue"),lwd=1)

##Plot 3
voltage <- as.numeric(paste(dfdates$Voltage))
plot(date_time, voltage, col="black", type="l", xlab="datetime",ylab="Voltage")

##Plot 4
GRP <- as.numeric(paste(dfdates$Global_reactive_power))
plot(date_time, GRP, col="black", xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()




