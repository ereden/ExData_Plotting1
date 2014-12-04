##To make a histogram of Global Active Power Use from 2007-02-01 and 2007-02-02
##First, need to load data into R in a function called "power"

power <- read.csv("household_power_consumption.txt", sep = ";", head = TRUE, na = "?", stringsAsFactors = FALSE)

##Also want to make dates read in R using as.Date() command

power$Date2 <- as.Date(power$Date, format = "%d/%m/%Y")

##Then need to subset only the dates we're interested in and save them in "poweruse"

poweruse <- power[power$Date2 <= "2007-02-02" & power$Date2 >= "2007-02-01",]

##Now we can make the times read in R using strptime() command

poweruse$DateTime <- paste(poweruse$Date, poweruse$Time, sep = " ")

poweruse$timeinfo <- as.POSIXct(poweruse$DateTime, format = "%d/%m/%Y %H:%M:%S")

poweruse$Global_active_power_num <- as.numeric(poweruse$Global_active_power)

png("plot2.png")
plot(poweruse$timeinfo, poweruse$Global_active_power_num, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

##And finally, we close the png file

dev.off()