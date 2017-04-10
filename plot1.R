# Loading file
fileName <- "C:/Users/Toshiba/Documents/R/Coursera/Graphs/household_power_consumption.txt"
power <- read.table(fileName, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
# Subsetting into a data frame
df <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
# Plot
hist(df$Global_active_power, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
# Graphics Device
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

