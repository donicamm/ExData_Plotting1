##Load the data, make sure the names are picked up, and strings aren't kept as factors
loadData <- function()
{
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)
  return(data)
}

##Filter by date. Defaults to the dates in the assignment.
filterByDate <- function(dataset, dateList=c("1/2/2007","2/2/2007"))
{
  if(length(dateList) > 0)
  {
    dataset <- dataset[dataset[["Date"]] %in% dateList ,]
  }

  return(dataset)
}

##Load and filter the data
DF <- filterByDate(loadData())

#Make some datetimes
dateTime <- paste(DF$Date, DF$Time)
dateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")

##plot the data
png("plot3.png", height=480, width=480, bg = "transparent") 

  ## The lines
  plot(dateTime, DF$Sub_metering_1, type = 'l', xlab = '', ylab = 'Energy sub metering')
  lines(dateTime, DF$Sub_metering_2, col='red')
  lines(dateTime, DF$Sub_metering_3, col='blue')
  
  ## The Legend
  legend('topright', lwd = 1, col = c('black', 'red', 'blue'), 
         legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))

dev.off()