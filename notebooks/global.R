library(shiny)
library(shinydashboard)
library(tidycensus)
library(tidyverse)
library(plotly)
library(ggplot2)
library(stringr)
library(dashboardthemes)


censusdata <- read_csv('../data/censusdata.csv')



age_choices <- censusdata %>%
                filter(age_group != 'All') %>%
                distinct(age_group) %>%
                deframe()
location_choices <- censusdata %>% distinct(location) %>% deframe()
ralone_choices <- censusdata %>% filter(statistic_group == 'Race') %>% distinct(statistic) %>% deframe()
ed_choices <- censusdata %>% filter(statistic_group == 'Education') %>% distinct(statistic) %>% deframe()
plot_choices <- censusdata %>% distinct(statistic_group) %>% deframe()
sex_choices <- censusdata %>% filter(sex != 'All') %>% distinct(sex) %>% deframe() 
hisp_choices <- censusdata %>% filter(statistic_group == 'Hispanic Identity') %>% distinct(statistic) %>% deframe()
dis_choices <- 'Has Disability'
vet_choices <- censusdata %>% filter(statistic_group == 'Veteran Status') %>% distinct(statistic) %>% deframe()                                       
     
  
                                    
people3_customTheme <- shinyDashboardThemeDIY(
  ### general
  appFontFamily = "Arial"
  ,appFontColor = "#3C3C3C"
  ,primaryFontColor = "#3C3C3C"
  ,infoFontColor = "#2D2D2D"
  ,successFontColor = "#2D2D2D"
  ,warningFontColor = "#2D2D2D"
  ,dangerFontColor = "#2D2D2D"
  ,bodyBackColor = "#E6E6E6"
  ### header
  ,logoBackColor = "#3C3C3C"
  ,headerButtonBackColor = "#3C3C3C"
  ,headerButtonIconColor = "#DCDCDC"
  ,headerButtonBackColorHover = "#646464"
  ,headerButtonIconColorHover = "#787878"
  ,headerBackColor = "#3C3C3C"
  ,headerBoxShadowColor = ""
  ,headerBoxShadowSize = "0px 0px 0px"
  ### sidebar
  ,sidebarBackColor = "#E6E6E6"
  ,sidebarPadding = "0"
  ,sidebarMenuBackColor = "transparent"
  ,sidebarMenuPadding = "0"
  ,sidebarMenuBorderRadius = 0
  ,sidebarShadowRadius = ""
  ,sidebarShadowColor = "0px 0px 0px"
  ,sidebarUserTextColor = "#737373"
  ,sidebarSearchBackColor = "#F0F0F0"
  ,sidebarSearchIconColor = "#646464"
  ,sidebarSearchBorderColor = "#DCDCDC"
  ,sidebarTabTextColor = "#646464"
  ,sidebarTabTextSize = "14"
  ,sidebarTabBorderStyle = "none"
  ,sidebarTabBorderColor = "none"
  ,sidebarTabBorderWidth = "0"
  ,sidebarTabBackColorSelected = "#E6E6E6"
  ,sidebarTabTextColorSelected = "#000000"
  ,sidebarTabRadiusSelected = "0px"
  ,sidebarTabBackColorHover = "#F5F5F5"
  ,sidebarTabTextColorHover = "#000000"
  ,sidebarTabBorderStyleHover = "none solid none none"
  ,sidebarTabBorderColorHover = "#C8C8C8"
  ,sidebarTabBorderWidthHover = "4"
  ,sidebarTabRadiusHover = "0px"
  ### boxes
  ,boxBackColor = "#FFFFFF"
  ,boxBorderRadius = "5"
  ,boxShadowSize = "none"
  ,boxShadowColor = ""
  ,boxTitleSize = "18"
  ,boxDefaultColor = "#E1E1E1"
  ,boxPrimaryColor = "#5F9BD5"
  ,boxInfoColor = "#B4B4B4"
  ,boxSuccessColor = "#70AD47"
  ,boxWarningColor = "#ED7D31"
  ,boxDangerColor = "#E84C22"
  ,tabBoxTabColor = "#F8F8F8"
  ,tabBoxTabTextSize = "14"
  ,tabBoxTabTextColor = "#646464"
  ,tabBoxTabTextColorSelected = "#2D2D2D"
  ,tabBoxBackColor = "#F8F8F8"
  ,tabBoxHighlightColor = "#C8C8C8"
  ,tabBoxBorderRadius = "5"
  ### inputs
  ,buttonBackColor = "#E59824"
  ,buttonTextColor = "#2D2D2D"
  ,buttonBorderColor = "#969696"
  ,buttonBorderRadius = "5"
  ,buttonBackColorHover = "#E59824"
  ,buttonTextColorHover = "#2D2D2D"
  ,buttonBorderColorHover = "#969696"
  ,textboxBackColor = "#FFFFFF"
  ,textboxBorderColor = "#767676"
  ,textboxBorderRadius = "5"
  ,textboxBackColorSelect = "#F5F5F5"
  ,textboxBorderColorSelect = "#6C6C6C"
  ### tables
  ,tableBackColor = "#F8F8F8"
  ,tableBorderColor = "#EEEEEE"
  ,tableBorderTopSize = "1"
  ,tableBorderRowSize = "1"
)
