# source("modules/input_interface.R")
# source("modules/keystats.R")
source("modules/index.R")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    tags$head(
        tags$link(href = "https://fonts.googleapis.com/css?family=Montserrat&display=swap",
                  rel = "stylesheet"),
        tags$link(rel = "stylesheet", type = "text/css", href = "css/custom_theme.css"),
        tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css"),
        tags$link(rel = "stylesheet", type = "text/css", href = "css/card.css")
    ),
    shinycssloaders::withSpinner(index_UI('index_view_1'))
    # input_control_UI('input_control_1'),
    # tagList(fluidRow(panel(
    #     column(
    #         class = "right-header",
    #         width = 6,
    #         h3("Bio Diversity Dashboard")
    #     ),
    #     column(
    #         class = "left-header",
    #         width = 6,
    #         column(
    #             4,
    #             selectInput(
    #                 "search_by",
    #                 "Search By:",
    #                 width = "100%",
    #                 choices = c('Vernacular Name', 'Scientific Name')
    #             )
    #         ),
    #         column(4, textInput(
    #             "name", label = "Name", width = "100%"
    #         )),
    #         column(4, airDatepickerInput(('period'), "Research Period", range = T))
    #     )
    # ))),
    # fluidRow(
    #     column(4, class = "aside-left"
    #            # data_viz_UI('data_viz_1')
    #     ),
    #     column(8, class = "aside-right", #key_stats_UI('stats_1'),
    #            hr(),
    #            fluidRow(
    #                box(
    #                    width = 12,
    #                    title = 'Animal Locations',
    #                    status = 'success',
    #                    icon = icon('map'),
    #                    leafletOutput("mymap")
    #                )
    #            ))
    # )
))