# server.R
library(ggplot2)

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
                                                              hp=input$hp)),2)
                        )                        
                })
                
                output$plot <- renderPlot({                        
                        data <- data.frame(hp = input$hp, wt = input$wt)
                        p <- ggplot(mtcars, 
                                    aes(hp,wt))
                        p <- p + labs(x="Horsepower", y ="Weight (lb/1000)")
                        
                        p <- p + geom_point(aes(color = mpg))  + 
                                scale_colour_gradient(low = "red", high="green") 
                        p <- p + geom_point(data = data, 
                                            aes(x=hp, y=wt),
                                            size = 6,
                                            color="skyblue",
                                            pch=18)
                        print(p)
                })
        }
)