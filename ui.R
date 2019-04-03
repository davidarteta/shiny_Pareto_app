library(shinydashboard)
library(shiny)


dashboardPage(
  dashboardHeader(title  ="Pareto Analysis Dashboard", titleWidth = 600),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data Loading", tabName = "loadTab", icon = icon("upload")),
      menuItem("Dashboard", tabName = "dashTab",icon = icon("dashboard")),
      menuItem("Summary Stats", tabName = "summaryTab",icon = icon("bar-chart")),
      menuItem("Inspect the Data", tabName = "dataTab",icon = icon("th"))
      
    )# end of sidebarMenu
    
  ),# end of dashboardSidebar
  dashboardBody(
    tabItems(
      
      #Data loading Tab content
      tabItem(tabName = "loadTab",
              h2("Select input dataset:"),
              fileInput(
                "file1","Upload an xlsx file",accept = ".xlsx"
              ),
              p("After uploading your CSV file, click on the 'Inspect the Data' tab")
        
      ),# End of Data loading Tab
      
      # Dashboard tab content
      tabItem(tabName = "dashTab",
              h2("Pareto Analysis"),
              h6("(Note: The Pareto plot will be presented once you load a dataset in the 'Data Loading' tab)"),
              tags$hr(),
              p("Pareto analysis is a formal technique useful where many possible courses of action are competing for attention."),
              p("The barplot below may be useful to define which causes should be addressed first."),
              p("Usually a good starting point is the 80/20 Rule that states that most of the results in any situation (80% actually) are determined by a  small number of causes (20% of all the causes)"),

              fluidRow(
                
                box(width = 12, plotOutput("plot1", height = 250))#,

              )# End of fluidRow
        
      ),
      
      # Summary Stats tab content
      tabItem(tabName = "summaryTab",
              h2("Summary Statistics"),
              verbatimTextOutput("summary")
      ),
      # Data tab content
      tabItem(tabName = "dataTab",
              h2("Inspect the data"),
              p("Here is the raw data from the xlsx file"),
              tableOutput('contents')
      )
    )# End of tabItems
    
    
    
  )
)
