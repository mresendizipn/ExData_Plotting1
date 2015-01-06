############################################################
#            Get data from source Ethernet 
############################################################
URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileNameTemp <- "exdata-data-household_power_consumption.zip"#tempfile() #get name temp
fileDownloadName <- "household_power_consumption.txt"
#download.file(URL,fileNameTemp) #download file from source
#unzip(zipfile =  fileNameTemp, files = fileDownloadName) #unzip file 

data <- read.table(fileDownloadName,header = TRUE,sep=";",colClasses = c(rep("character",8),"numeric")) #ReadFile
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"  ,c(1,3,4,5,6,7,8,9)]  #Filter date and columns, only necesary
data$Date <- as.POSIXct(paste(data$Date), format="%d/%M/%Y") #Format to date
columnConvert <- c(c(2,3,4,5,6,7,8))
data$
