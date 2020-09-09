best=function(state,outcome){
    con=read.csv('outcome-of-care-measures.csv')
    if(outcome=='heart attack')index=names(con)[11]
    else if(outcome=='heart failure')index=names(con)[17]
    else index=names(con)[23]
    data=con[con$State==state & con[index] != 'Not Available',]
    a=which.min(as.numeric(data[,index]))
    data[a,]$Hospital.Name
}
