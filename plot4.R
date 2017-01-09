##Constructing plots for 4 graphs in a frame
constructPlot4<-function(){
        #Load Data for the 2 days in Feb
        DT<-fread('../household_power_consumption.txt',skip="1/2/2007",
                  nrows = 2880,na.strings = "?",sep = ";", 
                  col.names=c("Date","Time","Global_active_power",
                              "Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3"))
        
        #Convert Date column to R Date
        DT[,RDate:=as.Date(Date,format="%d/%m/%Y")]
        
        #Convert Time columen to R Time
        DT[,RTime:=strptime(paste(DT$Date," ",DT$Time,sep=""),"%d/%m/%Y %H:%M:%S")]
        
        #Setting device parameters
        png(filename = "plot4.png",width = 480, height=480)
        par(mfcol=c(2,2))
        
        #Generating top left plot: Global_active_power against time
        with(DT,plot(Global_active_power~RTime,type="l",ylab = "Global Active Power",xlab = "",col="black"))
        
        #Generating bottom left plot: Energy Sub Metering against time
        plot(DT$Sub_metering_1~DT$RTime,type="l",ylab="Energy sub metering",col="black",xlab = "")
        points(DT$Sub_metering_2~DT$RTime,type = "l",col="red")
        points(DT$Sub_metering_3~DT$RTime,type = "l",col="blue")
        legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1),bty="n")
        
        #Generating top right plot: Voltage against time
        with(DT,plot(Voltage~RTime,type="l",ylab = "Voltage",xlab = "datetime",col="black"))
        
        #Generating bottom right plot: Global_reactive_power against time
        with(DT,plot(Global_reactive_power~RTime,type="l",ylab = "Global_reactive_power",xlab = "datetime",col="black"))
        
        #Saving PNG
        dev.off()
}