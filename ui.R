library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Support Driven Compensation Survey Results"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("aes1", label = h3("Color By:"),
                   choices = list("Do You Work Fully Remotely?","Gender", "Is Your Support Technical?", "Company Size"), 
                   selected = "Gender"),
      radioButtons("aes2", label = h3("X Axis:"),
                   choices = list("Do You Work Fully Remotely?","Gender", "Is Your Support Technical?", "Company Size"), 
                   selected = "Do You Work Fully Remotely?")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot", width="100%")
    )
  )
))