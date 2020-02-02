#import table
power.dt <- read.table("C:/Users/jwaitkevich/Documents/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#subset data
power.subset <- power.dt[power.dt$Date %in% c("1/2/2007", "2/2/2007") ,]
#set date
power.subset$Date <- as.Date(power.subset$Date, format="%d/%m/%Y")
#set time
power.subset$Time <- strptime(power.subset$Time, format="%H:%M:%S")
power.subset[1:1440,"Time"] <- format(power.subset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
power.subset[1441:2880,"Time"] <- format(power.subset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
#make data numeric
globalactivepower <- as.numeric(power.subset$Global_active_power)
#set submetering to numeric
submetering1 <- as.numeric(power.subset$Sub_metering_1)
submetering2 <- as.numeric(power.subset$Sub_metering_2)
submetering3 <- as.numeric(power.subset$Sub_metering_3)
#create png file
png("plot3.png", width=480, height=480)
#create plot
plot(power.subset$Time, submetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(power.subset$Time, submetering2, type="l", col="red")
lines(power.subset$Time, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#close file
dev.off()

