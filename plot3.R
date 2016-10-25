data <- read.csv("household_power_consumption.txt",sep = ";")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
subdata<- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
subdata$newdate <- with(subdata, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
par(mfrow=c(1,1))
png(file="plot3.png")

#plot3
plot(subdata$newdate, subdata$Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
lines(subdata$newdate, subdata$Sub_metering_1, col="black")
lines(subdata$newdate, subdata$Sub_metering_2, col="red")
lines(subdata$newdate, subdata$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2,2,2), col= c("black","red","blue"))

dev.off()
