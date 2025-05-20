fluidPage(
  fluidRow(
    box(width = '100%',
      pickerInput(inputId = "inpt_GT", label = "Genotype", choices = levels(factor(DF_vcfr$gt_GT)),
                  selected = levels(factor(DF_vcfr$gt_GT)), multiple = TRUE, autocomplete = TRUE,
                  options = pickerOptions(actionsBox = TRUE,
                                          deselectAllText = "Remove All",
                                          selectAllText = "Select All",
                                          liveSearch = TRUE,
                                          multipleSeparator = " - ",
                                          noneSelectedText = "Selected None"))
      )
    )
  )