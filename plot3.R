source("getData.R")

# Plot 3

png(filename="plot3.png", width=480, height=480, bg="transparent")
oldmar <- par()$mar
par(mar=oldmar)

with (power, {
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=1)
})
par(mar=oldmar)
dev.off()
