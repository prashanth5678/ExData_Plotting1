source("loadprepare.R")

doPlot2 <- function() 			#function to open and plot the graph 
{
    tabl <- prepareData()
    png(filename = "plot2.png", width = 480, height = 480, units = "px") 													#Opening the png device
    plot(tabl$DateTime, tabl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")				#Plotting
    dev.off()																												#To close the device after plotting
}

doPlot2()