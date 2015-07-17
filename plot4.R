# Se leen los datos
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')
#Vector con fecha y hora
dt<-paste(mydata$Date, mydata$Time)

#Conversión de fecha y hora
mydata$Date <- as.character(mydata$Date)
mydata$Time <- as.character(mydata$Time)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Se fija el número de gráficos que van a mostrarse (4)
# 4.1
png("plot4.png",width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
plot(mydata1$Global_active_power, type =  c("l"), xaxt = "n", ylab="Global Active Power (kilowatts)" ,xlab="")
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))

# 4.2
# Se convierte el voltaje a numérico
mydata1$Voltage = as.character(mydata1$Voltage)
mydata1$Voltage = as.numeric(mydata1$Voltage)
plot(mydata1$Time, mydata1$Voltage, type =  c("l"), ylab="Voltage", xlab = "datetime" )
axis(1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'))

# 4.3
mydatam <- mydata1[, c(7, 8, 9)]
mydatamatrix<- data.matrix(mydatam)
matplot(mydatamatrix, xaxt = "n", type = c("l"),col=c("black","red","blue"), ylab="Energy sub metering")
axis(1, at=c(0,1440,2880),labels=c('Thu','Fri','Sat'))
legend("topright", legend=colnames(mydata1[7:9]), lty=c(1,1,1), col=c("black","red","blue"), cex=0.5,box.lwd=0)

# 4.4
mydata1$Global_reactive_power <- as.character(mydata1$Global_reactive_power) 
mydata1$Global_reactive_power <- as.numeric(mydata1$Global_reactive_power) 
plot(mydata1$Time, mydata1$Global_reactive_power, type =  c("l"), ylab="Global_Active_Power" , xlab = "datetime" )

axis(1, at=c(0,1440,2880), labels=c('Thu','Fri','Sat'))

dev.off()