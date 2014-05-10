source("getData.R")

# Plot 1

png(filename="plot1.png", width=480, height=480, bg="transparent")
oldmar <- par()$mar
par(mar=c(5,6.5,4,4) + 0.1)
hist(x=power$Global_active_power,
     col="red", 
     main = "Global Active Power",
     xlab="Global Active Power (kilowatts)")
par(mar=oldmar)
dev.off()
