dashboardPage(
  dashboardHeader(),
  dashboardSidebar(source("./uis/ui_FileName.R", local = TRUE)$value),
  dashboardBody(
    fluidRow(
      column(width = 12,
             box(width = '100%', collapsible = TRUE, title = "Filters",
                 fluidRow(
                   column(width = 3,
                          box(width = '100%', title = "Columns", solidHeader = TRUE,
                              source("./uis/ui_clmns.R", local = TRUE)$value)
                   ),
                   column(width = 3,
                          box(width = '100%', title = "Genotype", solidHeader = TRUE,
                              source("./uis/ui_GT.R", local = TRUE)$value)
                          ),
                   column(width = 3,
                          box(width = '100%', title = "Symbols", solidHeader = TRUE,
                              source("./uis/ui_SYMBOL.R", local = TRUE)$value)
                          ),
                   column(width = 3,
                           box(width= "100%", title="Impact", solidHeader = TRUE,
                               source("./uis/ui_impact.R", local =TRUE)$value)
                          ),
                 ),
                 fluidRow(
                   column(width = 2,
                          box(width = '100%', title = "GQ", solidHeader = TRUE,
                              source("./uis/ui_GQ.R", local = TRUE)$value)
                          ),
                   column(width = 2,
                          box(width = '100%', title = "DP", solidHeader = TRUE,
                              source("./uis/ui_DP_fltr.R", local = TRUE)$value)
                          ),
                   column(width = 2,
                          box(width = '100%', title = "AF", solidHeader = TRUE,
                              source("./uis/ui_AF.R", local = TRUE)$value)
                          ),
                   column(width = 2,
                          box(width="100%", title ="Quality", solidHeader = TRUE,
                              source("./uis/ui_qual.R", local =TRUE)$value)
                          ),
                   column(width = 2,
                          box(width="100%", title="GC Content", solidHeader = TRUE,
                              source("./uis/ui_GC.R", local=TRUE)$value)
                          ),
                   column(width = 2,
                          box(width = '100%', title = "MAP Qual", solidHeader = TRUE,
                              source("./uis/ui_MAPQual.R", local = TRUE)$value)
                          )
                   ),
                 ))
      ),
    fluidRow(
      column(width = 12,
             box(width = '100%', collapsible = TRUE, title = "Variants", solidHeader = TRUE,
                 dataTableOutput("DFfltrd")))
      )
    )
  )
