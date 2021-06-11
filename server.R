#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(htmlwidgets)

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    # Calculating the BMI
    observe({
        input$action_Calc
        if(input$select_measure==1){
            values$bmi <- isolate({
                input$num_weight / ((input$num_height/100) *(input$num_height/100))
            })
        }
        else{
            values$bmi <- isolate({
                input$num_weight / (input$num_height *input$num_height)*703
            })
        }
    })
    
    # Display the input values (weight & height) and output value (BMI)
    output$text_weight <- renderText({
        input$action_Calc
        paste("Weight: ", isolate(input$num_weight))
    })
    
    output$text_height <- renderText({
        input$action_Calc
        paste("Height: ", isolate(input$num_height))
    })
    
    output$text_bmi <- renderText({
        if(input$action_Calc == 0) ""
        else 
            paste("Your BMI is:", values$bmi)
    })
    
})
