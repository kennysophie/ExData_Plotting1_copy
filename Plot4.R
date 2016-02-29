#Plot4.R
load("W1Data")
png(filename = "plot4.png", width = 480, height = 480)

par(mfcol =c(2,2))

with(data = data, expr = hist(Global_active_power/1000, 
                              col = "red",
                              xlab = "Global Active Power (kilowatts)",
                              main = "Global Active Power"))




with(data, {
  plot(tVector, seq(1,40, length.out = length(tVector)), 
       pch = "", xlab = "", ylab = "Energy sub metering", 
       ylim = c(0,45),cex = .5)
  lines(tVector, Sub_metering_1, col = "black", ylim = c(0,45))
  lines(tVector, Sub_metering_2, col = "red", ylim = c(0,45))
  lines(tVector, Sub_metering_3, col = "blue", ylim = c(0,45))
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = .90, margin.table(margin = TRUE))
})

with(data, {
  plot(tVector,
       Voltage, pch = "",
       xlab = "datetime",
       ylab = "Voltage",ylim = c(min(Voltage)/4, max(Voltage)/4),
       yaxt = "n"
       )
  axis(2, at = seq(234,(max(Voltage))/4, length.out = 7), labels = as.character(seq(234,246,length.out= 7)))
  lines(tVector,
        Voltage/4,
        ylab = "Voltage"  )})

with(data,{
  plot(tVector,
       Global_reactive_power/500, pch ="",
       xlab = "datetime", ylab = "Global_reactive_power")
  axis(2, at = seq(0,0.5, length.out =  6), labels = c("0.0", "0.1", "0.2", "0.3", "0.4", "0.5"))
  lines(tVector,
        Global_reactive_power/500)
})

dev.off()

