README - Activity monitoring using smartphones Tidy data set
=============================================================
activityMeans.txt is a data set consisting of the mean observations of a subset of smartphone sensor data. Thirty subjects were monitored in this study performing 6 activities, laying, sitting, standing, walking, walking upstairs and walking downstairs. The data collected by the original researches was compiled into a data set  at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This data consists of replicate observations for 10 subjects and 6 activites with 565 direct and derived sensor readings. 

The r script run_analysis.r was used to generate a separate tidy data set consisting of a subset of sensor readings. The subset selected was the mean and standard deviations of the sensor readings, or all variables with a mean-() or std() designation from both the test and train data sets. Also see the comments in each part of the data set for clarification.  

How the script works
---------------------

1. Download the entire zip data archive from the web repository https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Read the data and variable names stored in a set of different data files for the two data sets provided, a test and a train data set. The variable names provided are used to label the test and train data sets appropriately, and separately provided subject IDs and activity IDs are attached to the test and train data sets. 
3. Translate The activities into meaningful named activities such as laying, sitting etc using the activity labels provided.
4. Select only the subject, activity and all variables containing the mean() and std() designation and create separate test and train data sets of this shorter variable list (subject, actiity + 66 variables).
5. Combine the test and train data sets into a single data set
6. Perform an aggregate operation to only extract the mean of the observations by activity and subject
7. Save the mean values for the 66 variables (6x30 activity x subject) into a comma separated value (Csv) file activityMeans.txt
