####le das un kbm y una base en concreto, y la cambia a la que quieres

custom.base <-
function (x,sambas) 
{
    y <- empty.kbm(x)
    lbas <- length(x@base)
    
    y@AttributeList <- x@AttributeList[sambas]
    y@AttributeCardinalList <- x@AttributeCardinalList[sambas]
    y@base <- x@base[sambas]
    j <- sambas[1]
    if (j == 1) 
        shift <- 1
    else shift <- sum(x@AttributeCardinalList[1:(j - 1)]) + 1
    range <- (shift):(shift + x@AttributeCardinalList[j] - 1)
    y@AttributeDomainList <- x@AttributeDomainList[range]
    y@xbase <- x@xbase[range]
    for (i in 2:lbas) {
        j <- sambas[i]
        if (j == 1) 
            shift <- 1
        else shift <- sum(x@AttributeCardinalList[1:(j - 1)]) + 
            1
        range <- (shift):(shift + x@AttributeCardinalList[j] - 
            1)
        y@AttributeDomainList <- c(y@AttributeDomainList, x@AttributeDomainList[range])
        y@xbase <- c(y@xbase, x@xbase[range])
    }
    y@WeightsAttribute <- WEIGHTS(y@AttributeCardinalList)
    return(y)
}
