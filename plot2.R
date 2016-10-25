data <- read.csv("household_power_consumption.txt",sep = ";")
data$Date <-as.Date(data$Date, "%d/%m/%Y")
subdata<- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
subdata$newdate <- with(subdata, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M"))
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)
par(mfrow=c(1,1))
png(file="plot2.png")
#plot2
plot(subdata$newdate, subdata$Global_active_power/1000, type="n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(subdata$newdate, subdata$Global_active_power/1000)

dev.off()
