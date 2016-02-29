#Plot3.R
load("W1Data")
png(filename = "plot3.png", width = 480, height = 480)

with(data, {
  plot(tVector, seq(1,40, length.out = length(tVector)), 
       pch = "", xlab = "", ylab = "Energy sub metering", 
       ylim = c(0,45),cex = .5)
  lines(tVector, Sub_metering_1, col = "black", ylim = c(0,45))
  lines(tVector, Sub_metering_2, col = "red", ylim = c(0,45))
  lines(tVector, Sub_metering_3, col = "blue", ylim = c(0,45))
  legend("topright",legend = c("Sub_metering_1              .", "Sub_metering_2", "Sub_metering_3"), fill = c("black", "red", "blue"), lty = c(2, -1, 1), cex = .90, margin.table(margin = TRUE))
})

dev.off()