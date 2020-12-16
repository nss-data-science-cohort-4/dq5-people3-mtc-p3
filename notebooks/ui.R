

shinyUI(
    dashboardPage(
        
        # Application title
        dashboardHeader
        (title = tags$a(href='https://people3.co',
                        tags$img(src='https://people3.co/wp-content/uploads/2020/06/People3-Logo-300.png', 
                                 height='50',width='200'))
        ),
        # Sidebar with a slider input for number of bins
        dashboardSidebar(
            checkboxGroupInput('location', 
                               'Select Locations:', 
                               choices = location_choices, 
                               selected = NULL
                               ), 
            
            radioButtons('plot_choices', 
                               'Select a Category:', 
                               choices = plot_choices, 
            ),
         
            
            fileInput("file", "Upload Your Company Profile:"),
            
            actionButton('join',
                         'Join Uploaded File to Data', 
                         icon = icon("cloud-upload-alt", class = NULL,
                                     lib = "font-awesome"))
            
        ),
        
     
        dashboardBody(people3_customTheme,
                column(width = 8, 
                       box(width = NULL),
                       plotOutput('mainplot')
                       )
            
                
                      )
        
    )   
)
