#-------------------------------------------------------------------------------
#
# Exploratory Data Analysis - Project 1
#
# Author: Timothy R. Warren
# GitHub: https://github.com/kreas/ExData_Plotting1
# File: plot2.R
#
# Directions -------------------------------------------------------------------
#
# * Download the file from README.txt and extract it to the root directory of
#   this project.
# * Source this file with `source('plot2.R')`
# * Once this script compeletes you can find the output in the project's root
#   Directiory with the name plot2.png
#
#-------------------------------------------------------------------------------

# Read the data file from the project's root directory.
data <- read.table("household_power_consumption.txt",
                            header=T,
                            sep=";",
                            na.strings="?")

# Subset the data to only the dates needed.
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Combine Date and Time Create a new column in data called Date_time 
data$Date_time <- paste(data$Date, data$Time, sep=" ")
data$Date_time <- strptime(data$Date_time, format="%d/%m/%Y %H:%M:%S")



# Set output options
png(file = "plot2.png", width = 480, height = 480, bg = "transparent") 

# Create a line plot from the data
plot(data$Date_time, 
     data$Global_active_power, 
     type = "l",
     xlab="", 
     ylab="Global Active Power (Kilowatts)")

# Close the file device
dev.off()
