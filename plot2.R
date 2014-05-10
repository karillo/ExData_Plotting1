source("getData.R")

# Plot 2

png(filename="plot2.png", width=480, height=480, bg="transparent")

with (power, 
      plot(DateTime, Global_active_power, 
           type="l", 
           xlab="", ylab="Global Active Power (kilowatts)")
      )
dev.off()
