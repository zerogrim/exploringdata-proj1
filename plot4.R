data <- read.table( 'household_power_consumption.txt', 
                    sep=";", 
                    header=FALSE, 
                    skip=66636, 
                    nrow=2882)

colnames(data) <- c(    "Date",
                        "Time",
                        "Global_active_power",
                        "Global_reactive_power",
                        "Voltage","Global_intensity",
                        "Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3")

data$Date <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
png('plot4.png')
par(mfcol = c(2,2))

### PLOT 1 ######
plot(   data$Date,
        data$Global_active_power,
        type ="l",
        ylab = "Global Active Power (kilowatts)",
        xlab = ""


)


### PLOT 2 ######
plot(
        data$Date, 
        data$Sub_metering_1, 
        ylab = "Energy Sub Metering", 
        xlab = "",
        type="n") 
                  
points( data$Date, 
        data$Sub_metering_1, 
        ylab = "Energy Sub Metering", 
        type="l", 
        col="Black")     

points( data$Date, 
        data$Sub_metering_2, 
        ylab = "Energy Sub Metering", 
        type="l", 
        col="Red")       

points( data$Date, 
        data$Sub_metering_3, 
        ylab = "Energy Sub Metering", 
        type="l", 
        col="Blue")        




### PLOT 3 ######

plot(   data$Date,
        data$Voltage,
        ylab = "Voltage",
        xlab = "datetime",
        type = "l"
        )

### PLOT 4 ######
plot(   data$Date,
        data$Global_reactive_power,
        ylab = "Global_reactive_power",
        xlab = "datetime",
        type = "l"
        )
dev.off()
