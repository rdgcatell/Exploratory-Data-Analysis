library("data.table")

pow_con_dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")


pow_con_dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pow_con_dt[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

pow_con_dt <- pow_con_dt[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))


# Plot 4
plot(pow_con_dt[, dateTime], pow_con_dt[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()