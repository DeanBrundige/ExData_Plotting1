# Load additional library extensions used in this this
library("lubridate", lib.loc="~/Library/R/3.1/library")

# Getting the source data
if(!file.exists("~/exdata-data-household_power_consumption.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="~/exdata-data-household_power_consumption.zip",method="curl", quiet=TRUE)
}

if(!file.exists("~/household_power_consumption.txt")){
  unzip("~/exdata-data-household_power_consumption.zip", "household_power_consumption.txt")
}

# Load source data for Feb 1-2 2007
hpc <- read.csv("~/household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
hpc <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')

# Add a POXIXct column DateTime column
hpc$DateTime <- dmy_hms(paste(hpc$Date,hpc$Time))

# Plot the line graph as 480x480 .png file
png("~/plot3.png", width = 480, height = 480)
with(hpc, plot(DateTime, Sub_metering_1, main = "", xlab = "", ylab = "Energy sub metering", type="l", col = "black"))
with(hpc, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(hpc, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
