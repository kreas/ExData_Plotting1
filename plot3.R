#-------------------------------------------------------------------------------
#
# Exploratory Data Analysis - Project 1
#
# Author: Timothy R. Warren
# GitHub: https://github.com/kreas/ExData_Plotting1
# File: plot3.R
#
# Directions -------------------------------------------------------------------
#
# * Download the file from README.txt and extract it to the root directory of
#   this project.
# * Source this file with `source('plot3.R')`
# * Once this script compeletes you can find the output in the project's root
#   Directiory with the name plot3.png
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
png(file = "plot3.png", width = 480, height = 480, bg = "transparent") 

# create a multi-line plot from the data
with(data, {
  
  # Create a line plot with the first sub metering
  plot(data$Date_time, 
       data$Sub_metering_1, 
       type = "l",
       col="black",
       xlab="",
       ylab="Energy sub metering")
  
  # add lines representing the second and third sub metering 
  lines(data$Date_time, data$Sub_metering_2, type = "l", col="red")
  lines(data$Date_time, data$Sub_metering_3, type = "l", col="blue")
  
  # Set a legend in the top right corner describing the data.
  legend("topright", lty ="solid", col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

# Close the file device
dev.off()
