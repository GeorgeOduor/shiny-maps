# library(leaflet)
# library(dplyr)
# library(leafgl)
# library(sf)
# # leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18))
# pop_ups <- function(ven,sci,kng,lnk,lfstage,indv,img) {
#   content <- glue::glue("<table>
#     <tr><h3><a href='{lnk}'>Details</a></h3></tr>
#     <tr>
#         <td>
#             <b>Venacular Name</b>
#         </td>
#         <td>
#             <u>{ven}</u>
#         </td>
#     </tr>
#     <tr>
#         <td>
#             <b>Scientific Name</b>
#         </td>
#         <td>
#             <i>{sci}</i>
#         </td>
#     </tr>
#     <tr>
#         <td>
#             <b>Kingdom</b>
#         </td>
#         <td>
#             {kng}
#         </td>
#     </tr>
#     <tr>
#         <td>
#             <b>Life Stage</b>
#         </td>
#         <td>
#             {lfstage}
#         </td>
#     </tr>
#     <tr>
#         <td>
#             <b>Individual Count</b>
#         </td>
#         <td>
#             {indv}
#         </td>
#     </tr>
# </table>
# <img src='{img}' width='100' height='100' class='pop-image'>
# ")
#   return(content)
# }
# data2 = readxl::read_excel("C:/Users/George Oduor/Downloads/biodiversity-data/bio_div.xlsx")%>%
#   mutate(locality = gsub("Kenya - |Kenya- |Kenya / ","",locality),
#          details = pop_ups(ven = vernacularName,sci = scientificName,
#                            kng = kingdom,lnk = references,
#                            lfstage = lifeStage,indv = individualCount,
#                            img = accessURI))
# saveRDS(data2,file = "data/data1.Rds")
# dataf = readRDS("data/data.Rds")




