fluidPage(
  fluidRow(
    box(width = "100%",
        column(width=12,
               sliderInput(inputId = "inpt_QUAL", 
                           label = "Quality", 
                           min = min(na.omit(DF_vcfr$QUAL)),
                           max = max(na.omit(DF_vcfr$QUAL)),
                           step = 10,
                           value = c(min(na.omit(DF_vcfr$QUAL)), max(na.omit(DF_vcfr$QUAL))))
               )
        )
  )
  
)
