# Se leen los datos
mydata <- read.table("household_power_consumption.txt", header=TRUE, sep = ';')
#Vector con fecha y hora
dt<-paste(mydata$Date, mydata$Time)

#Conversión de fecha y hora
mydata$Date <- as.character(mydata$Date)
mydata$Time <- as.character(mydata$Time)
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y")
mydata$Time <- strptime(dt, "%d/%m/%Y %H:%M:%S")


mydata1 <-subset(mydata, Date >= "2007/02/01" &  Date <= "2007/02/02")

#Para convertirlo en numérico hay que pasar primero por character
mydata1$Global_active_power <- as.character(mydata1$Global_active_power) 
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power) 

#plot1
png("plot1.png",width = 480, height = 480, units = "px")
hist(mydata1$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),cex.lab=1,cex.axis=1)
dev.off()

