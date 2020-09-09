rankall=function(outcome,num){
    name=c()
    st=c()
    con=read.csv('outcome-of-care-measures.csv')
    if(outcome=='heart attack')index=names(con)[11]
    else if(outcome=='heart failure')index=names(con)[17]
    else index=names(con)[23]
    data=con[con[index] != 'Not Available',]
    data=split(data,data$State)
    for(i in 1:length(data)){
        data1=data[[i]]
        data2=data1[order(data1$Hospital.Name),]
        data2=data2[order(as.numeric(data1[[index]])),]
        if(num=='best')a=which.min(as.numeric(data2[,index]))
        else if(num=='worst')a=which.max(as.numeric(data2[,index]))
        else a=num
        hos=data2[a,]$Hospital.Name
        name=c(name, hos)
        st=c(st,names(data[i]))
    }
    data.frame(hospital=name,state=st)
}
