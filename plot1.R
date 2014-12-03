##preparing the data
unzip("exdata_data_household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=F, sep=";", skip=66637, nrow=2880)

## attaching a header to the data, formatting date as date
header <- readLines("household_power_consumption.txt", n=1)
header2 <- unlist(strsplit(header, split=";"))
colnames(data) <- header2
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## writing the plot into a png file
png("plot1.png",  width = 480, height = 480, units = "px")
hist(data$Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()
