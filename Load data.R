#load data and select the correct days
#the file was previously charged to my working directory and wasnt necessary to unzip it.

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, as.is = TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
subsetdate <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
