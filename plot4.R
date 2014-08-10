# This piece of code is for Exploratory Data Analysis Course Project 1
# It plots the last graph
# Thank you for your kind consideration
plot4 <- function() {
  # Read in data from file and handle the missing values, assuming the file is in the directory
  rawData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  
  # Convert the date column to Date format
  rawData$Date <- as.Date(rawData$Date,format="%d/%m/%Y")
  
  # Extract the relevant data for the required two dates
  extractData <- subset(rawData,rawData$Date>=as.Date("2007-02-01") & rawData$Date<=as.Date("2007-02-02"))
  
  # # Combine the date and time data to construct the date-time data points
  dateTime <- strptime(paste(extractData$Date,extractData$Time), format="%Y-%m-%d %H:%M:%S")
  
  # Plot the last graph and save as png format
  png(file="plot4.png", width=480, height=480) # Sepcify the graph name and the graph size
  par(mfrow=c(2,2)) # Specify the layout of the sub-graphs to be 2*2
  
  # Plot the top left graph
  plot(dateTime,extractData$Global_active_power,type="l",xlab="",ylab="Global Active Power")
  
  # Plot the top right graph
  plot(dateTime,extractData$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  # Plot the bottom left graph
  plot(dateTime,extractData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(dateTime,extractData$Sub_metering_2,type="l",col="red") # Add energy sub metering No2
  lines(dateTime,extractData$Sub_metering_3,type="l",col="blue") # Add energy sub metering No3
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, bty="n",cex=0.9) # Add legend for the sub-graph
  
  # Plot the bottom right graph
  plot(dateTime,extractData$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off() # Close the png device
}