fluidPage(
  fluidRow(
    box(width = '100%',
      column(width = 12,
             sliderInput(inputId = "inpt_MAPQ",
                         label = "MAP Qual",
                         min = min(na.omit(DF_vcfr$MQ)),
                         max = max(na.omit(DF_vcfr$MQ)),
                         step = 1,
                         value = c(min = min(na.omit(DF_vcfr$MQ)), max = max(na.omit(DF_vcfr$MQ))))
             )
    )
  )
)