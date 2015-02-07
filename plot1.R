# Load source data for Feb 1-2 2007
hpc <- read.csv("./household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
hpc <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')

# Cast the Date, Time colums
hpc$Date = as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time = strptime(hpc$Time,"%H:%M:%S")

# Plot the histogram as 480x480 .png file
png("./plot1.png", width = 480, height = 480)
hist(as.numeric(hpc$Global_active_power), main = 'Global Active Power', xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

