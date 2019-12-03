###### plot1.R ######

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


#### plot 1 ####
hist(hpc1$Global_active_power, 
     main = "Global Active Power",
     col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png") 
dev.off() 

rm(list = ls())