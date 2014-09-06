rm(list=ls())

#reading data into R
elet<- read.table("/Users/mario/Learning/MOOC_John Hopkins/Exploratory Data Analysis/Prog Assign_1/household_power_consumption.txt", sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
sub<- subset(elet, (elet$Date == "1/2/2007" | elet$Date== "2/2/2007")) 

# Changing the class of Date from character to Date: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
# Combining the Date and Time; creating a new column called "DateTime":
sub$DateTime <- as.POSIXct(paste(sub$Date, sub$Time))

# Creating Plot2:
png("plot2.png", width=480, height= 480)
plot(sub$DateTime, sub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()
