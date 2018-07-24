# make short monica data frame
library(tidyr)
df <- read.csv("original_study/uncapher_thieu_wagner_2016_target_memory.csv")

head(df)

df_long<- subset(df, conf == "hi" & (numDist == 0 | numDist == 6))
nrow(df_long)
names(df_long)

#save(df_long, file = "uncapher_thieu_wagner_2016_target_memory_2_conditions.RData")
write.csv(df_long, file = "uncapher_thieu_wagner_2016_target_memory_2_conditions.csv")


df_subset <- subset(df, conf == "hi" & (numDist == 0))
#save(df_subset, file= "uncapher_thieu_wager_2016_target_memory_1_condition.Rdata")
write.csv(df_subset, file = "uncapher_thieu_wagner_2016_target_memory_1_condition.csv")
