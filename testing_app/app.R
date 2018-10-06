
# mouse position with ggplot facet --------------------------------------------------

library(shiny)
library(ggplot2)

# Define UI for application
ui <- fluidPage(
   
    # Application title
    titlePanel("Mouse position test"),
    mainPanel(
        plotOutput("car_plot", click = "car_click", hover = "car_hover"),
         
        # verbatimTextOutput("hover_info"),
         
        verbatimTextOutput("click_info")
         
    )
   
)

# Define server logic
server <- function(input, output) {
   
    output$car_plot <- renderPlot({
      
        p = ggplot(data = mtcars, aes(x=mpg, y=hp)) + 
           facet_grid(cyl ~ .) + 
           geom_point()
       
        p
       
    })
   
    output$hover_info = renderPrint({
       
        if(!is.null(input$car_hover)){
           
            input$car_hover
           
        }else{
           
           NULL
           
       }
   })
   
   output$click_info = renderPrint({
       
       if(!is.null(input$car_click)){
           
           input$car_click
           
       }else{
           
           NULL
           
       }
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

