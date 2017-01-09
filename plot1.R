##Function to plot a histrogram for the Global_active_power column 
constructPlot1<-function(){
        #Load Data for the 2 days in Feb
        DT<-fread('../household_power_consumption.txt',skip="1/2/2007",
                  nrows = 2880,na.strings = "?",sep = ";", 
                  col.names=c("Date","Time","Global_active_power",
                              "Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3"))
        
        #Generating Plot 1: Histogram for Global_active_power
        png(filename = "plot1.png",width = 480, height=480)
        hist(DT$Global_active_power,col='red',main = "Global Active Power", xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
        dev.off()
}