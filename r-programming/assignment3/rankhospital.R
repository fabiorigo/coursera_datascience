rankhospital <- function(state, outcome, num = "best") {
    if (outcome == "heart attack") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } else if (outcome == "heart failure") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } else if (outcome == "pneumonia") {
        outcomeCol = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } else stop("invalid outcome")
    
    if (!(state %in% state.abb)) stop("invalid state")
    
    dataFrameComplete <- read.csv("outcome-of-care-measures.csv")
    dataFrameFiltered <- dataFrameComplete[,c("Hospital.Name", "State", outcomeCol)]
    dataFrameState <- split(dataFrameFiltered, dataFrameFiltered$State)[[state]]
    dataFrameState[,outcomeCol] <- as.numeric(as.character(dataFrameState[,outcomeCol]))
    dataFrameState <- dataFrameState[complete.cases(dataFrameState),]
    dataFrameState <- dataFrameState[order(dataFrameState[,outcomeCol], dataFrameState$Hospital.Name),]
    
    if (num == "best") {
        resultLine <- dataFrameState[1,]
    } else if (num == "worst") {
        resultLine <- dataFrameState[length(dataFrameState[,outcomeCol]),]
    } else if (is.numeric(num)) {
        if (num > length(dataFrameState[,outcomeCol])) {
            return(NA)
        }
        resultLine <- dataFrameState[num,]
    } else stop("invalid num")
    
    as.character(resultLine$Hospital.Name)
}