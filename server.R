library(shiny)
library(ggplot2)

survey <- read.csv("data/sdsurvey2.csv")

survey$size <- factor(survey$size, levels = c("Very Small","Small","Medium","Large (50 - 100)","Mega (500+)"))

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    selection <- switch(input$aes1,
                    "Do You Work Fully Remotely?" = survey$remote,
                    "Gender" = survey$gender,
                    "Is Your Support Technical?" = survey$tech,
                    "Company Size" = survey$size)
    
    selection2 <- switch(input$aes2,
                         "Do You Work Fully Remotely?" = survey$remote,
                         "Gender" = survey$gender,
                         "Is Your Support Technical?" = survey$tech,
                         "Company Size" = survey$size)
    
    # draw the histogram with the specified number of bins
    ggplot(survey, aes(x=selection2, y=paid, color=selection, fill=selection)) +
      geom_point(position=position_jitterdodge(),size=3) + 
      scale_color_brewer(palette="Set2") +
      theme_bw() +
      ylab("Annual Salary, USD") + 
      xlab(input$aes2)
    
  })
})