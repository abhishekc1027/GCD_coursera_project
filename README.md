--------
#ReadMe
Getting and Cleaning Data Course Project (Coursera)

Script to clean and reshape messy dataset into a tidy dataset

AChanna

06.22.2014


##Overview
In this course project students were provided a "messy" dataset and were asked to process, reshape, and clean the data set to be "tidy." The dataset used for this project was the "Human Activity Recognition Using Smartphones Dataset." It contains data collected from the accelerometers and gyroscopes of the Samsung Galaxy S II phone worn by 30 volunteers. For more details visit the source site: 

[](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

As part of this project the following files were uploaded on github in the project repo:

1.run_analysis.R: R script that process, reshapes, and cleans dataset and writes a file in the working directory that contains the tidy dataset.

2.README.md: A markdown file with an explanation of the project, files, and the overall process.

3.codebook.md: A markdown file which describes all the variables, and naming conventions used in the tidying process. 


##Tidying the dataset
According to Hadley Wickham's "Tidy Data" paper published in the Journal of Statistical Software, tidy data has 3 components: 

1. Each variable forms a column.

2. Each observation forms a row. 

3. Each type of observational unit forms a table. 

The above are the general guidlines I adhered to for my script. 

##R script analysis
In this section I will briefly go over each section of the project, and detail how I tackled the problem in my R scrip, run_analysis.R.

###1.Merges the training and the test sets to create one data set.
After loading all the data files into R, the script combines data from the test dataset into one data frame, and the data from the train dataset into one data frame to create two complete and distinct test and train datasets. These two datasets are then merged together using the rbind() function to create one dataset. 

###2.Extracts only the measurments on the mean and standard deviation for each measurement.
Using the "features.txt" file, the script names the measured columns. The first two columns are simply the subject ID, and the activity they performed. To extract only the mean and the standard deviation column variables, the grep function is used to subset the data. Only variable names that have a "mean()" or a "std()" are extracted, since these are truly the means and standard deviations, and not other variables such as meanFreq() which denotes frequency. 

###3.Uses descriptive activity names to name the activities in the data set.
Since the activities were labeled as numeric identifiers, the script extracted the labels from the "activity_labels.txt" and assigned them to the activities in our dataset. For legibility, all the activities were converted to lower case, and the underscores were removed and replaced with a blank space. Since the labels were descriptive enough, no other changes were deemed neccessary.

###4.Appropriately labels the data set with descriptive variable names.
In this part of the script all abbreviations are expanded out, all characters are omitted, and a "." is inserted between each word. In Week 4 of the video lecture "Editing Text Variables", Prof. Leek advises to use only lower cases for variable names, and to not use any characters. I decided to go with the middle ground here since the variable names are very long, it would be hard to read without the ".". I also referred to Google's R Stype Rules guide for naming conventions:

[](https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml#identifiers)

The gsub function is used extensively to find and replace any patterns in this section. 

###5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This section uses the "reshape2" library and the functions "melt" and "dcast" to reshape the data to be tidy. The "subject.id," and "activity" variables are used as id.vars, and the rest of the variables as measure.vars. Once we have the molten dataset, we use the "dcast" function to calculate the average of each variable for each activity and each subject. 

Once the tidy dataset is ready, we slightly modify the variable names to indicate that these are now averages by adding "average.of." in the beginning of each variable. 

Finally the script writes the dataset to a text file "tidyData.txt"




