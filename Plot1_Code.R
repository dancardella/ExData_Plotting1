setwd("/Users/dancardella/Coursera_Data_Science/Housing_Elec_Consumption")

data_set<- read.table("household_power_consumption4.txt", header = TRUE, 
                      sep = ";")

# Splicing out Feb 1 and Feb 2 of 2007
days_we_want <- data_set[66637:69516,]

days_we_want$DateTime <- strptime(paste(days_we_want$Date,days_we_want$Time), format = "%d/%m/%Y %H:%M:%S")

days_we_want$Global_active_power<- as.integer((days_we_want$Global_active_power))
days_we_want$Sub_metering_2<- as.numeric(paste(days_we_want$Sub_metering_2))
days_we_want$Sub_metering_1<- as.numeric(paste(days_we_want$Sub_metering_1))
days_we_want$Voltage<- as.numeric(paste(days_we_want$Voltage))
days_we_want$Global_reactive_power<- as.numeric(paste(days_we_want$Global_reactive_power))

#Plot # 1
hist_graph<- hist(gap_as_int, main = "Global Active Power", col="red", xlab= "Global Active Power (kilowatts)")

# Uncheck this if you'd like to save a png
# dev.copy(png, file = "plot1.png") # Copy my plot to a PNG file
# dev.off() 
