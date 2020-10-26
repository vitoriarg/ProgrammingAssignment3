Getting and Cleaning Data

I opted to organize the scirpt as a fucntion so it would be easier to reproduce it if necessary, accoding to the informed work directory containing the "UCI HAR Dataset" folder.

The script starts off by reading all files that will be used throughout the analysis, and attibuting them to appropriatly named objects. 

It then formats the names on the "features" file to make them more readable and attributes them to their respective columns on the "test" and "train" datasets.

After that, it adds a column to both datasets distinguishing between "test" and "train" observations, and merges them into a single dataset.   

Next, it locates the columns that decribe the mean and standard deviation for each mesurement, and subsets the dataset according to this information.

It then replaces all numbers in the "activity" column with their respective descriptions, and mutates the dataset replacing the previous "activity" column with the named one.

At this point, the full dataset is completely labeled and tidy, and ready to be summarized. 

Finally, the script groups the data by activity and subject, and summarizes it with the mean for each measurement, writing a second, independent txt file. 

The function also includes a call for returning the head of each final data set (complete and summarized one), as to confirm that it has worked correctly. 
