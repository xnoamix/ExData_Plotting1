##preparing the data
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=F, sep=";", skip=66637, nrow=2880)

## attaching a header to the data, combining date and time to timestamp
header <- readLines("household_power_consumption.txt", n=1)
header2 <- unlist(strsplit(header, split=";"))
colnames(data) <- header2
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$ts <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## writing the plot into a png file
png("plot2.png",  width = 480, height = 480, units = "px")
plot(data$ts, data$Global_active_power, type ="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
