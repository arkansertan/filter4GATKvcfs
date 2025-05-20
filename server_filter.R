source("./functions.R", local = TRUE)

fltr_clmns_reactive <- reactive({
  getColumns(DF_vcfr = DF_vcfr, clmns = input$inpt_clmns)
})

fltr_reactive <- reactive({
  
  DF_vcfr %>%
    filter(
      gt_GT %in% input$inpt_GT,
      SYMBOL %in% input$inpt_SYMBOL,
      IMPACT %in% input$inpt_IMPACT,
      gt_GQ >= input$inpt_GQ[1],
      gt_GQ <= input$inpt_GQ[2],
      DP >= input$inpt_DP[1],
      DP <= input$inpt_DP[2],
      AF >= input$inpt_AF[1], 
      AF <= input$inpt_AF[2],
      QUAL >= input$inpt_QUAL[1],
      QUAL <= input$inpt_QUAL[2],
      GC >= input$inpt_GC[1],
      GC <= input$inpt_GC[2],
      MQ >= input$inpt_MAPQ[1],
      MQ <= input$inpt_MAPQ[2],
      FileName %in% input$inpt_FileName
    )
})

clmns_reactive <- reactive({input$clmns})