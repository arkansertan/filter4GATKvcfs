fluidPage(
  fluidRow(
    box(width = "100%",
        column(width=12,
               sliderInput(inputId = "inpt_QUAL", 
                           label = "Quality", 
                           min = min(na.omit(DF_vcfr$IMPACT)),
                           max = max(na.omit(DF_vcfr$IMPACT)),
                           step = 1.0,
                           value = c(min(DF_vcfr), max(DF_vcfr)))
               )
        )
    )
  )