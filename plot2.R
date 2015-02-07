# Draw graphic of Global_active_power according time
plot2 <- function() {
 	# filter only the targeted date 
 	grep_data <- grep("^(1/2/2007)|^(2/2/2007)", readLines("household_power_consumption.txt"))
 	# assuming data are sorted skip until the first grep until the length
 	data <- read.table("household_power_consumption.txt", sep=";", skip=grep_data[1], nrows=length(grep_data), col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 	# add a column that associate Date and time
 	data$DateTime <- paste(data$Date, data$Time, " ")
 	# open the png file
 	png("plot2.png")
 	# Needed for no english computer else day are in local
 	Sys.setlocale("LC_TIME", "en_US.UTF-8")
 	# Draw 
 	plot(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, type="line", ylab="Global Active Power (kilowatts)", xlab="")
 	# close device
 	dev.off()
 }