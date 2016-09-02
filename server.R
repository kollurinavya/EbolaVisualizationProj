 require(googleVis)
shinyServer(
  function(input,output){

     output$Plot <- renderGvis ({
       
            type <- input$type
       if(input$Year=="2015-06-15"){month <- 'June'}
	   else if(input$Year=="2015-07-15"){month <- 'July'}
	   else if(input$Year=="2015-08-14"){month <- 'Aug'}
	   else if(input$Year=="2015-09-13"){month <- 'Sep'}
	   else if(input$Year=="2015-10-13"){month <- 'Oct'}
	   else if(input$Year=="2015-11-12"){month <- 'Nov'}
	   else{month <- 'dec'}
	 
	   
	 data <- read.csv(paste0(month,'.csv'))
        frame <- data.frame(data)
        frame <- frame[grep("All",frame$Case.def.),]
       if(type == "Total Deaths"){
                     

       	     G <- gvisGeoChart(data, locationvar="Country",colorvar ="Total.deaths",options =list(width=500,height=500,tooltip="{isHtml:'True'}", colorAxis="{colors:['purple', 'yellow']}"))
                           
       }else{

          G <- gvisGeoChart(data, locationvar="Country",colorvar ="Total.cases",options =list(width=500,height=500,tooltip="{isHtml:'True'}",colorAxis="{colors:['blue', 'orange', 'red']}"))
               #add_tooltip(G,'hover')
 }
       return(G)    
  })

    

     output$Plot2 <- renderGvis ({
       type <- input$type
	   if(input$Year=="2015-06-15"){month <- 'June'}
	   else if(input$Year=="2015-07-15"){month <- 'July'}
	   else if(input$Year=="2015-08-14"){month <- 'Aug'}
	   else if(input$Year=="2015-09-13"){month <- 'Sep'}
	   else if(input$Year=="2015-10-13"){month <- 'Oct'}
	   else if(input$Year=="2015-11-12"){month <- 'Nov'}
	   else{month <- 'dec'}
	 data <- read.csv(paste0(month,'.csv'))
        frame <- data.frame(data)
        frame <- frame[grep("All",frame$Case.def.),]
       if(type == "Total Deaths"){
                     
              V<-gvisColumnChart(frame,xvar="Country",yvar="Total.deaths",options =list(width=700,height=300,bar="{groupWidth:'90%'}"))
       	                 
       }else{

         
          V<-gvisColumnChart(frame,xvar="Country",yvar="Total.cases",options =list(width=700,height=300,bar="{groupWidth:'90%'}",colors="['yellow']"))
          
       }
       return(V)    
  })
    
   output$Plot3 <- renderPlot({
    require(wordcloud)
    data<-read.csv('Symptoms.csv')
    frame<-data.frame(data)
  v <- wordcloud(frame$Variable, frame$All.Patients, random.order=TRUE, colors=brewer.pal(6,"Dark2"),min.freq=10, scale=c(4,.2),rot.per=.15,max.words=100)
   }) 
}
 )
