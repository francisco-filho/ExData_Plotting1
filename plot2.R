# Code to download & unzip the file
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "epc.zip")
# unzip("epc.zip")

# Read only the header of the file
epc_header <- read.csv("household_power_consumption.txt", 
                sep=";", nrows = 1, header=F, stringsAsFactors = F)

# Read the file between lines 66638 and 69517
# this lines contains the days 1/2/2017 to 2/2/2017
epc <- read.csv("household_power_consumption.txt", 
                sep=";", 
                header=T,
                col.names = as.character(epc_header),
                skip = 66637, 
                nrows = 2879,
                na.strings = "?")
# Transform the variables
epc <- transform(epc, Date = as.Date(Date, "%d/%m/%Y"))
epc <- transform(epc, Time = strptime(paste(Date, Time), "%Y-%m-%d %H:%M:%S"))

# PLOT
png("plot2.png")
plot(epc$Time, 
     epc$Global_active_power, 
     type="l",
     main = "", 
     xlab="",
     ylab = "Global Active Power (kilowatts)")
dev.off()
