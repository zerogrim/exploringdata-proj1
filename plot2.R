data <- read.table('household_power_consumption.txt', sep=";", header=FALSE, skip=66636, nrow=2882)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Day <- strftime(data$Date, format("%a"))
png('plot2.png')
plot(   data$Date,
        data$Global_active_power,
        type ="l",
        ylab = "Global Active Power (kilowatts)",
        xlab = ""


)
dev.off()
