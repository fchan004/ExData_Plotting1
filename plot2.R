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

#Plot2
png(file = "plot2.png", width = 480, height = 480)
plot(raw2$date_time, raw2$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
