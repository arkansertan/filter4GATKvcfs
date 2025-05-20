clmnsName <- function(readedVcf, clnms = "CSQ"){
  clnmsName <- strsplit(strsplit(readedVcf$meta[readedVcf$meta$ID == clnms,]$Description,": ")[[1]][2],"[|]")[[1]]
  return(clnmsName)
}

getCSQ <- function(dfVcfr){
  CSQList <- strsplit(dfVcfr$fix$CSQ,"[|]")
  clmnNm <- clmnsName(dfVcfr)
  emptyDF <- as.data.frame(matrix(nrow = 0, ncol = length(clmnNm)))
  for (i in 1:length(CSQList)) {
    if (length(CSQList[[i]]) < length(clmnNm)) {
      
      emptyDF <- rbind(emptyDF,c(CSQList[[i]], rep(NA, length(clmnNm)- length(CSQList[[i]]))))
      
    } else if (length(CSQList[[i]]) == length(clmnNm)) {
      emptyDF <- rbind(emptyDF,CSQList[[i]])
    }
    
    # This area using for check for the condition of the loop.
    # This area will be comment end of the testing.
    # --------------------------------------------------------
    if ((i %% 1000) == 0) {
      print(paste0(i, " - ", Sys.time()))
    }
    # --------------------------------------------------------
    
  }
  colnames(emptyDF) <- clmnNm
  return(emptyDF)
}

clearEmptyClmns <- function(DF){
  n_col <- ncol(DF)
  rmvCols <- c()
  for (i in 1:n_col) {
    nlevels <- length(levels(factor(DF[,i])))
    if (nlevels <= 1) {
      rmvCols <- append(rmvCols,i)
    }
  }
  DF[,rmvCols] <- NULL
  return(DF)
}


cizHistogram <- function(veri, yMinMax = NA, xMinMax = NA){
  # DP ve GQ kolonlari icin calisir
  
  if (all(!is.na(yMinMax & xMinMax))) {
    hist(veri, xlim = c(xMinMax[1], xMinMax[2]), ylim = c(yMinMax[1], yMinMax[2]))
  } else if (all(!is.na(yMinMax) & is.na(xMinMax))) {
    hist(veri, ylim = c(yMinMax[1], yMinMax[2]))
  } else if (all(is.na(yMinMax) & !is.na(xMinMax))) {
    hist(veri, xlim = c(xMinMax[1], xMinMax[2]))
  }else {
    hist(veri)
  }
}



ADtoDF <- function(RW) {
  rws <- c(NA, NA, NA)
  if (length(RW) == 2) {
    rws[1] <- RW[1]
    rws[2] <- RW[2]
  } else if (length(RW) == 3) {
    rws[1] <- RW[1]
    rws[2] <- RW[2]
    rws[3] <- RW[3]
  }
  return(rws)
}

getColumns <- function(DF_vcfr, clmns) {
  fltrdClmns <- DF_vcfr[,clmns]
  return(fltrdClmns)
}

getGenotype <- function(DF_vcfr, gntyp) {
  fltrdGntyp <- DF_vcfr[DF_vcfr$gt_GT %in% gntyp,]
  return(DF_vcfr)
}

getFileNames <- function(FolderPath) {
  fllnms <- dir(FolderPath, full.names = TRUE)
  nms <- dir(FolderPath)
  fnn <- cbind(fllnms, nms)
  colnames(fnn) <- c("FullNames", "Names")
  return(fnn)
}

mergeVcfs <- function(fnn) {
  baslangic <- Sys.time()
  Vcf2df <- function(fnnr) {

    print(as.character(fnnr["Names"]))
    
    readedVcf <- read.vcfR(fnnr["FullNames"])
    dfVcfr <- vcfR2tidy(readedVcf)
    CSQ <- getCSQ(dfVcfr)
    DF_vcfr <- cbind(dfVcfr$gt, dfVcfr$fix, CSQ)
    DF_vcfr$CSQ <- NULL
    DF_vcfr$FileName <- rep(fnnr["Names"], nrow(DF_vcfr))
    colnames(DF_vcfr) <- c("ChromKey","POS","Indiv","gt_AD","gt_DP","gt_GQ",
                           "gt_GT","gt_PGT","gt_PID","gt_PL","gt_GT_alleles","dbSNP_ChromKey",
                           "CHROM","dbSNP_POS","ID","REF","ALT","QUAL",
                           "FILTER","AC","AF","AN","BaseQRankSum","ClippingRankSum",
                           "DB","DP","Entropy","ExcessHet","FS","GC",
                           "InbreedingCoeff","MLEAC","MLEAF","ML_PROB","MQ","MQ0",
                           "MQRankSum","NBQ","QD","RPA","RU","ReadPosEndDist",
                           "ReadPosRankSum","SOR","STR","UDP","Allele","Consequence",
                           "IMPACT","SYMBOL","Gene","Feature_type","Feature","BIOTYPE",
                           "EXON","INTRON","HGVSc","HGVSp","cDNA_position","CDS_position",
                           "Protein_position","Amino_acids","Codons","Existing_variation","DISTANCE","STRAND",
                           "FLAGS","VARIANT_CLASS","SYMBOL_SOURCE","HGNC_ID","CANONICAL","MANE_SELECT",
                           "MANE_PLUS_CLINICAL","TSL","APPRIS","CCDS","ENSP","SWISSPROT",
                           "TREMBL","UNIPARC","UNIPROT_ISOFORM","REFSEQ_MATCH","REFSEQ_OFFSET","GENE_PHENO",
                           "SIFT","PolyPhen","DOMAINS","miRNA","HGVS_OFFSET","CSQ_AF",
                           "AFR_AF","AMR_AF","EAS_AF","EUR_AF","SAS_AF","AA_AF",
                           "EA_AF","gnomAD_AF","gnomAD_AFR_AF","gnomAD_AMR_AF","gnomAD_ASJ_AF","gnomAD_EAS_AF",
                           "gnomAD_FIN_AF","gnomAD_NFE_AF","gnomAD_OTH_AF","gnomAD_SAS_AF","MAX_AF","MAX_AF_POPS",
                           "CLIN_SIG","SOMATIC","PHENO","PUBMED","MOTIF_NAME","MOTIF_POS",
                           "HIGH_INF_POS","MOTIF_SCORE_CHANGE","TRANSCRIPTION_FACTORS","FileName")
    return(DF_vcfr)
  }
  VCFS <- apply(fnn, 1, Vcf2df)
  VCFS <- do.call(rbind.data.frame, VCFS)
  
  bitis <- Sys.time()
  show(difftime(bitis,baslangic))
  return(VCFS)
}
