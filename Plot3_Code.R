setwd("/Users/dancardella/Coursera_Data_Science/Housing_Elec_Consumption")

data_set<- read.table("household_power_consumption.txt", header = TRUE, 
                      sep = ";")

# Splicing out Feb 1 and Feb 2 of 2007
days_we_want <- data_set[66637:69516,]

days_we_want$Global_active_power<- as.integer(days_we_want$Global_active_power)/500
days_we_want$Sub_metering_2<- as.numeric(days_we_want$Sub_metering_2)
days_we_want$Sub_metering_1<- as.numeric(days_we_want$Sub_metering_1)
days_we_want$Voltage<- as.numeric(days_we_want$Voltage)
days_we_want$Global_reactive_power<- as.numeric(days_we_want$Global_reactive_power)/500


Plot # 3
with(days_we_want, plot(Time, Sub_metering_1), type ="n", xaxp= c(0,40,10), mar =c(1,1,1,1), ylab = "Submetering")
lines(days_we_want$Time, days_we_want$Sub_metering_2, col="red")
lines(days_we_want$Time, days_we_want$Sub_metering_3, col="blue")
legend("topright", pch = 19, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Uncheck this if you'd like to save a png
# dev.copy(png, file = "plot3.png") # Copy my plot to a PNG file
# dev.off() 