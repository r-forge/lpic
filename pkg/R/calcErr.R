calcErr <- function(data=data, imageID = "imageID", 
                    animalID = "animalID", weights = FALSE){
  if(class(data) != "data.frame") stop("a data frame must be specified")
  if(any(is.na(data))==TRUE) stop("there are NAs in your data")
  info <- data.frame(imageID=data[, imageID], animalID=data[, animalID])
  meas <- data[, names(data) %in% c(imageID, animalID) == FALSE]
  temp <- do.call(rbind, lapply(1:length(names(meas)), function(i){
    N <- meas[,i]
    u <- unique(info$animalID)
    temp2 <- do.call(c, lapply(1:length(u), function(b){mean(N[info$animalID == u[b]])}))
    M <- do.call(c, lapply(1:length(N), function(b){temp2[info$animalID[b] == u]}))
    gM <- weighted.mean(N, info$animalID)
    return(data.frame(meas=names(meas[i]), gMean=gM, SD=sd(M-N)))
  }))
  if(weights == FALSE){
    return(temp)
  }else{
    return(data.frame(temp, weight=min(temp$SD/temp$gMean)/(temp$SD/temp$gMean))) 
  }
}