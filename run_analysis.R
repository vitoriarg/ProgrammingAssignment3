run_analysis <- function(directory = "Diretório R") {
  
  library(dplyr)
  
  #reads files from 'UCI HAR Dataset' folder according to the informed directory
  
  data_test <- read.table(file = paste0("./", directory, "/UCI HAR Dataset/test/X_test.txt"))
  data_train <- read.table(file = paste0("./", directory, "/UCI HAR Dataset/train/X_train.txt"))
  activities_test <-read.table(file = paste0("./", directory, "/UCI HAR Dataset/test/y_test.txt"))
  activities_train <-read.table(file = paste0("./", directory, "/UCI HAR Dataset/train/y_train.txt"))
  subjects_test <-read.table(file = paste0("./", directory, "/UCI HAR Dataset/test/subject_test.txt"))
  subjects_train <-read.table(file = paste0("./", directory, "/UCI HAR Dataset/train/subject_train.txt"))
  feature_names <- read.table(paste0("./",directory,"/UCI HAR Dataset/features.txt"))
  
  #formats feature names to make them more readable
  
  feature_names <- feature_names$V2 
  feature_names <- gsub("\\()","",feature_names)
  feature_names <- gsub("\\-","\\_",feature_names)
  feature_names <- tolower(feature_names)
  
  #labels all data sets and adds column distinguishing between test and train observations
  
  names(data_test) <- feature_names
  names(data_train) <- feature_names
  names(activities_test) <- "activity"
  names(activities_train) <- "activity"
  names(subjects_test) <- "subject"
  names(subjects_train) <- "subject"
  folder_test <- c("test")
  folder_train <- c("train")
  data_test <- cbind(data.frame(folder = folder_test), subjects_test, activities_test, data_test)
  data_train <- cbind(data.frame(folder = folder_train), subjects_train, activities_train, data_train)
  
  #merges data sets and selects appropriate columns
  
  data_merged <- rbind(data_test, data_train)
  select_mean1 <- grep("mean$", names(data_merged))
  select_mean2 <- grep("mean_", names(data_merged))
  select_std1 <- grep("std$", names(data_merged))
  select_std2 <- grep("std_", names(data_merged))
  select_columns <- c(1,2,3, select_mean1, select_mean2, select_std1, select_std2)
  data_selected <- subset(data_merged, select = select_columns)

  #adds descriptive names to the activity column
  description_1 <- sub("1", "walking", data_selected$activity)
  description_2 <- sub("2", "walking_upstairs", description_1)
  description_3 <- sub("3", "walking_downstairs", description_2)
  description_4 <- sub("4", "sitting", description_3)
  description_5 <- sub("5", "standing", description_4)
  activities_described <- sub("6", "laying", description_5)
  data_final <- mutate(data_selected, activity = activities_described)
  
  #create second data set
  data_second <- data_final[-1] %>% group_by(activity, subject) %>% summarise_each(funs= mean)
  write.table(data_second, "./summarised_data.txt", row.names = FALSE)
  
  #return data sets
  head(data_final)
  head(data_second)
  }
