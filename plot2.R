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
png("plot2.png", height=480, width=480, bg = "transparent") 
plot(dateTime, DF[["Global_active_power"]], type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()