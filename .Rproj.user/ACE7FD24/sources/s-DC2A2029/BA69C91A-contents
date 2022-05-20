source("functions/widgets.R")
source("functions/helpers.R")

index_UI <- function(id) {
    ns <- NS(id)
    tagList(
        fluidRow(
            panel(
                column(class="right-header",width = 9,
                       tagList(span(class="logo",img(class='logo-file',src="gbif.jpg",alt="Bio Diversity Dash")),
                               h3(class="title-text","Bio Diversity Dashboard"))
                       ),
                column(class="left-header",width = 3,
                       # column(4),
                       uiOutput(ns('controls'))
                       
                )
            )
        ) ,
        fluidRow(
            column(width = 4,class="aside-left",shinycustomloader::withLoader(data_viz_ui(ns),loader = 'loader3',type = "html")),
            column(width = 8,class="aside-right",(uiOutput(ns('key_stats'))),
                   hr(),
                   fluidRow(
                       box(width = 12,title = 'Observation Locations in Poland',status = 'success',icon = icon('map'),
                           shinycustomloader::withLoader(leafletOutput(ns("observations_map")),loader = 'loader3',type = "html")
                       )
                   )
            )
        ),
        fluidRow(
            panel(
                HTML("&copy; 2022 George: Bio diversity dashboard")
            )
        )
    )
}

index_server <- function(id){
    moduleServer( id, function(input, output, session){
        
        ns <- session$ns
        
        datasest <- reactive({
            search_crit(dataset = dataframe,name = input$name)
        })
        # reneder select control here ===
        output$controls <- renderUI({
            choices <- c(dataframe$scientificName,
                         dataframe$vernacularName) %>% unique()
            tagList(column(4,),
                    column(8,select_data(ns,choices)))
        })
        
        # render key stats here =====
        output$key_stats <- renderUI({
            tryCatch(expr = {key_stats_ui(data=datasest())},error=function(e){})
        })
        # render map here ====
        output$observations_map <- renderLeaflet({
            tryCatch(
            expr = {datafile = datasest()  
            leaflet(data = datafile ) %>%
                addProviderTiles(providers$Esri.NatGeoWorldMap) %>%
                addTiles() %>%
                addMarkers(
                    lng = ~ longitudeDecimal,
                    lat = ~ latitudeDecimal,
                    popup = ~ as.character(details),
                    label = ~ as.character(locality),
                    clusterOptions = markerClusterOptions()
                )},
                error = function(e){}
            )
            
            
        })
        # show visualizaion here ====
        output$plot_viz <- renderHighchart({top_20_plotter(df = datasest())})
        # render basic summaries here ====
        output$summaries <- renderUI({
            basic_kingdom_summary(df= datasest())
        })
        # plot timeline here =====
        output$timeline_viz <- renderHighchart({
            tryCatch(
            expr = {time_line_plot(input$name)},
            error = function(e){
                    
                }
            )
            
        })
        # render ui for single stats visualization ====
        output$analytics <- renderUI({
            tryCatch(
            expr = {
                data_viz_components(ns,input$name)
            },
                error = function(e){
                    
                }
            )
        })
    })
}
