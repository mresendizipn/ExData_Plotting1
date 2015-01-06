############################################################
#            Get data from source Ethernet 
############################################################
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileNameTemp <- "exdata-data-household_power_consumption.zip"#tempfile() #get name temp
fileDownloadName <- "household_power_consumption.txt"
#download.file(URL,fileNameTemp) #download file from source
#unzip(zipfile =  fileNameTemp, files = fileDownloadName) #unzip file 

data <- read.table(fileDownloadName,header = TRUE,sep=";",colClasses = c(rep("character",8),"numeric")) #ReadFile
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"  ,c(1,2,3,4,5,6,7,8,9)]  #Filter date and columns, only necesary
data$Date <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") #Format to date
data$Global_active_power <- as.double(data$Global_active_power) #Format to double
data$Global_reactive_power <- as.double(data$Global_reactive_power )  #Format to double
data$Voltage <- as.double(data$Voltage)  #Format to double
data$Global_intensity <- as.double(data$Global_intensity)  #Format to double
data$Sub_metering_1 <- as.double(data$Sub_metering_1)  #Format to double
data$Sub_metering_2 <- as.double(data$Sub_metering_2 )  #Format to double

############################################################
#            PLOT
############################################################

png(file = "plot2.png",width = 480,height = 480, units = "px", bg = "transparent")
with(data,plot(Date,Global_active_power,type="l"))
dev.off()
