

data.file = "./data/household_power_consumption.txt"

data = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

graph.data = data[data$Date %in% c("1/2/2007","2/2/2007"), ]

global_active_power = as.numeric(graph.data$Global_active_power)

global_reactive_power = as.numeric(graph.data$Global_reactive_power)

datetime = strptime(paste(graph.data$Date, graph.data$Time, sep=' '), "%d/%m/%Y %H:%M:%S")

subMetering1 = as.numeric(graph.data$Sub_metering_1)

subMetering2 = as.numeric(graph.data$Sub_metering_2)

subMetering3 = as.numeric(graph.data$Sub_metering_3)

voltage = as.numeric(graph.data$Voltage)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
