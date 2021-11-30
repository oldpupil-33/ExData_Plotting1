#Reading data set
household_power_consumption <- read.csv("E:/reviewR/data-analyst/Coursers/household_power_consumption.txt", sep=";")
head(household_power_consumption,3)
#Select a subset of data that is useful
sub_data <- household_power_consumption[which(household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date=="2/2/2007" ), ]
head(sub_data,3)
#Call the basic plot functions,Construct the plot 
hist(as.numeric(sub_data$Global_active_power),col="red",
     main = "Global Active Power",xlab = "Global Active Power(kilowatts)")
#Save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png,filename="plot1.png",width=480,height=480)
dev.off()
