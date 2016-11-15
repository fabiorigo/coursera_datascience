rankall <- function(outcome, num = "best") {
    if (outcome == "heart attack") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else stop("invalid outcome")
    
    dataFrameComplete <- read.csv("outcome-of-care-measures.csv")
    dataFrameFiltered <- dataFrameComplete[,c("Hospital.Name", "State", outcomeCol)]
    dataFrameFiltered[,outcomeCol] <- as.numeric(as.character(dataFrameFiltered[,outcomeCol]))
    dataFrameFiltered <- dataFrameFiltered[complete.cases(dataFrameFiltered),]
    dataFrameFiltered <- dataFrameFiltered[order(dataFrameFiltered$State, dataFrameFiltered[,outcomeCol], dataFrameFiltered$Hospital.Name),]
    
    dataFrameStates <- split(dataFrameFiltered, dataFrameFiltered$State)
    dataFrameResult <- data.frame();
    
    dataFrameStates
    
    for (s in state.abb) {
        dataFrameState <- dataFrameStates[[s]]
 
        if (num == "best") {
            dataFrameResult <- rbind(dataFrameResult, dataFrameState[1,])
        } else if (num == "worst") {
            dataFrameResult <- rbind(dataFrameResult, dataFrameState[length(dataFrameState[,outcomeCol]),])
        } else if (is.numeric(num)) {
            if (num <= length(dataFrameState[,outcomeCol])) {
                dataFrameResult <- rbind(dataFrameResult, dataFrameState[num,])    
            }
        } else stop("invalid num")
    }
    colnames(dataFrameResult) <- c("hospital", "state", outcome)
    dataFrameResult <- dataFrameResult[,c("hospital", "state")]
    dataFrameResult
}
