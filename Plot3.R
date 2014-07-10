# Plot the third graph, in 3 colors

## Read the data into R, separating using tab
data1 <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)

## convert date field from text to date, and other fields to numeric
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y") 
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

## subset the data to select only the dates: 2007-02-01, 2007-02-02
ind <- data1$Date>=("2007-02-01") & data1$Date <= ("2007-02-02")
data2 <- data1[ind,]

## add times to Date field and cbind into table
dateTimes <- paste(data2$Date, data2$Time, sep=" ")
dateTimes <- as.POSIXlt(dateTimes)
data3 <- cbind(data2, dateTimes)

## turn on device
png(filename="./Assignment1/Plotting1/plot3.png", height=480, width=480)

## plot and add additional lines
plot(y=data3$Sub_metering_1, x=data3$dateTimes, type="l", col="grey", xlab="", ylab="Energy sub metering")
lines(y=data3$Sub_metering_2, x=data3$dateTimes, type="l", col="red")
lines(y=data3$Sub_metering_3, x=data3$dateTimes, type="l", col="blue")

## add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5, 2.5),col=c("grey", "blue","red"))

## turn off device
dev.off()