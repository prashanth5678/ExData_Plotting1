source("loadprepare.R")

doPlot1 <- function() 					#function to open and plot
{ 
    tabl <- prepareData() 
    png(filename = "plot1.png", width = 480, height = 480, units = "px") 											#Opening the png device
    hist(tabl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")	#Plooting
    dev.off() 																										#To close the device after plotting
}

doPlot1()