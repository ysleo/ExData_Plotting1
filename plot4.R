plot4 <- function() {
 	# filter only the targeted date 
 	grep_data <- grep("^(1/2/2007)|^(2/2/2007)", readLines("household_power_consumption.txt"))
 	# assuming data are sorted skip from the first grep until the length of grep
 	data <- read.table("household_power_consumption.txt", sep=";", skip=grep_data[1], nrows=length(grep_data), col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 	# add a column that associate Date and time
 	data$DateTime <- paste(data$Date, data$Time, " ")
 	# open the png file
 	png("plot4.png")
 	# Needed for no english computer else day are in local
 	Sys.setlocale("LC_TIME", "en_US.UTF-8")
 	# divide device into 2 rows x 2 columns
 	par(mfrow = c(2,2))
 	# Draw first graph
 	 plot(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, type="line", ylab="Global Active Power", xlab="")
	# Draw second graph
	plot(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Voltage, type="line", ylab="Voltage", xlab="datetime")
	# Draw third graph
	plot(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type="line", ylab="Energy sub metering", xlab="")
	lines(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, col="red")
	lines(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, col="blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")
	# Draw fourth graph
	plot(as.POSIXlt(data$DateTime, format="%d/%m/%Y %H:%M:%S"), data$Global_reactive_power, type="line", ylab="Global_reactive_power", xlab="datetime")
	# close device
 	dev.off()
 }