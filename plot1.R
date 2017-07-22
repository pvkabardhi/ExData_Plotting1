## Plot 1

library(dplyr)
## Read dataset from the text file specified in the path below 
project_data <- read.table("./Data/household_power_consumption.txt", header = TRUE, sep = ";")

## Filter out the data for the specified dates and store it in a new data frame
project_data_subset <- filter(project_data, as.Date(Date,"%d/%m/%Y") == "2007-02-01" | as.Date(Date,"%d/%m/%Y") =="2007-02-02")

par(mfrow = c(1,1))
## Create Histogram as per the specifications
hist(as.numeric(as.character(project_data_subset$Global_active_power)), col = "red", xlab="Global Active Power(kilowatts)", main = "Global Active Power")

## Save the output to a .png file
dev.copy(png, file = "./Project/ExData_Plotting1/plot1.png", width=480, height=480, units="px")
dev.off()



