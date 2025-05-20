source("./libraries.R")
source("./functions.R")

fnn <- getFileNames(FolderPath = "./data")

DF_vcfr <- mergeVcfs(fnn = fnn)
DF_vcfr$AF <- as.numeric(DF_vcfr$AF)
DF_vcfr$QUAL <- as.numeric(DF_vcfr$QUAL)

DF_vcfr[is.na(DF_vcfr$AF),]$AF <- 99
DF_vcfr[is.na(DF_vcfr$IMPACT),]$IMPACT <- "NoInfo"
DF_vcfr[is.na(DF_vcfr$SYMBOL),]$SYMBOL <- "NotFound"