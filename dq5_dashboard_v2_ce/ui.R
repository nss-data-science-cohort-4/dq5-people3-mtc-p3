#

library(shiny)

header <- dashboardHeader(#open dashboard header
    title = tags$a(
        href = 'https://people3.co',
        tags$img(
            src = 'https://people3.co/wp-content/uploads/2020/06/People3-Logo-300.png',
            height = '50',
            width = '200'
        )
    ))#close dashboard header


sidebar <- dashboardSidebar(
    #open dashboardSidebar
    sidebarMenu(
        #open sidebarMenu
    #sidebar tabs
        menuItem('Race & Identity', tabName = 'race_identity', icon = NULL),
        menuItem('Age', tabName = 'age', icon = NULL),
        menuItem('Education', tabName = "education", icon = NULL),
        menuItem('Disability & Veteran Status', tabName = 'disability_veteran',icon=NULL),
       
        #sidebar input selectors
        #CHANGE TO 'MEMPHIS MSA','NASHVILLE MSA'
        checkboxGroupInput(
            'location',
            'Select One or More:',
            choices = location_choices,
            selected = NULL
        ),
        #commenting out radio buttons from sidebar
#        radioButtons('plot_choices',
#                     'Select a Category:',
#                     choices = plot_choices),
        
        fileInput("file", "Upload Your Company Profile:"),
        actionButton(
            'join',
            #COMPARE YOUR COMPANY DATA
            'Compare Your Data',
            icon = icon("cloud-upload-alt", class = NULL,
                        lib = "font-awesome")
        )
    )#close sidebar menu
)#close dashboard Sidebar


body <- dashboardBody(#opendashboardBody
    tabItems(
        tabItem(tabName = 'education',
                fluidRow(column(
                    width = 12,
                    tabBox(
                        width = NULL,
                        height = 700,
                        tabPanel('Overview',
                                 plotlyOutput('plot_edu')),
                        tabPanel('Male',
                                 plotlyOutput('plot_edu_m')),
                        tabPanel('Female',
                                 plotlyOutput('plot_edu_f'))
                    ),
                    
                ))) ,
        tabItem(tabName = 'age',
                fluidRow(column(
                    width = 12,
                    tabBox(
                        width = NULL,
                        height = 700,
                        tabPanel('Overview',
                                 plotlyOutput('plot_age')),
                        tabPanel('Male',
                                 plotlyOutput('plot_age_m')),
                        tabPanel('Female',
                                 plotlyOutput('plot_age_f'))
                    ),
                ))),
        tabItem(tabName = 'race_identity',
                fluidRow(column(
                    width = 12,
                    tabBox(
                        width = NULL,
                        #height = 700,
                        tabPanel('Race',
                                 plotlyOutput('plot_race'))
                        ),
                        #valueBoxOutput("hispanicBox")
                        box(
                            plotlyOutput('hispanic_plot', height=250)
                            )
                    )
                )),
        tabItem(tabName = 'disability_veteran',
                fluidRow(column(
                    width = 12,
                    tabBox(
                        width = NULL,
                        #height = 700,
                        tabPanel('Veteran Status',
                                 plotlyOutput('plot_vet'))
                    ),
                    valueBoxOutput('disabilityBox')
                    #box(
                    #    plotlyOutput('disability_plot', height=250)
                    #)
                )
                ))
        )
    )

    

shinyUI(
    dashboardPage(people3_customTheme,
                  header=header,
                  sidebar = sidebar,
                  body=body
                  )
    )
        
        