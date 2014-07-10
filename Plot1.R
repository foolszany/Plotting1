# Plotting a histogram of Global Active Power

## Read the data into R, separating using tab
data1 <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

## convert date field from text to date, and other fields to numeric
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y") 
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

## subset the data to select only the dates: 2007-02-01, 2007-02-02
ind <- data1$Date>=("2007-02-01") & data1$Date <= ("2007-02-02")
data2 <- data1[ind,]

## open device for printing
png(filename="./Assignment1/Plotting1/plot1.png", height=480, width=480)
## Create Histogram
hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
## close device
dev.off()
