source("loadprepare.R") #To Load the Data

doPlot3 <- function() 					#Function to Open and Plot
{
    tabl <- prepareData()
    png(filename = "plot3.png", width = 480, height = 480, units = "px")						#Opening the png device
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")								#Column and the Attributes
    plot(tabl$DateTime, tabl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")		#Plotting 
    lines(tabl$DateTime, tabl$Sub_metering_2, type="l", col="red")								#Plotting
    lines(tabl$DateTime, tabl$Sub_metering_3, type="l", col="blue")								#Plotting
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)					#Plotting
    dev.off()																					#To Close the device after plotting
}

doPlot3()