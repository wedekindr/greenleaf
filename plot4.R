data <- read.csv("household_power_consumption.txt",sep = ";")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
subdata<- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
subdata$newdate <- with(subdata, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

png(file="plot4.png")

#plot4
par(mfrow=c(2,2))
plot(subdata$newdate, subdata$Global_active_power/1000, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(subdata$newdate, subdata$Global_active_power/1000)

plot(subdata$newdate, subdata$Voltage, xlab="datetime", ylab="Voltage",type="n")
lines(subdata$newdate, subdata$Voltage, col="black", lwd="1")

plot(subdata$newdate, subdata$Sub_metering_1, type="n", ylab = "Energy sub metering",xlab="")
lines(subdata$newdate, subdata$Sub_metering_1, col="black")
lines(subdata$newdate, subdata$Sub_metering_2, col="red")
lines(subdata$newdate, subdata$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2,2,2), col= c("black","red","blue"), bty = "n")


plot(subdata$newdate, subdata$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",type="n")
lines(subdata$newdate, subdata$Global_reactive_power, col="black", lwd="1")


dev.off()
