# library(DBI);library(RSQLite);library(dplyr)
#
# con = dbConnect(SQLite(),"C:/Users/George Oduor/Downloads/biodiversity-data/biodiversity-data/biodivesity.sqlite")
#
# occurence <- tbl(con,"occurence") %>% filter(country == 'Poland') %>%
#   select(-taxonRank,-higherClassification,-previousIdentifications,
#          -dataGeneralizations,-continent,-recordedBy,-eventID,-samplingProtocol,
#          -associatedTaxa,-catalogNumber,-basisOfRecord,-country,-geodeticDatum,
#          -coordinateUncertaintyInMeters,-countryCode,-rightsHolder,-license,-modified,
#          -rightsHolder,-occurrenceID,-collectionCode,-stateProvince,
#          -habitat)# %>%
# # mutate(Locality = str_replace("Poland - ","",Locality))
# # occurence %>% head() %>% collect() %>% View()
# # occurence %>% group_by(behavior) %>% tally()
# # occurence %>% show_query()
#
# multimedia <- tbl(con,"multimedia") %>%
#   select(-Identifier,-type,-format,-variantLiteral,-license)
# # multimedia %>% head() %>% collect() %>% View()
# joined <- occurence %>%
#   left_join(
#     multimedia ,by=c('id'='CoreId')
#   ) %>% collect()
# joined %>%
#   writexl::write_xlsx("C:/Users/George Oduor/Downloads/biodiversity-data/biodiversity-data/bio_div.xlsx")
#
#
