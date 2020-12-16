shinyServer(function(input, output) {
    
    output$mainplot <- renderPlot({
        req(input$location)
        censusdata %>%
            filter(location == input$location) %>%
                        filter(statistic_group == input$plot_choices) %>%
            ggplot(aes(x = pct_of_pop, y = statistic, fill = location)) + 
            geom_col(position = 'dodge') + 
            facet_wrap(~location, ncol=1) + 
            theme(legend.position = 'bottom')
    })    
    
    

    

})


#Scatter Plots ??? Education vs. gender ???


#Ensure Legend works
#Set minimum widths???
#Make sure file upload works??? integrating all of Maggi's code
#Remove/filter out total populations
#Special selections for "Age and Sex" and "Sex"
#Shorten location names

