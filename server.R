# server.R

mtcars$am <- as.factor(mtcars$am); levels(mtcars$am) <- c("automatic","manual")
model <- lm(formula = mpg ~ wt + am + hp, data = mtcars)

shinyServer(
        function(input, output) {
                output$mpg <- renderUI({
                        paste("Based on the following data:", 
                              " weight = ",input$wt*1000," lb, ", 
                              " transmission type = ", input$am,
                              " and hp=", input$hp,
                              " the estimated mpg = ", 
                              round(predict(model, data.frame(wt=input$wt,
                                                        am=input$am,
                                                        hp=input$hp)),2))                        
                })
        }
)