# Bio Diversity Dashboard


Live dashboard is available 



This dashboard contains a single view page with:

1. Map of observation points 
2. Summary statistics of key information
    - total observations
    - Unique Species
    - Period between first observation to last observation
3. Species frequencies(top 20)
4. Single Observation Visualization

## Modules
 
 `index.R` file contains the logic for this view.This helps to organise the app in the event of multiple views
 
## Functions

### helpers.R

`top_20_plotter()` :- this function generates a highcharter plot for top 20 most observed species.

`data_viz_components()` :- this function renders UI with respect to user entry in the search bar.

__Use cases__
 
- shows top 20 species if no selection is made otherwise single case visualizations.

`time_line_plot()` this function generates timeline plot of the observations.

`image_carosel()` :- this function renders photos of the observations in a scroll able UI

`basic_kingdom_summary()` :- gives a summary of the top 20 observed species according to kingdoms

### Widgets.R

`event_time()` : this function generates a custom test for observation events period.

`search_crit()`: Custom search criteria for generating maps and plots

