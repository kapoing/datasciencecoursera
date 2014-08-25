best <- function(state=NULL, outcome=NULL) {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
        col <- switch(outcome,
                      "heart attack" = 11,
                      "heart failure" = 17,
                      "pneumonia" = 23
        )
        if (is.null(col)) {
                stop("invalid outcome")
        }
        
        if(sum(data[,7]==state) == 0) {
                stop("invalid state")
        }
        ## Return hospital name in that state with lowest 30-day death rate"
        state_data<-data[data$State==state,]
        #print(c("COL:",col))
        #min<-min(as.numeric(state_data[,col]),na.rm = TRUE)
        #print(c("MIN:",min))
        result<-state_data$Hospital.Name[state_data[,col]==min(as.numeric(state_data[,col]),na.rm = TRUE)]
        #order(result)
        result[order(result)==1]
        #x[order(best("TX", "heart failure"))==1]
        
}
