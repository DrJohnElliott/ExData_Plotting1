#       Exploratory Data Analysis
#       Week 1 Class Project
#       John Elliott 4/15/2016

#Read data into envioroment
        tempData <- read.table("household_power_consumption.txt", sep= ";", header = TRUE,na.strings = "?" )
        myData <- rbind(subset(tempData, Date=="1/2/2007"),subset(tempData, Date=="2/2/2007"))
        
#Clean up envioroment
        rm("tempData")

# Transform Data from factor format
        myData$Global_active_power <- as.numeric(levels(myData$Global_active_power)[myData$Global_active_power])

#function to plot Data
        myPlot1 <- function(){
        
                hist(myData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        }

#Plot data
        myPlot1()
        
#Create PNG file
        png("plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
        myPlot1()
        dev.off()

