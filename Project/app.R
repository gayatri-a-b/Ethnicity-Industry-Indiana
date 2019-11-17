## Gayatri Balasubramanian
## GOV 1005 Final Project Shiny Web Application

library(shiny)
library(markdown)


## Define UI for application that draws a histogram

ui <- navbarPage("Milestone 8",
                 
                 ## About page
                 
                 tabPanel("About",
                          includeMarkdown("about.Rmd")
                 ),
                 
                 
                 ## Plot Ethnicities all of Indiana
                 
                 tabPanel("Plot",
                          includeMarkdown("map_for_shiny.Rmd")
                 )
)

# Define server logic required to draw a histogram


server <- function(input, output, session) {
    output$plot <- renderPlot({
        plot(cars, type=input$plotType)
    })
    
    output$summary <- renderPrint({
        summary(cars)
    })
    
    output$table <- DT::renderDataTable({
        DT::datatable(cars)
    })
}


# Run the application 
shinyApp(ui = ui, server = server)
