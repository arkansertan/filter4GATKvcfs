fluidPage(
  fluidRow(
    column(width = 12,
           box(width = '100%',
               pickerInput(inputId = "clmns", label = "Columns", choices = colnames(DF_vcfr),
                           selected = colnames(DF_vcfr), multiple = TRUE, autocomplete = TRUE,
                           options = pickerOptions(actionsBox = TRUE,
                                                   deselectAllText = "Remove All",
                                                   selectAllText = "Select All",
                                                   liveSearch = TRUE,
                                                   multipleSeparator = " - ",
                                                   noneSelectedText = "Selected None"))
               ))
    )
  )