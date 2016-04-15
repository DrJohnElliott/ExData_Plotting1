# Class Project
setwd("C:/Users/John/Desktop/R-Code/Coursera/Exploratory Data Analysis/Week 1/Class Project 1")
tempData <- read.table("household_power_consumption.txt", sep= ";", header = TRUE)
myData <- rbind(subset(tempData, Date=="1/2/2007"),subset(tempData, Date=="2/2/2007"))
rm("tempData")

myData$Date<-strptime(as.character(myData$Date),format = "%d/%m/%Y")
myData$Date <- weekdays.POSIXt(myData$Date)
myData$Voltage <- as.numeric(levels(myData$Voltage)[myData$Voltage])

#plot(autos_data$cars, type="l", col=plot_colors[1], 
plot( myData$Voltage, type= "l", axes = FALSE,xlim = c(0,2880),col = "black", xlab = "datetime",ylab = "Voltage")
#quantile(as.numeric(levels(myData$Global_active_power)[myData$Global_active_power]))
#strptime() and as.Date() functions.        
xticks =c( "Thu", "Fri", "Sat")
yticks = c(234,238,242,246)
axis(1, at = c(0,1440,2880), labels = xticks,   tck=-.05)
axis(2, at = yticks, labels = yticks,   tck=-.05)
box()



myData$Global_reactive_power <- as.numeric(levels(myData$Global_reactive_power)[myData$Global_reactive_power])

#plot(autos_data$cars, type="l", col=plot_colors[1], 
plot( myData$Global_reactive_power, type= "l", axes = FALSE,xlim = c(0,2880),col = "black",  xlab = "datetime",ylab = "Global_reactive_power")
#quantile(as.numeric(levels(myData$Global_active_power)[myData$Global_active_power]))
#strptime() and as.Date() functions.        
xticks =c( "Thu", "Fri", "Sat")
yticks = c(0,.1,.2,.3,.4,.5)
axis(1, at = c(0,1440,2880), labels = xticks,   tck=-.05)
axis(2, at = yticks, labels = yticks,   tck=-.05)
box()

