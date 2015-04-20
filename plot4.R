# Plot 4. El archivo "household_power_consumption.txt" debe estar en el working
#  directory junto al script

# Lee y extrae el subconjunto de datos necesarios 
datos <- read.table("household_power_consumption.txt", header = TRUE, 
                    skip = 66636, nrows = 2880, sep = ";")

# Agregar nombre a las variables
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colnames(datos) <- names

# Combina fecha y tiempo
datos$DateTime <- strptime(paste(datos$Date, datos$Time, sep=" "), 
                           format="%d/%m/%Y %H:%M:%S")

# Activa el dispositivo png
png("plot4.png", width=480, height=480)

# Grafica
par(mfrow=c(2, 2))

plot(datos$DateTime, datos$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(datos$DateTime, datos$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(datos$DateTime, datos$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(datos$DateTime, datos$Sub_metering_2, col="red")
lines(datos$DateTime, datos$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(datos$DateTime, datos$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")

# Desactiva el dispositivo
dev.off()