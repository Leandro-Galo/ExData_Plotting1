setwd("C:/Users/user/Desktop/CursoCoursera/DataScient/Curso4")


### Graphic 1

DataTest <- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                     na.strings = "?", nrows = 2075259, check.names = F, 
                     stringsAsFactors = F, comment.char = " ", quote ='\"')

SubData <- subset(DataTest, Date %in% c("1/2/2007","2/2/2007"))

SubData$Date <- as.Date(SubData$Date, format = "%d/%m/%Y")


hist(SubData$Global_active_power, main = "Global Active Power", col = "Red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")


dev.copy(png, file = "plot1.png")
dev.off()