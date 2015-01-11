# setwd("D:/Coursera/Data Science/4 Exploratory Data Analysis/Course Project 1")   # Set Working Directory
# unzip("household_power_consumption.zip")                                         # Extract input zip archive

# Read the input file in table format and create a data frame from it
DataFrame <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', dec = ".", na.string = '?')

# represent calendar dates in the right format
DataFrame$Date <- as.Date(DataFrame$Date, format = "%d/%m/%Y")

# DataSubSet for 2-day period in Feb.,2007 (from 2007-02-01 till 2007-02-02)
DataSubSet <- DataFrame[(DataFrame$Date >= as.Date("2007-02-01", "%Y-%m-%d")) & (DataFrame$Date <= as.Date("2007-02-02", "%Y-%m-%d")),]

# create "plot1.png" file
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

#  Create "Global_active_power" histogram in 2-day period in Feb.,2007 (from 2007-02-01 till 2007-02-02).
# "yaxp" & "xaxp" are used to set graphical parameters. These are vectors  of the form c(y1, y2, n)...
#  ...giving the coordinates of the extreme tick marks and the number of intervals between tick-marks
hist(DataSubSet$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13,
     ylim = c(0, 1200), xlim = c(0, 6), yaxp = c(0, 1200, 6), xaxp = c(0, 6, 3))

# shuts down the device
dev.off()