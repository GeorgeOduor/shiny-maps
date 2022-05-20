stats_card <- function(title,value,color,width = 4,image_icon_path) {
    tags$div(
        class = glue::glue("col-sm-{width}"),
        tags$div(
            class = "info-box",
            tags$span(
                class = glue::glue("info-box-icon bg-{color}"),
                tags$img(src = image_icon_path, class = 'key-img')
            ),
            tags$div(
                class = "info-box-content",
                tags$span(class = "info-box-text",
                          title),
                tags$span(class = "info-box-number",
                          value)
            )
        )
    )
}

# used to calculate the time period dynamicaly

event_time <- function(data,start_date=NULL,enddate=NULL) {
    
    if (!is.null(start_date) & !is.null(enddate)) {
        time_taken = as.numeric(enddate - start_date)
    }else{
        dates = data %>% pull(eventDate) %>% as.Date()
        time_taken =as.numeric( max(dates) - min(dates))
    }
    if (time_taken < 30) {
        period = paste(time_taken,"days")
    }else if (time_taken < 365) {
        period = paste(time_taken %/% 30,"months")
    }else{
        period = paste(time_taken %/% 365,"years")
    }
    return(period)
}

# use to define search criteria based on user input
search_crit <- function(dataset,name="") {
    
    if ( name != "") {
        dataframe = dataset %>% 
            filter(vernacularName == name | scientificName == name)
    }else{
        dataframe = dataset
    }

        
    return(dataframe)
}
# search_crit(dataset = dataf,"vernacularName",name = "Sand Sedge")

# render input parts
dash_input_ui <- function(ns) {
    tagList(
        tagList(
            fluidRow(
                panel(
                    column(class="right-header",width = 8,h3("Bio Diversity Dashboard")),
                    column(class="left-header",width = 4,
                           column(4,selectInput(ns("search_by"),"Search By:",width = "100%",
                                                choices = c('Vernacular Name','Scientific Name'))),
                           column(4,textInput(ns("name"),label = "Name",width = "100%")),
                           column(4)
                    )
                )
            )
        )
    )
}

# data visualization UI
data_viz_ui <- function(ns) {
    tagList(uiOutput(ns('analytics')))
}
# 
# key statistics ui
key_stats_ui <- function(data) {
    total_obs = nrow(data) %>% format(big.mark=",")
    uniquespec = data %>% distinct(family) %>% nrow() %>% format(big.mark=",")
    eventtime = event_time(data = data)
    tagList(
        fluidRow(
            stats_card(title = "Total Observations",value = total_obs,color = "lime",width = 4,image_icon_path = "camera.jpg"),
            stats_card(title = "Unique Species",value = uniquespec,color = "lime",width = 4,image_icon_path = "species.jpg"),
            stats_card(title = "Event Period",value = eventtime,color = "lime",width = 4,image_icon_path = "timeline.jpg")
        )
    )
}

# selectize statement =====
select_data <- function(ns,choices) {
    selectizeInput(
        inputId = ns("name"),
        label = "Search...",
        multiple = FALSE,
        choices = c("Search Bar" = "", choices),
        options = list(
            create = FALSE,
            placeholder = "Vernacular/Scientific Name",
            maxItems = '1',
            onDropdownOpen = I(
                "function($dropdown) {if (!this.lastQuery.length) {this.close(); this.settings.openOnFocus = false;}}"
            ),
            onType = I("function (str) {if (str === \"\") {this.close();}}")
        )
    )
}


