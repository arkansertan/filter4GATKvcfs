fluidPage(
  pickerInput(inputId = "inpt_FileName", label = "File Names", choices = unique(DF_vcfr$FileName),
              selected = unique(DF_vcfr$FileName), multiple = TRUE, options = pickerOptions(
                noneSelectedText = "Selected None",
                selectAllText = "Select All",
                deselectAllText = "Remove All",
                liveSearch = TRUE,
                actionsBox = TRUE
              ), autocomplete = TRUE)
)
