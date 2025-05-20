fluidPage(
  fluidRow(
    box(width = '100%',
        column(width = 12,
               sliderInput(inputId = "inpt_DP",
                           label = "DP",
                           min = min(na.omit(DF_vcfr$gt_DP)),
                           max = max(na.omit(DF_vcfr$gt_DP)),
                           value = c(min(na.omit(DF_vcfr$gt_DP)), max(na.omit(DF_vcfr$gt_DP))),
                           step = 1
                           )
               )
        )
    )
)