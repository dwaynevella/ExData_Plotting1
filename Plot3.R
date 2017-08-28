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


png("plot3.png",width=480,height=480)

plot(date_time, Met1, col="black",lty="solid",type="l", xlab="", ylab="Energy sub Metering")
lines(date_time, Met2, col="red",lty="solid",type="l")
lines(date_time, Met3, col="blue",lty="solid",type="l")
legend("topright", c("Sub_metering1","Sub_metering2","Sub_metering3"),col=c("black","red","blue"),lwd=1)



dev.off()




