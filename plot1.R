dat  <- read.table("household_power_consumption.txt", header = T, sep=";")
data <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]


hist(as.numeric(as.character(data$Global_active_power)), col="red", 
	xlab="Global Active Power (kilowatts)",
	main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

