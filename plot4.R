dat  <- read.table("household_power_consumption.txt", header = T, sep=";")
data <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
require("lubridate")
data$DtTime <- ymd_hms(paste(data$Date, data$Time, sep = "_"))


par(mfrow=c(2,2))


#row1,col1
plot(data$DtTime, as.numeric(as.character(data$Global_active_power)),
	ylab="Global Active Power", xlab="",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Global_active_power)))


#row1,col2
plot(data$DtTime, as.numeric(as.character(data$Voltage)),
	ylab="Voltage", xlab="datetime",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Voltage)))


#row2, col1
plot(data$DtTime, as.numeric(as.character(data$Sub_metering_1)),
	ylab="Energy sub metering", xlab="",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_1 )))
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_2 )), col="red")
lines(data$DtTime, as.numeric(as.character(data$Sub_metering_3 )), col="blue")

legend("topright", col=c("black", "blue", "red"),lwd=2,bty = "n", cex=0.8,
	legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#row2, col2
plot(data$DtTime, as.numeric(as.character(data$Global_reactive_power)),
	ylab="Global_reactive_power", xlab="datetime",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Global_reactive_power)))




dev.copy(png, file="plot4.png")
dev.off()

