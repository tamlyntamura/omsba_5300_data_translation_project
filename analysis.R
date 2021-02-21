library(tidyverse)

id_name_link <- id_name_link %>% distinct(schname, .keep_all = TRUE)
id_name_link <- id_name_link %>% unite(key, c('unitid', 'opeid'), sep = '_')

Most_Recent_Cohorts_Scorecard_Elements_ <- Most_Recent_Cohorts_Scorecard_Elements_ %>%
  unite(key, c('UNITID', 'OPEID'), sep = '_')

college_id <- left_join(id_name_link, Most_Recent_Cohorts_Scorecard_Elements_)
college_id <- separate(college_id, schname, into = 'college', sep = '-')
college_id <- college_id[!duplicated(college_id$'college'), ]
# Separated college from cities then removed duplicate names of

