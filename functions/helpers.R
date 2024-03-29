top_20_plotter <- function(df) {
    sumry <- df %>% group_by(kingdom, family) %>%
        summarise(Count = sum(individualCount, na.rm = T)) %>%
        arrange(desc(Count)) %>%
        mutate(kingdom = ifelse(is.na(kingdom), "Undetermined", kingdom))%>%
        head(20)
    
    hc <- highchart() %>%
        hc_add_series(sumry ,
                      type = "bar",
                      hcaes(x = family, group = kingdom, y = Count)) %>%
        hc_xAxis(categories = sumry$family) %>%
        hc_colors(colors = c('red', 'blue', 'orange', 'black'))
    
    return(hc)
}

# data visualization compnents for single view ===
data_viz_components <- function(ns, name,obs_summ) {
    if (name == "") {
        # render main plot
        box(
            status = 'success',
            width = 12,
            height = "350px",
            icon = icon("chart-bar"),
            title = 'Top 20 Species Observed',
            class = 'left-box',
            tagList(uiOutput(ns(
                'summaries'
            )),hr(), fluidRow(
                highchartOutput(ns('plot_viz'))
                ))
        )
    } else{
        fluidRow(tagList(
            box(
                title = 'Observations timeline',
                status = 'success',
                width = 12,
                highchartOutput(ns('timeline_viz'), height = '200')
            ),
            box(
                title = 'Photos',
                status = 'success',
                width = 12,
                wellPanel(class="image_scroll",image_carosel(name))
            )
        ))
    }
    
}

# single visualization plot for timeline
time_line_plot <- function(name) {
    obs_summ <- dataframe %>%
        filter(vernacularName == name | scientificName == name) %>%
        group_by(eventDate = as.Date(eventDate)) %>%
        summarise(Count = n()) %>% arrange(eventDate)
    obs_summ %>%
        hchart("spline", hcaes(x = eventDate, y = Count)) %>%
        hc_colors('red') %>%
        hc_add_theme(hc_theme_darkunica())
}

# rendering carosel ===== 
image_carosel <- function(name) {
    
    # prepare data =======
    params <- dataframe %>%
        filter(vernacularName == name | scientificName == name) %>%
        select(locality, accessURI) %>%
        filter(!is.na(accessURI)) %>%
        mutate(params = glue::glue("c('{locality}','{accessURI}')")) %>%
        pull(params) %>%
        map(~ eval(parse(text = .)))
    # template to display pictures====
    if (length(params)>0) {
        tags$div(class = "image_paralax",
                 
                 params %>%
                     map( ~ tags$div(class="image_widget",
                                     p(class="captured","Observerd at: ",.[1]),
                                     tags$img(class = "image_scroll", src = .[2])
                     ))
                 
        )
    }else{
        tags$div(class="image_widget",
                 p("No image available yet")
        )
    }
    
}

# render basic kingdom summary
basic_kingdom_summary <- function(df) {
    sumry <- df %>% group_by(kingdom, family) %>%
        summarise(Count = sum(individualCount, na.rm = T)) %>%
        arrange(desc(Count)) %>%
        mutate(kingdom = ifelse(is.na(kingdom),"Undetermined", kingdom))%>%
        head(20)
    animalia = sumry %>% filter(kingdom=='Animalia') %>% nrow()
    plantae = sumry %>% filter(kingdom=='Plantae') %>% nrow()
    others = sumry %>% filter(!kingdom %in% c('Plantae','Animalia')) %>% nrow()
    fluidRow(
        column(4,class="aside-",
               tags$img(src = "animal.png",class='key-img'),
               tags$span(class='key-name',"Animalia"),
               tags$span(class='key-name',animalia)
        ),
        column(4,tags$img(src = "forest.jpg",class='key-img'),
               tags$span(class='key-name',"Plantae"),
               tags$span(class='key-name',plantae)
        ),
        column(4,tags$img(src = "others.jpg",class='key-img'),
               tags$span(class='key-name',"Others"),
               tags$span(class='key-name',others)
        )
    )
}

