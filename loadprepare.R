dnldfile <- function(fileURL, fname) {
    if(!file.exists(fname)) {
        download.file(fileURL, destfile=fname, method="curl")
    }
    fname
}

prepareData <- function() 					#Function to unzip file, Load the data, Subset the data, combine date and time,and save the respective 
{
    cacheFile <- "plot_data.csv"			
    if(file.exists(cacheFile)) {
        tabl <- read.csv(cacheFile)
        tabl$DateTime <- strptime(tabl$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else {
        fname <- dnldfile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        con <- unz(fname, "household_power_consumption.txt")
        tabl <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        #close(con)
        tabl <- tbl[(tbl$Date == "1/2/2007") | (tabl$Date == "2/2/2007"),]
        tabl$DateTime <- strptime(paste(tabl$Date, tabl$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(tabl, cacheFile)
    }
    tabl
}