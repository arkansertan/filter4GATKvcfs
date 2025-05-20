fluidPage(
  fluidRow(
    box(width = '100%',
        column(width = 12,
               sliderInput(inputId = "inpt_GQ", label = "GQ",
                           min = min(na.omit(DF_vcfr$gt_GQ)),
                           max = max(na.omit(DF_vcfr$gt_GQ)),
                           step = 1,
                           value = c(min(na.omit(DF_vcfr$gt_GQ)), max(na.omit(DF_vcfr$gt_GQ)))))
        )
  )
)