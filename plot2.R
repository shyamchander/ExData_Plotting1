##Constructing plot for Global_active_power against time
constructPlot2<-function(){
        #Load Data for the 2 days in Feb
        DT<-fread('../household_power_consumption.txt',skip="1/2/2007",
                  nrows = 2880,na.strings = "?",sep = ";", 
                  col.names=c("Date","Time","Global_active_power",
                              "Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3"))
        
        #Convert Date column to R Date
        DT[,RDate:=as.Date(Date,format="%d/%m/%Y")]
        
        #Conver Time columen to R Time
        DT[,RTime:=strptime(paste(DT$Date," ",DT$Time,sep=""),"%d/%m/%Y %H:%M:%S")]
        
        #Generating Plot 2: Global_active_power against time
        png(filename = "plot2.png",width = 480, height=480)
        with(DT,plot(Global_active_power~RTime,type="l",ylab = "Global Active Power (kilowatts)",xlab = ""))
        dev.off()
}