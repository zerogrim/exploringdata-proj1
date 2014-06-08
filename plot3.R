data <- read.table('household_power_consumption.txt', sep=";", header=FALSE, skip=66636, nrow=2882)
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
data$Date <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
data$Day <- strftime(data$Date, format("%a"))
png('plot3.png')

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

legend( "topright", 
        lty=c(1,1),
        col= c("Black","Red","Blue"),
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
dev.off()
