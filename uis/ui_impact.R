fluidPage(
  fluidRow(
    box(width = '100%',
        column(width = 12,
               pickerInput(inputId = "inpt_IMPACT", label = "Impact", choices = unique(DF_vcfr$IMPACT),
                           selected = unique(DF_vcfr$IMPACT), multiple = TRUE, options = pickerOptions(
                             noneSelectedText = "Selected None",
                             selectAllText = "Select All",
                             deselectAllText = "Remove All",
                             liveSearch = TRUE,
                             actionsBox = TRUE
                           ), autocomplete = TRUE)
        )
    )
  )
)
