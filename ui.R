# ui.R

shinyUI(fluidPage(
        titlePanel("Car mpg estimator"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("This app estimates the mpg of a car based 
                                 on:",
                                 tags$li("the transmission type 
                                         ('automatic' or 'manual')"),
                                 tags$li("weight (Weight in lb/1000)"),
                                 tags$li("hp (Gross horsepower)"),
                                 "of the car."),
                        
                        selectInput("am", 
                                    label = "Choose a transmission type:",
                                    choices = c("automatic", "manual"),
                                    selected = "automatic"),
                        
                        sliderInput("wt",
                                    label = "wt:",
                                    min = min(mtcars$wt),
                                    max = max(mtcars$wt),
                                    value = median(mtcars$wt)),
                        
                        sliderInput("hp",
                                    label = "hp:",
                                    min = min(mtcars$hp),
                                    max = max(mtcars$hp),
                                    value = median(mtcars$hp))
                        
                        
                        
                ),
                
                mainPanel(htmlOutput("mpg"))
        )
))