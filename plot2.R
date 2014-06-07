dat  <- read.table("household_power_consumption.txt", header = T, sep=";")
data <- dat[(dat$Date == "1/2/2007" | dat$Date == "2/2/2007"),]

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
require("lubridate")
data$DtTime <- ymd_hms(paste(data$Date, data$Time, sep = "_"))


plot(data$DtTime, as.numeric(as.character(data$Global_active_power)),
	ylab="Global Active Power (kilowatts)", xlab="",
	main="", type="n")
lines(data$DtTime, as.numeric(as.character(data$Global_active_power)))

dev.copy(png, file="plot2.png")
dev.off()

