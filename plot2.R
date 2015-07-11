

data.file = "./data/household_power_consumption.txt"

data = read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

graph.data = data[data$Date %in% c("1/2/2007","2/2/2007"), ]

global_active_power = as.numeric(graph.data$Global_active_power)

datetime = strptime(paste(graph.data$Date, graph.data$Time, sep=' '), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
 
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
