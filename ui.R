library('shiny')
library('shinyjs')
library(shinythemes)
# Define UI for application that draws a histogram
ui = fluidPage(
  theme = shinytheme("darkly"),
  shinyjs::useShinyjs(),
  shinyjs::inlineCSS(list(.big = "font-size: 2em")),
  navbarPage("Final Project Submission", 
        tabPanel(
          "About",
          mainPanel
          ( 
            includeMarkdown("about.Rmd") 
          ) 
        ),
        tabPanel("Application",
           # Sidebar 
           sidebarLayout( 
             sidebarPanel( 
               div(id = "myapp",
                   h2("Data Product"),
                   checkboxInput("big", "Bigger text", FALSE),
                   textInput("name", "Text Input :", ""),
                   p('You can type up to 2 words in sequence with space as system will auto detect the word(s) and suggest you the best predictive next word in table format.'),
                   a(id = "toggleAdvanced", "Show/hide advanced info", href = "#"),
                   shinyjs::hidden(
                     div(id = "advanced",
                         p('- Presentation:', HTML("<a href='https://nobatgeldi.github.io/Natural-Language-Analysis/'>Coursera Data Science Capstone - Final Project Submission (Slides)</a>")),
                         p('- Author Profile:', HTML("<a href='https://github.com/Nobatgeldi'>Nobatgeldi Geldimammedov</a>")),
                         p('- GitHub:', HTML("<a href='https://github.com/Nobatgeldi/Natural-Language-Analysis'>Source Code</a>"))
                     )
                   ),
                   p("Timestamp: ",
                     span(id = "time", date()),
                     a(id = "update", "Update", href = "#")
                   ),
                   actionButton("reset", "Reset form")
               )
             ), 
             mainPanel(
               verbatimTextOutput('text1'),
               verbatimTextOutput('text2'),
               br(),
               div(id = "bestMatch", p('The best match next predictive word is :', htmlOutput('text3'))),
               hr(),
               DT::dataTableOutput('table')
             )
           )
          )
    )
)