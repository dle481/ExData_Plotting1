options(stringsAsFactors = FALSE)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";" )
data$Date <- as.Date(data$Date, "%d/%m/%Y")
df <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

df$Global_active_power <- as.numeric(df$Global_active_power)
df$day = weekdays(df$Date)


png("plot2.png",  width = 480, height = 480)
plot(df$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "",type = "l", xaxt = 'n')
axis(1, labels = c("Thu","Fri","Sat"), at = c(1,head(which(df$day == "Friday"),1), length(df$day)), tick = TRUE)
dev.off()
