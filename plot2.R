##Plot 2 

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
#Build plot as per the specifications provided
with(project_data_subset, plot(datetime, as.numeric(as.character(Global_active_power)), col="black", type="l", xlab="", ylab="Global Active Power(kilowatts)"))

## Save the output to a .png file
dev.copy(png, file = "./Project/ExData_Plotting1/plot2.png", width=480, height=480, units="px")
dev.off()