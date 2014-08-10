# This piece of code is for Exploratory Data Analysis Course Project 1
# It plots the first graph
# Thank you for your kind consideration
plot1 <- function() {
  
  # Read in data from file and handle the missing values, assuming the file is in the directory
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  
  # Convert the date column to Date format
  rawData$Date <- as.Date(rawData$Date,format="%d/%m/%Y")
  
  # Extract the relevant data for the required two dates
  extractData <- subset(rawData,rawData$Date>=as.Date("2007-02-01") & rawData$Date<=as.Date("2007-02-02"))
  
  # Plot the first graph and save as png format
  png(file="plot1.png", width=480, height=480) # Sepcify the graph name and the graph size
  with(extractData, hist(Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")) # Plot the historgram and specify the label and the color
  dev.off() # Close the png device
}