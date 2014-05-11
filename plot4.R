source("getData.R")

# Plot 4

png(filename="plot4.png", width=480, height=480, bg="transparent")


oldmfrow <- par()$mfrow
par(mfrow=c(2,2))


with (power, {
  # First linegraph - Global Active Power
  plot(DateTime, Global_active_power,type="l",
       xlab="", ylab="Global Active Power")
  
  # Second linegraph - Voltage
  plot(DateTime, Voltage,type="l", xlab="datetime")
  
  # Third linegraph - Sub Metering
  plot(DateTime, Sub_metering_1, type="l", col="black", 
       xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", 
         legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c("black","red","blue"), lwd=1, box.col="transparent")
  
  # Fourth linegraph - Global Reactive Power
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
  
})

par(mfrow=oldmfrow)


dev.off()
