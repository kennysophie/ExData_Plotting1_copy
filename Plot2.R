#Plot2.R
load("W1Data")
png(filename = "plot2.png", width = 480, height = 480)
with(data = data, {
  plot(tVector, Global_active_power/1000, pch = "", ylab = "Global Active Power (kilowatt)", xlab = "", cex = .5)
  lines(tVector, Global_active_power/1000, col = "black")
})
dev.off()
