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

##plot the data
png("plot1.png", width=480, height=480, bg="transparent")
hist(as.numeric(DF$Global_active_power), breaks = 12, col = "red", main =  "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()