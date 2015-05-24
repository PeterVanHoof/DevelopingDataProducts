# ui.R

shinyUI(fluidPage(
        titlePanel("Car mpg estimator"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("In the project of the 'regression models' class 
                                 we had to build a model that predicts the mpg. 
                                 This app estimates the mpg of a car based 
                                 on:",
                                 tags$li("transmission type",br(), 
                                         "('automatic' or 'manual')"),
                                 tags$li("weight (Weight in lb/1000)"),
                                 tags$li("hp (Gross horsepower)"),
                                 br(),
                                 br(),
                                 "The plot shows the actual 
                                 combinations of the weight (lb/1000) versus 
                                 the hp in the mtcars dataset. The diamond in 
                                 blue indicates the point you have chosen."),
                        
                        selectInput("am", 
                                    label = "Choose a transmission type:",
                                    choices = c("automatic", "manual"),
                                    selected = "automatic"),
                        
                        sliderInput("wt",
                                    label = "Weight (lb/1000):",
                                    min = min(mtcars$wt),
                                    max = max(mtcars$wt),
                                    value = median(mtcars$wt)),
                        
                        sliderInput("hp",
                                    label = "hp:",
                                    min = min(mtcars$hp),
                                    max = max(mtcars$hp),
                                    value = median(mtcars$hp))
                                              
                ),
                
                mainPanel(htmlOutput("mpg"),
                          plotOutput("plot"))
        )
))