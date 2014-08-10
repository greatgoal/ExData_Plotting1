# This piece of code is for Exploratory Data Analysis Course Project 1
# It plots the third graph
# Thank you for your kind consideration
plot3 <- function() {
  # Read in data from file and handle the missing values, assuming the file is in the directory
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  
  # Convert the date column to Date format
  rawData$Date <- as.Date(rawData$Date,format="%d/%m/%Y")
  
  # Extract the relevant data for the required two dates
  extractData <- subset(rawData,rawData$Date>=as.Date("2007-02-01") & rawData$Date<=as.Date("2007-02-02"))
  
  # # Combine the date and time data to construct the date-time data points
  dateTime <- strptime(paste(extractData$Date,extractData$Time), format="%Y-%m-%d %H:%M:%S")
  
  # Plot the third graph and save as png format
  png(file="plot3.png", width=480, height=480) # Sepcify the graph name and the graph size
  plot(dateTime,extractData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering") # Plot the graph and specify the plot type and the label
  # Add energy sub metering No2 & No3 with red and blue color respectively
  lines(dateTime,extractData$Sub_metering_2,type="l",col="red")
  lines(dateTime,extractData$Sub_metering_3,type="l",col="blue")
  # Add legend
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  dev.off() # Close the png device
}