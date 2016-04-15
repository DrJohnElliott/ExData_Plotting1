# Class Project
        setwd("C:/Users/John/Desktop/R-Code/Coursera/Exploratory Data Analysis/Week 1/Class Project 1")
#read data into envioroment
        tempData <- read.table("household_power_consumption.txt", sep= ";", header = TRUE)
        myData <- rbind(subset(tempData, Date=="1/2/2007"),subset(tempData, Date=="2/2/2007"))
#cleanup envioroment
        rm("tempData")

#Transform data from factor format
        myData$Date<-strptime(as.character(myData$Date),format = "%d/%m/%Y")
        myData$Date <- weekdays.POSIXt(myData$Date)
        myData$Global_active_power <- as.numeric(levels(myData$Global_active_power)[myData$Global_active_power])

#function to plot data
        myPlot2<- function(){
                plot( myData$Global_active_power, type= "l", axes = FALSE,xlim = c(0,2880),col = "red", main = "Global Active Power", xlab = "",ylab = "Global Active Power (kilowatts)")
                xticks =c( "Thu", "Fri", "Sat")
                yticks = c(0,2,4,6)
                axis(1, at = c(0,1440,2880), labels = xticks,   tck=-.05)
                axis(2, at = yticks, labels = yticks,   tck=-.05)
                box()
        }
# plot graph
        myPlot2()

# Create PNG file of plot
        png("plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
        myPlot2()
        dev.off()

