#import table
power.dt <- read.table("C:/Users/jwaitkevich/Documents/exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
#subset data
power.subset <- power.dt[power.dt$Date %in% c("1/2/2007", "2/2/2007") ,]
#make data numeric
globalactivepower <- as.numeric(power.subset$Global_active_power)
#create png file
png("plot1.png", width=480, height=480)
#create plot
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")
#close file
dev.off()
