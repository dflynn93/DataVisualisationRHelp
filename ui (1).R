## Load libraries
library(shiny)
library(tidyverse)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    # TASK 1: Application title
    titlePanel("Final Project - Week 4"),
    p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demogrphic information."),
    
    # TASK 2: Add first fluidRow to select input for country
    fluidRow(
      column(width = 12, 
             wellPanel(selectInput(inputId = "country", label = "Country:", choices = c("United-States", "Canada", "Mexico", "Germany", "Philippines")))  # add select input 
      )
    ),
    
    # TASK 3: Add second fluidRow to control how to plot the continuous variables
    fluidRow(
      column(width = 3, 
             wellPanel(
               p(radioButtons(inputId = "continuous_variable", label = "Age/Hours:", choices = c("age", "hours_per_week"))),
               (radioButtons(inputId = "graph_type", label = "Hist/Box:", choices = c("histogram", "box_plot"))
              )
      ),
      column(width = 9, plotOutput('p1'),)  # add plot output
    ),
    
    # TASK 4: Add third fluidRow to control how to plot the categorical variables
    fluidRow(
      column(width = 3, 
             wellPanel(
               p(radioButtons(inputId = "categorical_variable", label = "categorical:", choices = c("education", "workclass", "sex")),
                # "Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph. "),
               (checkboxInput(inputId = "is_staked", label = "Stack Bars:", choices = c(FALSE))),    # add radio buttons for categorical variables
                   # add check box input for stacked bar chart option
             )
      ),
      column(width = 9, plotOutput('p2'))  # add plot output
    )
    ))))
shinyServer(function(input, output) {
  
})
