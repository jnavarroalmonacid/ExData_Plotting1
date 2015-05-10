# Plot 2. El archivo "household_power_consumption.txt" debe estar en el working
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
png("plot2.png", width=480, height=480)

# Grafica
plot(datos$DateTime, datos$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Desactiva el dispositivo png
dev.off()

