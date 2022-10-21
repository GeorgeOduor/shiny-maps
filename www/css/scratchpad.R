# library(DBI);library(RSQLite);library(dplyr)
# 
# con = dbConnect(SQLite(),"C:/Users/George Oduor/Downloads/biodiversity-data/biodiv.db")
# 
# occurence <- tbl(con,"occurence") %>%# filter(country == 'Kenya') %>%
#   select(-taxonRank,-higherClassification,-previousIdentifications,
#          -dataGeneralizations,-continent,-recordedBy,-eventID,-samplingProtocol,
#          -associatedTaxa,-catalogNumber,-basisOfRecord,-country,-geodeticDatum,
#          -coordinateUncertaintyInMeters,-countryCode,-rightsHolder,-license,-modified,
#          -rightsHolder,-occurrenceID,-collectionCode,-stateProvince)# %>%
# # # mutate(Locality = str_replace("Poland - ","",Locality))
# # # occurence %>% head() %>% collect() %>% View()
# # # occurence %>% group_by(behavior) %>% tally()
# # # occurence %>% show_query()
# #
# multimedia <- tbl(con,"multimedia") %>%
#   select(-Identifier,-type,-format,-variantLiteral,-license)
# # # multimedia %>% head() %>% collect() %>% View()
# joined <- occurence %>%
#   inner_join(
#     multimedia ,by=c('id'='CoreId')
#   ) %>% collect()
# joined %>%
#     filter(country == "Kenya")
#   writexl::write_xlsx("C:/Users/George Oduor/Downloads/biodiversity-data/bio_div.xlsx")
# # #
# # #
