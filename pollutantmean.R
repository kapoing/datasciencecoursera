pollutantmean <- function(directory, pollutant, id = 1:332) {

        if (pollutant=="sulfate") {
                col<-2
        } else if (pollutant=="nitrate") {
                col<-3
        } else {
                print("Error: pollutant must be either sulfate or nitrate")
                return
        }
        for (i in 1:length(id)) {
                file_name <- paste(sprintf("%03d", id[i]),"csv",sep=".")
                
                data_frame<-read.csv(paste(directory,file_name, sep="/"))
                if (i==1) {
                        all_data<-data_frame
                }
                else {
                        all_data<-df <- rbind(all_data,data_frame)
                }
        }
        
        available_data<-all_data[complete.cases(all_data[,col]),col]
        mean(available_data)
}