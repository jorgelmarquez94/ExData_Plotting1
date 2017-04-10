# Loading file
fileName <- "C:/Users/Toshiba/Documents/R/Coursera/Graphs/household_power_consumption.txt"
power <- read.table(file, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
# Subsetting into a dataframe
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# Plot
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
# Graphics Device
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()