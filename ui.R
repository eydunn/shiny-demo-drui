
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Dependency ratio (ósjálvbjargnis lutfallið) :-)"),

  # Sidebar with a slider input for workforce age range
  sidebarLayout(position='right',
    sidebarPanel(
      
      radioButtons("depgrps", "Dependency groups:",
                         c("0-15" = "children",
                           "67+" = "elders",
                           "0-15 and 67+" = "both"),
                           selected = "elders",
                           inline = T),
      sliderInput("age",
                  "Workforce age range",
                  min = 0,
                  max = 100,
                  value = c(16,66))
    ),
    

# Show the plot
    mainPanel(
      textOutput("textur1"),
      textOutput("textur2"),
      textOutput("textur3")
    )
  )
))
