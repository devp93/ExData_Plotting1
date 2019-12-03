###### plot3.R ######

rm(list = ls()) ## clear environment 
dev.off() ## clear existing plots

## set working directory
setwd("C:/Users/Dev/Google Drive/R/Coursera/4 - Exploratory Analysis/Week 1/Course Project")

## import data
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                  stringsAsFactors = FALSE, header = TRUE) 

## create a DateTime variable and format as POSIXlt
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format = "%d/%m/%Y %H:%M:%S")

## format Date as date
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
str(hpc) ## check data

## subset data to keep required dates
req_dates <- as.Date(c("2007-02-01", "2007-02-02"), format = "%Y-%m-%d") 
hpc1 <- hpc[hpc$Date %in% req_dates, ]


#### plot3 ####
with(hpc1, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = ""))
lines(hpc1$DateTime, hpc1$Sub_metering_1, col = "black")
lines(hpc1$DateTime, hpc1$Sub_metering_2, col = "red")
lines(hpc1$DateTime, hpc1$Sub_metering_3, col = "blue")
title(ylab = "Energy sub metering")
legend("topright", 
       cex = 0.6,  
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

###### would appreciate if someone can comment how to make the legend smaller, without changing text size

dev.copy(png, "plot3.png") 
dev.off()

rm(list = ls())