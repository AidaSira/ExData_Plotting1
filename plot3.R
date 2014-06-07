dat  <- read.table("household_power_consumption.txt", header = T, sep=";")
data <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
require("lubridate")
data$DtTime <- ymd_hms(paste(data$Date, data$Time, sep = "_"))


plot(data$DtTime, as.numeric(as.character(data$Sub_metering_1)),
	ylab="Energy sub metering", xlab="",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_1 )))
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_2 )), col="red")
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_3 )), col="blue")

legend("topright", col=c("black", "blue", "red"),lwd=2,
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png")
dev.off()

