# Load additional library extensions used in this this
library("lubridate", lib.loc="~/Library/R/3.1/library")

# Load source data for Feb 1-2 2007
hpc <- read.csv("~/household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
hpc <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')

# Add a POXIXct column DateTime column
hpc$DateTime <- dmy_hms(paste(hpc$Date,hpc$Time))

# Plot the lie graph as 480x480 .png file
png("~/plot2.png", width = 480, height = 480)
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
