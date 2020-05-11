library("data.table")

pow_con_dt <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

pow_con_dt[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

pow_con_dt[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

pow_con_dt <- pow_con_dt[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(pow_con_dt[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()