fluidPage(
  fluidRow(
    box(width ="100%",
        column(width=12,
        sliderInput(inputId = "inpt_GC", 
                    label = "GC Content",
                    min = min(na.omit(DF_vcfr$GC)),
                    max = max(na.omit(DF_vcfr$GC)),
                    step = 10,
                    value = c(min(na.omit(DF_vcfr$GC)),max(na.omit(DF_vcfr$GC)))
                    )
        )
    )
  )
)
 

    
    
    
    
    
 