#Getting and Cleaning Data#
I opted to organize the scirpt as a fucntion so it would be easier to reproduce if necessary, accoding to the informed work directory containing the 'UCI HAR Dataset' folder

The script starts by reading all of the files that will be used through the analysis, and attibuting them to appropriate objects. 

It the formats the names on the features file to make them more readable.

After that, it labels all data sets and also adds a column distinguishing between test and train observations, should this informaiton be necessary after the merging. 

Next, it locates the columns that decribe the mean and standard deviation for each mesurement, and subsets the dataset according to this information.

It then replaces all numbers in the 'activity' column with their respective descriptions, and mutates the dataset for it to contain this edited column.

Last, it groups the data by activity and subject, and summarises it with the mean for each measurement. 

The function also includes a call for returning the head of each final data set (complete and summarised one), as to confirm that it has worked correctly