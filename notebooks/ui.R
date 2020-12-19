header <- dashboardHeader(title = tags$a(href='https://people3.co',
                                    tags$img(src='https://people3.co/wp-content/uploads/2020/06/People3-Logo-300.png', 
                                    height='50',
                                    width='200')))

sidebar <- dashboardSidebar(sidebarMenu(
              menuItem('Race & Identity', tabName = 'race_identity', icon = NULL),
              menuItem('Hispanic Identity', tabName ='hisp_identity', icon = NULL),
              menuItem('Age', tabName = 'age', icon = NULL),
              menuItem('Education', tabName = 'education', icon = NULL),
              checkboxGroupInput('location', 'Select One or More:', choices = location_choices, selected = NULL), 
         
              fileInput("file", "Upload Your Company Profile:"),
            
              actionButton('join', 'Join Uploaded File to Data', 
                           icon = icon("cloud-upload-alt", class = NULL,
                           lib = "font-awesome"))))
            
body <- dashboardBody(tabItems(
                      tabItem(tabName = 'race_identity', fluidRow(column(width = 12, tabBox(width = NULL, height = 700, 
                                            tabPanel('Overview', plotlyOutput('plot_age')),
                                            tabPanel('Male', plotlyOutput('plot_age_m')),
                                            tabPanel('Female', plotlyOutput('plot_age_f'))),
                                            
                      ))),
                      tabItem(tabName = 'hisp_identity', fluidRow(column(width = 12, tabBox(width = NULL, height = 700, 
                                            tabPanel('Overview', plotlyOutput('plot_hisp')),
                                            tabPanel('Male', plotlyOutput('plot_hisp_m')),
                                            tabPanel('Female', plotlyOutput('plot_hisp_f'))),
                                     
                      ))),
                      tabItem(tabName = 'age', fluidRow(column(width = 12, tabBox(width = NULL, height = 700, 
                                            tabPanel('Overview', plotlyOutput('plot_age')),
                                            tabPanel('Male', plotlyOutput('plot_age_m')),
                                            tabPanel('Female',plotlyOutput('plot_age_f'))),
                                
                      ))),
                      
                      tabItem(tabName = 'education', fluidRow(column(width = 12, tabBox(width = NULL, height = 700, 
                                            tabPanel('Overview', plotlyOutput('plot_edu')),
                                            tabPanel('Male', plotlyOutput('plot_edu_m')),
                                            tabPanel('Female', plotlyOutput('plot_edu_f'))),
                                
                      )))))
       

shinyUI(         
dashboardPage(people3_customTheme,
              header = header, 
              sidebar = sidebar, 
              body = body)
)
