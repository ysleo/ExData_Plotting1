 plot1 <- function() {
 	# filter only the targeted date 
 	grep_data <- grep("^(1/2/2007)|^(2/2/2007)", readLines("household_power_consumption.txt"))
 	# assuming data are sorted skip until the first grep until the length
 	data <- read.table("household_power_consumption.txt", sep=";", skip=grep_data[1], nrows=length(grep_data), col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 	# open the png file
 	png("plot1.png")
 	# draw the histogram
 	hist(data$Global_active_power, main="Global Active Power",  xlab="Global Active Power (kilowatts)", col="red")
 	# close device
 	dev.off()
 }
