##Plot 3

library(dplyr)
## Read dataset from the text file specified in the path below 
project_data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";")

## Filter out the data for the specified dates and store it in a new data frame
project_data_subset <- filter(project_data, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") =="2007-02-02")

## Convert class of Date Variable from Factor to Date
project_data_subset$Date <- as.Date(project_data_subset$Date,"%d/%m/%Y ")
## Convert class of Time Variable from Factor to Time
project_data_subset$Time <- strptime(project_data_subset$Time, "%H:%M:%S")
## Concatenate the date and time components to form the correct string and store it in a new variable
project_data_subset$datetime <- paste(project_data_subset$Date, strftime(project_data_subset$Time, "%H:%M:%S"))
## Change the class of newly created variable from Character to Time
project_data_subset$datetime <- strptime(project_data_subset$datetime, "%Y-%m-%d %H:%M:%S")

par(mfrow = c(1,1))
## Build plot with 1st y axis as per the specifications provided
with(project_data_subset, plot(datetime, as.numeric(as.character(Sub_metering_1)), col="black", type="l", xlab="", ylab="Energy sub metering"))
## Add 2nd y axis
lines(project_data_subset$datetime, as.numeric(as.character(project_data_subset$Sub_metering_2)), col="red")
## Add 3rd y axis
lines(project_data_subset$datetime, project_data_subset$Sub_metering_3, col="blue")
## Add legend
legend("topright", lty = c(1,1,1), cex=0.8, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save the output to a .png file
dev.copy(png, file = "./Project/ExData_Plotting1/plot3.png", width=480, height=480, units="px")
dev.off()