corr <- function(directory="specdata", threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        complete<-complete(directory)
        ids_to_cor<-complete[complete[,2]>threshold,1]
        
        cor<-vector()
        if(length(ids_to_cor)==0) {
                cor<-vector()
                return(numeric())     
        }
        for (i in 1:length(ids_to_cor)) {
                file_name <- paste(sprintf("%03d", ids_to_cor[i]),"csv",sep=".")
                data_frame<-read.csv(paste(directory,file_name, sep="/"))
                #print(data_frame)
                #ccases<-sum(complete.cases(data_frame))
                data_frame<-data_frame[complete.cases(data_frame),]
                cor<-c(cor,cor(data_frame[,2],data_frame[,3]))
        }
        cor
}