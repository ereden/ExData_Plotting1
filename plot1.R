##To make a histogram of Global Active Power Use from 2007-02-01 and 2007-02-02
##First, need to load data into R in a function called "power"

power <- read.csv("household_power_consumption.txt", sep = ";", head = TRUE, na = "?")

##Also want to make dates read in R using as.Date() command

power$Date2 <- as.Date(power$Date, format = "%d/%m/%Y")

##Then need to subset only the dates we're interested in and save them in "poweruse"

poweruse <- power[power$Date2 <= "2007-02-02" & power$Date2 >= "2007-02-01",]

##Now we can make the times read in R using strptime() command

poweruse$DateTime <- paste(poweruse$Date, poweruse$Time, sep = " ")

poweruse$timeinfo <- as.POSIXct(poweruse$DateTime, format = "%d/%m/%Y %H:%M:%S")

##Global_active_power needs to be a numeric vector in order to generate a histogram

poweruse$Global_active_power_char <- as.character(poweruse$Global_active_power)
poweruse$Global_active_power_num <- as.numeric(poweruse$Global_active_power_char)

##Now, we'll initialize a png file and make our histogram in it. Note we're
##dividing Global_active_power by 1000 in order to express it in units of kilowatts

png("plot1.png")
hist(poweruse$Global_active_power_num, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

##And finally, we close the png file

dev.off()