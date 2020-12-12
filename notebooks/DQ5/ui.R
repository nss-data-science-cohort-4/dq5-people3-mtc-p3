

shinyUI(
    dashboardPage(skin = "yellow",
        
        # Application title
        dashboardHeader(title = "Not Penguins! <CENSUS SOMETHING SOMETHING>"),
        
        # Sidebar with a slider input for number of bins
        dashboardSidebar(
            selectInput('msa', 
                        'Select an MSA:', 
                        choices = ralone_choices, 
                        selected = NULL, #NASHVILLE MSA???
                        multiple = TRUE), 
            
            #checkboxInput('age', 
            #             'Age 25 Year and Older:',
            #             choices = age_choices,
            #             ),
            
            radioButtons('sex',
                         'Male of Female:',
                         choices = sex_choices,
            ),
            
            checkboxGroupInput('racealone', 
                        'Select a Race:', 
                        choices = ralone_choices, 
                        ),
            
            radioButtons('hisp',
                         'Hispanic or Latino Identity:',
                         choices = hisp_choices,
                         ),
            
            selectInput('ed', 
                        'Select a Level of Education:', 
                        choices = ed_choices, 
                        selected = NULL), 
            
            #checkboxInput('vet', 
            #             'Veteran Status:',
            #             choices = vet_choices,
            #             ),
            
            fileInput("file", "Upload a file:"),
            
            actionButton('join',
                         'Join Uploaded File to Data', 
                         icon = icon("cloud-upload-alt", class = NULL,
                                     lib = "font-awesome"))
            
        ),
        
        # Show a plot of the generated distribution
        dashboardBody(
            fluidRow(    
                column(width = 8, 
                       box(width = NULL)
                ),
                column(width = 4, 
                       box(width = NULL)
                )
            )
        )
    )   
)
