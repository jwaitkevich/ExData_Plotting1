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
#create png file
png("plot2.png", width=480, height=480)
#create plot
plot(power.subset$Time, globalactivepower, type="l", xlab = "", ylab = "Global Active Power (kilowatts")
#close file
dev.off()

