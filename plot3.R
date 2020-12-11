#load data and select the correct days
#the file was previously charged to my working directory and wasnt necessary to unzip it.

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetdate <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))


#Third plot
png("plot3.png", width=480, height=480)
datetime <- as.POSIXlt(paste(subsetdate$Date, subsetdate$Time, sep=" "))
plot(datetime, subsetdate$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", cex.lab=0.8)
lines(datetime, subsetdate$Sub_metering_1, col="black")
lines(datetime, subsetdate$Sub_metering_2, col="red")
lines(datetime, subsetdate$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"))
dev.off()
