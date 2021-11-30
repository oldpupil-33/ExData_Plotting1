#Reading data set
household_power_consumption <- read.csv("E:/reviewR/data-analyst/Coursers/household_power_consumption.txt", sep=";")
head(household_power_consumption,3)
#Select a subset of data that is useful
sub_data <- household_power_consumption[which(household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007" ), ]
head(sub_data,3)
#Attribues and formattings change
datetime <- strptime(paste(sub_data$Date,sub_data$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
datetime
globActivePower <- as.numeric(sub_data$Global_active_power)
globalReactivePower <- as.numeric(sub_data$Global_reactive_power)
voltage <- as.numeric(sub_data$Voltage)
subMetering1 <- as.numeric(sub_data$Sub_metering_1)
subMetering2 <- as.numeric(sub_data$Sub_metering_2)
subMetering3 <- as.numeric(sub_data$Sub_metering_3)
#Call the basic plot functions,Construct the plot 
dev.new()
par(mfrow=c(2,2),oma=c(1,1,2,2),mar=c(4,4,1,1))
plot(datetime,globActivePower,type = "l",xlab = "",ylab = "Globe Active Power")
plot(datetime,voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime,subMetering1,type = "l",xlab = "",ylab = "Energy sub-metering")
lines(datetime,subMetering2,type = "l",col="red")
lines(datetime,subMetering3,type = "l",col="blue")
legend("topright",lty = 1,cex=0.2,col = c("black","red","blue"),
       legend = c("Sub_metering1","Sub_metering2","Sub_metering3"))
plot(datetime,globalReactivePower,type = "l",xlab = "datetime",ylab = "Globe_reactive_power")
#Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,filename="plot4.png",width=480,height=480)
dev.off()
