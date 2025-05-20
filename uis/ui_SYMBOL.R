fluidPage(
  fluidRow(
    box(width = '100%',
        column(width = 12,
               pickerInput(inputId = "inpt_SYMBOL", label = "Symbol", choices = unique(DF_vcfr$SYMBOL),
                           selected = unique(DF_vcfr$SYMBOL), multiple = TRUE, options = pickerOptions(
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
