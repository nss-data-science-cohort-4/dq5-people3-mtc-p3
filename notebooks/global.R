library(shiny)
library(shinydashboard)
library(tidycensus)
library(tidyverse)
library(plotly)
library(ggplot2)


company_profile <- read_csv('../../data/company_profile.csv')


age_choices <- c('Age 25 and Over')
ed_choices <- c('High School Grad', 'Some College', 'Associate Degree', 
                "Bachelor's Degree", 'Graduate Degree')
sex_choices <- c('Male', 'Female')
ralone_choices <- c('White', 'Black or African American', 
                    'American Indian or Alaska Native', 'Asian', 
                    'Hawaiin or Pacific Islander', 'Other')
vet_choices <- c('Veterans')
hisp_choices <- c('Hispanic or Latino', 'Not Hispanic or Latino')