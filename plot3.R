# Class Project
setwd("C:/Users/John/Desktop/R-Code/Coursera/Exploratory Data Analysis/Week 1/Class Project 1")
tempData <- read.table("household_power_consumption.txt", sep= ";", header = TRUE)
myData <- rbind(subset(tempData, Date=="1/2/2007"),subset(tempData, Date=="2/2/2007"))
rm("tempData")

myData$Date<-strptime(as.character(myData$Date),format = "%d/%m/%Y")
myData$Date <- weekdays.POSIXt(myData$Date)
myData$Sub_metering_1 <- as.numeric(levels(myData$Sub_metering_1)[myData$Sub_metering_1])
myData$Sub_metering_2 <- as.numeric(levels(myData$Sub_metering_2)[myData$Sub_metering_2])
myData$Sub_metering_3 <- as.numeric(levels(myData$Sub_metering_3)[myData$Sub_metering_3])


#plot(autos_data$cars, type="l", col=plot_colors[1], 
plot_colors <- c("black","red","blue")
plot( myData$Sub_metering_1, type= "l", axes = FALSE,col = plot_colors[1], xlab = "",ylab = "Energy sub metering")  ##xlim = c(0,max(myData$Sub_metering_1)) )#, main = "Global Active Power", xlab = "",ylab = "Global Active Power (kilowatts)")
lines(myData$Sub_metering_2, type ="l", col= plot_colors[2])
lines(myData$Sub_metering_3, type ="l", col= plot_colors[3])

#strptime() and as.Date() functions.        
xticks =c( "Thu", "Fri", "Sat")
yticks = c(0,10,20,30)
axis(1, at = c(0,1440,2880), labels = xticks,   tck=-.05)
axis(2, at = yticks, labels = yticks,   tck=-.05)
box()
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"), cex = 1, col = plot_colors,lty=1)
