# setwd("D:/Coursera/Data Science/4 Exploratory Data Analysis/Course Project 1")   # Set Working Directory
# unzip("household_power_consumption.zip")                                         # Extract input zip archive

# Read the input file in table format and create a data frame from it
DataFrame <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', dec = ".", na.string = '?')

# perform conversions on the date & time values:
DataFrame$Datetime <- strptime(paste(DataFrame$Date, DataFrame$Time, " "), format = "%d/%m/%Y %H:%M:%S")
DataFrame$Date <- as.Date(DataFrame$Date, format = "%d/%m/%Y")

# DataSubSet for 2-day period in Feb.,2007 (from 2007-02-01 till 2007-02-02)
DataSubSet <- DataFrame[(DataFrame$Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (DataFrame$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

# create "plot1.png" file
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

#  I must change "localisation", because "X axis values" should be in English (I live in Russia)
DefaultFormat <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

#  Create "Global_active_power" plot in 2-day period in Feb.,2007 (from 2007-02-01 till 2007-02-02).
plot(DataSubSet$Datetime, DataSubSet$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# shuts down the device
dev.off()

# Now I should return "Russian localisation"
# "Good manners" are to return default values for changed variables before end of program
Sys.setlocale("LC_TIME", DefaultFormat)