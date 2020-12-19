shinyServer(function(input, output) {
  #Age tab plots
  output$plot_age <- renderPlotly({
    req(input$location)
    ggplotly(censusdata %>%
               filter(location == input$location,
                      statistic_group == 'Sex and Age', 
                      estimate != pop_denom, 
                      age_group != 'All') %>% 
               group_by(location, statistic_group, age_group) %>%
               summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = age_group, y = pct_of_pop, fill = location))+
               xlab("") + ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title=element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors)) %>%
               layout(title = "Age by Generation")
  })
  
  output$plot_age_m <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Sex and Age', 
                      location == input$location, 
                      estimate != pop_denom, 
                      age_group != 'All', 
                      sex == 'Male') %>%
               group_by(location, statistic_group, age_group, sex) %>%
               summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = location, y = pct_of_pop, fill = age_group)) +
               xlab("") + ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title=element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Age by Generation")
  })
  
  
  output$plot_age_f <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Sex and Age', 
                      location == input$location, 
                      estimate != pop_denom, 
                      age_group != 'All', 
                      sex == 'Female') %>%
               group_by(location, statistic_group, age_group, sex) %>%
               summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = location, y = pct_of_pop, fill = age_group)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title = element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Age by Generation")
            
      
  })
  
  #Education Tab Plots   
  output$plot_edu <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Education', 
                      location == input$location, 
                      estimate != pop_denom, 
                      statistic != 'Population 25+') %>%
               group_by(location, statistic_group, statistic) %>%
               #summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = location, y = pct_of_pop, fill = statistic)) +
               xlab("") + ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"),legend.title = element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Educational Attainment")
  })
  
  output$plot_edu_m <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Education', 
                      location == input$location, 
                      estimate != pop_denom, 
                      statistic != 'Population 25+', 
                      sex == 'Male') %>%
               group_by(location, statistic_group, statistic, sex) %>%
               #summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = location, y = pct_of_pop, fill = statistic)) +
               xlab("") + ylab("% of Population") +
               theme(
                 plot.margin = unit(c(2,1,1,1), "cm"), legend.title=element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Educational Attainment")
  })
  
  
  output$plot_edu_f <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Education', 
                      location == input$location, 
                      estimate != pop_denom, 
                      statistic != 'Population 25+', 
                      sex == 'Female') %>%
               group_by(location, statistic_group, statistic, sex) %>%
               #summarise(pct_of_pop = sum(pct_of_pop)) %>%
               ggplot(aes(x = location, y = pct_of_pop, fill = statistic)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title=element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Educational Attainment"
             
      )
  })
  
  #Race tab plots  
  output$plot_race <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Race', 
                      location == input$location,
                      estimate != pop_denom) %>%
               ggplot(aes(y = pct_of_pop, x = location, fill = statistic)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title = element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Race")
    
  })
 
  #Race tab plots  
  output$plot_hisp <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Hispanic Identity', 
                      location == input$location,
                      estimate != pop_denom) %>%
               ggplot(aes(y = pct_of_pop, x = location, fill = statistic)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title = element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Hispanic Identity") 
    
  })
  
  output$plot_hisp_m <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Hispanic Identity', 
                      location == input$location,
                      estimate != pop_denom, 
                      sex == 'Male') %>%
               ggplot(aes(y = pct_of_pop, x = location, fill = statistic)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title = element_blank()) +
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Hispanic Identity") 
    
  })
  
  output$plot_hisp_f <- renderPlotly({
    req(input$location)
    ggplotly(censusdata%>%
               filter(statistic_group == 'Hispanic Identity', 
                      location == input$location,
                      estimate != pop_denom,
                      sex == 'Female') %>%
               ggplot(aes(y = pct_of_pop, x = location, fill = statistic)) +
               xlab("") + 
               ylab("% of Population") +
               theme(plot.margin = unit(c(2,1,1,1), "cm"), legend.title = element_blank())+
               geom_bar(position = 'stack', stat = 'identity') +
               scale_fill_manual(values = custom_colors))%>%
               layout(title = "Hispanic Identity")
    
  })
  
})



