#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   output$distPlot <- renderPlot({
        set.seed(input$seed)
       numpoints <- input$numpoints
       xdistortion <- input$xdistortion/100*input$numpoints
       ydistortion <- input$ydistortion/100*input$numpoints
       xpoints <- seq(1,numpoints,1) + runif(numpoints, -1*xdistortion,xdistortion)
       ypoints <- seq(1,numpoints,1) + runif(numpoints, -1*ydistortion,ydistortion)
       
       model_fit <- lm(ypoints ~ xpoints)
       cf <- round(coef(model_fit), 2) 
       rsqr <- round(summary(model_fit)$r.squared,2)
       eq <- paste0("   y = ", cf[1],
                    ifelse(sign(cf[2])==1, " + ", " - "), abs(cf[2]), " x ",
                    "  R2 = ",rsqr)
       
       #Plot with Equation
       plot(xpoints,ypoints,main="Data Points and Fitted Line")
       abline(model_fit)
       if(input$showfit) {
            mtext(eq, 3, line=-2, adj=0, col=2)
        }
    
  })
  
})
