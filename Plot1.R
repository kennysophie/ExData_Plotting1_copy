#plot1.R
load("W1Data")
png(filename = "plot1.png", width = 480, height = 480)

with(data = data, expr = hist(Global_active_power/1000, 
                                     col = "red",
                                     xlab = "Global Active Power (kilowatts)",
                                     main = "Global Active Power"))

dev.off()