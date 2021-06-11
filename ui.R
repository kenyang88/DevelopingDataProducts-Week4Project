#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application of BMI calculator 
shinyUI(fluidPage(
    
    # Application title
    titlePanel("BMI Calculator"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            helpText("Enter your weight and height to know how fit you are!"),  
            selectInput("select_measure", label = h6("Select the measurement"), choices = list("Weight (kg) vs Height (cm)" = 1, "Weight (lb) vs. Height (inches)" = 703), selected = 1),
            numericInput("num_weight", label = h6("Enter your weight"), min = 1, value = NULL),
            numericInput("num_height", label = h6("Enter your height"), min = 1, value = NULL),
            actionButton("action_Calc", label = "CALCULATE")
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("BMI",
                         p(h5("")), textOutput("text_weight"),
                         textOutput("text_height"), p(h5("Body Mass Index(BMI):")),
                         textOutput("text_bmi")
                ),
                tabPanel("BMI Chart",
                         p(h4("BMI Calculator:")),
                         helpText("Statistical Categories of BMI as given by the National Heart, Lung, and Blood Institute (NLBI)"),
                         HTML(
                         "<br> </br>
                         <b> less than 18.5 </b> = underweight <br>
                         <br> </br>
                         <b> Between 18.5 and 24.9 </b> = Normal weight <br>
                         <br> </br>
                         <b> Between 25 and 29.9 </b> = Overweight <br>
                         <br> </br>
                         <b> greater than 30 </b> = Obsesity <br>"
                         )
                )
            )
        )
    )
))