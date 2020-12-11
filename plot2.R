#load data and select the correct days
#the file was previously charged to my working directory and wasnt necessary to unzip it.

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetdate <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#Second plot
png("plot2.png", width=480, height=480)
datetime <- as.POSIXlt(paste(subsetdate$Date, subsetdate$Time, sep=" "))
plot(datetime, subsetdate$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.8)
lines(datetime, subsetdate$Global_active_power)
dev.off()