library(dplyr)
library(lubridate)
## printing the number of MBs required
#print((2075259*9*8)/2^20)

#wholedf <- tbl_df(data <- read.delim("household_power_consumption.txt",sep=";"))

df$Date<-as.Date(df$Date,format="%d/%m/%Y")
dfdates<-filter(df,Date=="2007-02-01"|Date=="2007-02-02")
GAP<- as.numeric(paste(dfdates$Global_active_power))
date_time <- ymd_hms(paste(dfdates$Date,dfdates$Time))
png("plot2.png",width=480,height=480)
plot(date_time,GAP,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()




