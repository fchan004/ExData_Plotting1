#Reading data
#setwd("C:/Users/VXL/Documents/Cursos Internet/Data Specialization/4_Exploratory Data Analysis/PeerAssessment_1")
raw <-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subsetting
raw2 <-subset(raw, raw$Date %in% c("1/2/2007","2/2/2007"))
remove(raw)
raw2$Date <- as.Date(raw2$Date, "%d/%m/%Y")

date_time <- paste(raw2$Date, raw2$Time)
date_time <- strptime(date_time, "%Y-%m-%d %H:%M:%S")
raw2 <- cbind(date_time, raw2)


#Plot1
png(file = "plot1.png", width = 480, height = 480)
hist(raw2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

#Plot2
png(file = "plot2.png", width = 480, height = 480)
plot(raw2$date_time, raw2$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()

#Plot3
png(file = "plot3.png", width = 480, height = 480)
plot(raw2$date_time, raw2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(raw2$date_time, raw2$Sub_metering_2, col = "red")
lines(raw2$date_time, raw2$Sub_metering_3, col = "blue")
legend("topright", pch = "__________", col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

#Plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(raw2, {
        plot(date_time, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power")
        plot(date_time, Voltage, type = "l", xlab ="datetime", ylab = "Voltage")
        plot(raw2$date_time, raw2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(raw2$date_time, raw2$Sub_metering_2, col = "red")
        lines(raw2$date_time, raw2$Sub_metering_3, col = "blue")
        legend("topright", pch = "_", col = c("black","blue","red"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(date_time, Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")        
})
dev.off()
