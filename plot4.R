options(stringsAsFactors = FALSE)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";" )
data$Date <- as.Date(data$Date, "%d/%m/%Y")
df <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')
df$Global_active_power <- as.numeric(df$Global_active_power)
df$day = weekdays(df$Date)

png("plot4.png",  width = 480, height = 480)
par(mfrow=c(2,2))

## Plot  Top Left
plot(df$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "",type = "l", xaxt = 'n')
axis(1, labels = c("Thu","Fri","Sat"), at = c(1,head(which(df$day == "Friday"),1), length(df$day)), tick = TRUE)

## Plot Bottom Left
plot(df$Sub_metering_1, ylab = "Energy sub metering", xlab = "",type = "l", xaxt = 'n')
lines(df$Sub_metering_2, col = "red")
lines(df$Sub_metering_3, col = "blue")
axis(1, labels = c("Thu","Fri","Sat"), at = c(1,head(which(df$day == "Friday"),1), length(df$day)), tick = TRUE)
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"), cex = .30)


## Plot Top Right
plot(df$Voltage, ylab = "Voltage", xlab = "datetime",type = "l", xaxt = 'n')
axis(1, labels = c("Thu","Fri","Sat"), at = c(1,head(which(df$day == "Friday"),1), length(df$day)), tick = TRUE)


## Plot Bottom Right
plot(df$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime",type = "l", xaxt = 'n')
axis(1, labels = c("Thu","Fri","Sat"), at = c(1,head(which(df$day == "Friday"),1), length(df$day)), tick = TRUE)

dev.off()
