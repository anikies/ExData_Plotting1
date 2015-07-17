# Se leen los datos
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')
#Vector con fecha y hora
dt<-paste(mydata$Date, mydata$Time)

#Conversión de fecha y hora
mydata$Date <- as.character(mydata$Date)
mydata$Time <- as.character(mydata$Time)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#plot3
# Se covierten los campos a númerico

mydata1$Sub_metering_1 <- as.character(mydata1$Sub_metering_1) 
mydata1$Sub_metering_2 <- as.character(mydata1$Sub_metering_2) 
mydata1$Sub_metering_3 <- as.character(mydata1$Sub_metering_3) 

mydata1$Sub_metering_1 <- as.numeric(mydata1$Sub_metering_1) 
mydata1$Sub_metering_2 <- as.numeric(mydata1$Sub_metering_2) 
mydata1$Sub_metering_3 <- as.numeric(mydata1$Sub_metering_3) 

#Hay que filtrar los campos sub y convertir el data frame en una matriz
mydatam <- mydata1[, c(7, 8, 9)]
mydatamatrix<- data.matrix(mydatam)
png("plot3.png",width = 480, height = 480, units = "px")
matplot(mydatamatrix, xaxt = "n", type = c("l"), col=c("black","red","blue"), ylab="Energy sub metering")
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
legend("topright", legend=colnames(mydata1[7:9]), lty=c(1,1,1), col=c("black","red","blue"), cex=0.5)
dev.off()
