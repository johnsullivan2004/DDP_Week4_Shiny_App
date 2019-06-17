#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("LMer Shiny App by John Sullivan"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       numericInput("numpoints","Points in Line",
                    value=100, min=10, max=1000, step=10),
       sliderInput("xdistortion",
                   "X Distortion Percentage",
                   min = 0,
                   max = 100,
                   value = 30),
       sliderInput("ydistortion",
                   "Y Distortion Percentage",
                   min = 0,
                   max = 100,
                   value = 30),
       numericInput("seed","Random Number Seed",
                    value=10000,min=1,max=99999, step=1),
       checkboxInput("showfit","Show Fit",value = TRUE),
       h4("Usage:"),
       h5("1. Select the number of points you want in the 'Number of Points' text box"),
       h5("2. Use the slides to select 'X & Y Distortion' (noise) from 0 to 100 (percent)"),
       h5("3. Change the seed in the next text box"),
       h5("4. Select the check box to turn the resulting fitted equation off/on")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h2("Results"),
       plotOutput("distPlot")
    )
  )
))
