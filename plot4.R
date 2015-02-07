# Load additional library extensions used for datetime
library("lubridate", lib.loc="~/Library/R/3.1/library")

# Load source data for Feb 1-2 2007
hpc <- read.csv("./household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
hpc <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')

# Add a POXIXct column datetime column
hpc$datetime <- dmy_hms(paste(hpc$Date,hpc$Time))

# Save 4 plots as 480x480 .pgn file
png("./plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(hpc$datetime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")

with(hpc, plot(datetime, Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="l", col="black"))
with(hpc, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(hpc, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), bty = "n")

with(hpc,plot(datetime, Global_reactive_power, type="l"))

dev.off()


