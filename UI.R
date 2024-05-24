df<-read.csv(file.choose())
df$Date <- as.Date(df$Date,format = "%d/%m/%y")
library(shiny)
library(markdown)
library(dplyr)



navbarPage("Navbar",
           navbarMenu("Home",
                      tabPanel("About",
                               headerPanel(strong("Covid-19 Cases State Level In India")),
                               fluidRow(
                                 column(6,
                                        h1("Objective Of The Project"),
                                        h3("Objective :-  Analyzing COVID-19 deaths and recoveries state-wise helps in understanding the regional variations in the spread and impact of the virus. This can provide insights into the effectiveness of containment measures, healthcare infrastructure, and regional vulnerabilities."),
                                        h3("Objective:-By examining the state-wise distribution of deaths and recoveries, policymakers can allocate resources such as medical supplies, healthcare personnel, and vaccines more effectively to regions with higher mortality rates or slower recovery rates."),
                                        h3("Objective:-Tracking COVID-19 deaths and recoveries state-wise enables the evaluation of the effectiveness of public health interventions and policies implemented at the state level. This information can inform future strategies for pandemic management and response."),
                                        h3("Objective:- Identifying states with high mortality rates or low recovery rates can help prioritize targeted interventions and public health campaigns in these areas. It allows for the implementation of preventive measures to reduce the transmission of the virus and mitigate its impact."),
                                        h3("Objective:-State-wise data on COVID-19 deaths and recoveries can guide decision-making at various levels, including local, state, and national governments. It provides evidence-based insights into the evolving situation, helping policymakers make informed decisions about public health measures, economic reopening, and travel restrictions.

"),
                                 ),
                                 column(3,
                                        #img(src='"C:/Users/vishal pandey/Desktop/png-transparent-covid-19-coronavirus-frame-thumbnail.png"',align = "bottom",
                                         #   width="500",
                                          #  height="700",
                                 
                                        #)
                                 )
                               )
                               
                      ),
                      tabPanel("Table",
                               DT::dataTableOutput("table")
                      ),
                      tabPanel("Statewise data",
                               headerPanel("Enter the Date & select a State"),
                               sidebarPanel(
                                 dateInput("dt1","Date: ",
                                           min = "2020-01-01",
                                           max = "2020-05-26"),
                                 selectInput("state", "STATE:",choices = unique(df$State.UnionTerritory)),
                               ),
                               mainPanel(
                                 h3("Confirmed Case :",textOutput("oconf"),style="color:orange"),
                                 h3("Cured Case :",textOutput("ocur"),style="color:blue"),
                                 h3("Death Case :",textOutput("odet"),style="color:red")
                               )
                               
                      )
                      
           ),
           tabPanel("EDA",
                    sidebarLayout(
                      sidebarPanel(
                        radioButtons("plotType", "Plot type",
                                     c("Barplot"="b", "Line"="l")
                        )
                      ),
                      mainPanel(
                        plotOutput("plot")
                      )
                    )
                    
           ),
           tabPanel("Predictive Analysis",
                    pageWithSidebar(
                      headerPanel("Case's Increased Estimation"),
                      sidebarPanel(
                        sliderInput('sl1','No of Days',value = 5,min=0,max=30,step=1)
                      ),
                      mainPanel(
                        plotOutput('plot1')
                      )
                      
                    )
           )
           
)
