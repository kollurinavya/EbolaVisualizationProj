require(googleVis)
shinyServer(
     
     pageWithSidebar(
       headerPanel("Visualisation of Monthly Statistics of Ebola outbreak  "),
        sidebarPanel(sliderInput("Year", "Election year to be displayed:", 
                min=as.Date("2015-06-15"), max=as.Date("2015-12-12"), value = as.Date("2015-06-15"),step=30,
                format="%F",animate=TRUE),
              selectInput("type","Please select the type of data",choices= c("Total Deaths","Total Cases")), width=2
      ),
    
       mainPanel(
                 
                     fluidRow(

                   column(4,htmlOutput("Plot")),
                   column(4,htmlOutput("Plot2")) ,
                   column(4,htmlOutput("Plot3"))
                 
                    )
      
   
        )


)

)
