shinyServer(
  function(input, output, session){
    session$onSessionEnded(
      function(){
        stopApp()
      }
    )
    source("./server_filter.R", local = TRUE)
    
    output$DFfltrd <- DT::renderDT(
      DT::datatable(fltr_reactive()[,clmns_reactive()], options = list(
        lengthMenu = list(c(5, 10, 25, 50, 100, -1),
                          c("5", "10", "25", "50", "100", "All")),
        scrollX = TRUE,
        scrollY = TRUE,
        dom = "Blfrtip"
      ), rownames = FALSE))
  }
)