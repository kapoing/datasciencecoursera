

complete <- function(directory="specdata", id = 1:332) {
        
        ##   id nobs
        ## 1  1  117
        
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        id_column<-vector()
        nobs_column<-vector()
        for (i in 1:length(id)) {
                file_name <- paste(sprintf("%03d", id[i]),"csv",sep=".")
                data_frame<-read.csv(paste(directory,file_name, sep="/"))
                ccases<-sum(complete.cases(data_frame))
                #print(ccases)
                id_column<-c(id_column,id[i])
                nobs_column<-c(nobs_column, ccases)
        }
        returns<-data.frame(id_column,nobs_column)
        names(returns)<-c("id","nobs")
        returns
}