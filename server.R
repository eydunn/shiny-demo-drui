
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session) {
  observe({
    
    
    label_children <- paste0("0-",input$age[1]-1)
    label_elders <- paste0(input$age[2]+1, "+")
    label_both <- paste0(label_children, " and ", label_elders)
    
    
    r_options <- list()
    r_options[[label_children]] <- "children"
    r_options[[label_elders]] <- "elders"
    r_options[[label_both]] <- "both"
    
    # Set the choices
    updateRadioButtons(session, "depgrps", choices = r_options, selected = input$depgrps, inline = T)
    
    
    
    teljari <- switch(
      input$depgrps,
      children = label_children,
      elders = label_elders,
      both = paste0("(", label_both, ")")
    )    
    nevnari <- paste0("'",input$age[1], "-", input$age[2],"'")
    
    output$textur <- renderText({ 
      paste0("Dependency ratio to calculate: ", teljari, " / ", nevnari )
    })
  })
})
