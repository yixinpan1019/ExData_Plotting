#reading data into R
elet<- read.table("/Users/mario/Learning/MOOC_John Hopkins/Exploratory Data Analysis/Prog Assign_1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
sub<- subset(elet, (elet$Date == "1/2/2007" | elet$Date== "2/2/2007")) 

# Changing the class of Date from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating Plot3:

png("plot3.png", width = 480, height = 480)
plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()
