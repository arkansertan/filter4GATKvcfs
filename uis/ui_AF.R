fluidPage(
  fluidRow(
    box(width = '100%',
      column(width = 12,
             sliderInput(inputId = "inpt_AF",
                         label = "AF",
                         min = min(na.omit(DF_vcfr$AF)),
                         max = max(na.omit(DF_vcfr$AF)),
                         step = 0.01,
                         value = c(min(na.omit(DF_vcfr$AF)), max(na.omit(DF_vcfr$AF)))
                         )
             )
      )
    )
  )