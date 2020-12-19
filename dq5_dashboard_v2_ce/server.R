#




library(shiny)

shinyServer(function(input, output) {
    
    #Age tab plots
    output$plot_age <- renderPlotly({
        req(input$location)
        ggplotly(data_ageall%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(x=location,y=pct_of_pop,fill=age_group))+
                     xlab("") + ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                     geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Age by Generation")
    })
    
    output$plot_age_m <- renderPlotly({
        req(input$location)
        ggplotly(data_agemale%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(x=location,y=pct_of_pop,fill=age_group))+
                     xlab("") + ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                     geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Age by Generation")
    })
    
    
    output$plot_age_f <- renderPlotly({
        req(input$location)
        ggplotly(data_agefem%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(x=location,y=pct_of_pop,fill=age_group))+
                     xlab("") + 
                     ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                     geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Age by Generation")
    })
    
    #Education Tab Plots   
    output$plot_edu <- renderPlotly({
        req(input$location)
        ggplotly(data_edall%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(x=location,y=pct_of_pop,fill=statistic))+
                     xlab("") + ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                     geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Educational Attainment")
    })
    
    output$plot_edu_m <- renderPlotly({
        req(input$location)
        ggplotly(data_edmale%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(x=location,y=pct_of_pop,fill=statistic))+
                     xlab("") + ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                     geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Educational Attainment")
    })
    
   
    output$plot_edu_f <- renderPlotly({
        req(input$location)
        ggplotly(data_edfem%>%
            filter(location%in%input$location)%>%
            ggplot(aes(x=location,y=pct_of_pop,fill=statistic))+
            xlab("") + 
            ylab("% of Population") +
            theme(
                plot.margin = unit(c(2,1,1,1), "cm"),
                legend.title=element_blank()
                ) +
            geom_bar(position='stack',stat='identity')+
            scale_fill_manual(values=custom_colors))%>%
        layout(title="Educational Attainment" )
      })
    
 #Race tab plots  
    output$plot_race <- renderPlotly({
        req(input$location)
        ggplotly(data_racefil%>%
                     filter(location%in%input$location)%>%
                     ggplot(aes(y = pct_of_pop, x = location, fill = statistic))+
                     xlab("") + 
                     ylab("% of Population") +
                     theme(
                         plot.margin = unit(c(2,1,1,1), "cm"),
                         legend.title=element_blank()
                     ) +
                   geom_bar(position='stack',stat='identity')+
                     scale_fill_manual(values=custom_colors))%>%
            layout(title="Race")
        
    })

    
    #Hispanic Identity plot
    output$hispanic_plot <- renderPlotly({
    plot_colors<-c("#a8948a","#103447")
    data_hispfil%>%
        filter(location%in%input$location)%>%
        plot_ly(labels = ~statistic, values = ~estimate,
                marker=list(colors=plot_colors),
                textposition='') %>%
        add_pie(hole=0.5)%>%
        layout(title = "Hispanic Identity",  showlegend = T,
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    })
    
    #Race tab plots  
    output$plot_vet <- renderPlotly({
      req(input$location)
      ggplotly(data_vetfil%>%
                 filter(location%in%input$location)%>%
                 ggplot(aes(y = pct_of_pop, x = statistic, fill = location))+
                 xlab("") + 
                 ylab("% of Population") +
                 theme(
                   plot.margin = unit(c(2,1,1,1), "cm"),
                   #axis.text.y = element_text(angle = 45),
                   #legend.position="bottom",
                   legend.title=element_blank()
                 ) +
                 geom_col(position='dodge')+
                 coord_flip()+
                 scale_fill_manual(values=custom_colors))%>%
        layout(title="% Population with Veteran Status"
               #,legend=list(orientation="h",x=0.9, y=-0.2)
        )
      
    })

    #Disability Status     
    output$disabilityBox <- renderValueBox({
      data_disfil <- data_disfil%>%
        filter(location%in%input$location)
      
      dis_pct <- 100 * (sum(data_disfil$estimate)/sum(data_disfil$pop_denom))
      
      dis_pct<-round(dis_pct, digits=2)
      
            valueBox(
              dis_pct, "Percent of Population with a Disability",width=12, 
              color = "yellow"
            )
          })

    
})