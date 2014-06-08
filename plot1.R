options(stringsAsFactors = FALSE)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";" )
data$Date <- as.Date(data$Date, "%d/%m/%Y")
df <- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

df$Global_active_power <- as.numeric(df$Global_active_power)



png("plot1.png",  width = 480, height = 480)
hist(df$Global_active_power, xlab = "Global Active Power (kilowatts)",freq = TRUE, col = 'red')
dev.off()
