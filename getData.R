## If the file hasn't been downloaded, download it.
if(!file.exists("household_power_consumption.txt")){
  path <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zipfile <- 'household_power_consumption.zip'
  download.file(path, destfile=zipfile, method="curl", 
                extra=c('--silent', '-w "[%{filename_effective}] Size:%{size_download} Speed:%{speed_download} Time:%{time_connect} Elapsed%{time_total}\n"'))
  unzip(zipfile)
}


## If the dataframe doesn't exist, recreate it.
library(sqldf)
conn <- sqldf() # Open connection
power <- read.csv.sql (file = "household_power_consumption.txt", 
                      sql = "select * from file where Date in ('1/2/2007','2/2/2007')",
                      sep=";", filter="egrep -v '\\?'")
# Note: we're using "egrep -v '\?' to filter out rows with missing values.
#  This won't be platform portable to non-POSIX platforms like windows.
conn <- sqldf() # Close connection

# Filtering out rows with NA doesn't happen to be necessary when just looking at
# these two dates. Filter them out anyway as roughly 1% of provided rows have 
# these NA values. As a result, we could assert that
# sum(!complete.cases(power)) == 0 or subset using complete.cases.

power$DateTime <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S",tz="GMT")
power$Date <- as.Date(power$Date,format="%d/%m/%Y")

# We don't actually use power$Date on the graphs, but will switch to 
# Date datatype anyway.
