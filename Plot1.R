#load data and select the correct days
#the file was previously charged to my working directory and wasnt necessary to unzip it.

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetdate <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#First plot 
png("plot1.png", width=480, height=480)
par(mar=c(4, 4, 3, 2))
histogram <- hist(x=as.numeric(subsetdate$Global_active_power), col = "red", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", main = "Global Active Power", cex.lab=0.8)
dev.off()
