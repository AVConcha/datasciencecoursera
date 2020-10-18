# Course 4, week 1, assignment, plot2


############### Getting the data #############################

library(graphics)
library(grDevices)
library("lubridate")
Sys.setlocale("LC_ALL", "English")

#setwd("~/Cursos/R_specialization/c4_w1")

filename <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

power <- read.table(filename, header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

############### Filter by dates ############################### 

power$Date <- as.Date(power$Date, "%d/%m/%Y")


power <- subset(power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))



## Combine Date and Time column
power$dateTime <- paste(power$Date, power$Time)

power$Global_active_power <- as.numeric(power$Global_active_power)

power <- power[complete.cases(power),]


power$dateTime <- parse_date_time(power$dateTime, orders="ymd HMS")

###############  Plot 2 ############################### 
plot(x=power$dateTime,y=power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## Creating a PNG file

dev.copy(png, "plot2.png", height=480, width=480)

dev.off()