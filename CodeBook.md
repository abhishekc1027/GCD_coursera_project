-----------
#CodeBook for tidyData.txt
Getting and Cleaning Data Course Project (Coursera)
AChanna
06.22.2014
----------
##Original Source and Variables
The following are the details for the original source of the data:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
Dataset Location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Datset Information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original dataset contained several test and train files, which contained data outputted from the Samsung Galaxy S II worn by 30 subject volunteers. The phones were equipped with accelerometers and gyroscopes that measured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50 Hz. For more information, visit the source site mentioned above. 

The following is a brief list of the naming conventions in the original data set:

1. Prefix 't' denotes time domain
2. Prefix 'f' denotes frequency domain
3. Subset "Acc" denotes acceleration
4. Subset "Mag" denotes magnitude

Other subsetted terms are self-explanatory, such as "Gravity" would denote measurement due to gravity, etc. 

------------
##Tidy Dataset and variables
The tidy dataset produced by the "run_analysis.R" script has 180 observations and 68 variables. 

Variables names were expanded and renamed to be much more clear and descriptive than in the original dataset, as the project had asked for. For example, 't' became 'time.domain.', and 'Acc' became "acceleration," etc. Since the final tidy data set averaged all the variables by the subject ID and activity, they have been renamed to include "average.of." as the prefix. The value for the averages are based on what the accelerometers and gyroscopes produce, which are positive/negative numeric values. 

The following are all the variables and their values in the tidy dataset: 

| Column # | Variable                                                                        | Values               |
|----------|---------------------------------------------------------------------------------|----------------------|
| 1        | subject.id                                                                      | 1-30                 |
| 2        | activity                                                                        | "laying"             |
|          |                                                                                 | "sitting"            |
|          |                                                                                 | "standing"           |
|          |                                                                                 | "walking"            |
|          |                                                                                 | "walking downstairs" |
|          |                                                                                 | "walking upstairs"   |
| 3        | average.of.time.domain.body.accelaration.mean.in.x.direction                    | Numeric value        |
| 4        | average.of.time.domain.body.accelaration.mean.in.y.direction                    | Numeric value        |
| 5        | average.of.time.domain.body.accelaration.mean.in.z.direction                    | Numeric value        |
| 6        | average.of.time.domain.body.accelaration.standard.deviation.in.x.direction      | Numeric value        |
| 7        | average.of.time.domain.body.accelaration.standard.deviation.in.y.direction      | Numeric value        |
| 8        | average.of.time.domain.body.accelaration.standard.deviation.in.z.direction      | Numeric value        |
| 9        | average.of.time.domain.gravity.accelaration.mean.in.x.direction                 | Numeric value        |
| 10       | average.of.time.domain.gravity.accelaration.mean.in.y.direction                 | Numeric value        |
| 11       | average.of.time.domain.gravity.accelaration.mean.in.z.direction                 | Numeric value        |
| 12       | average.of.time.domain.gravity.accelaration.standard.deviation.in.x.direction   | Numeric value        |
| 13       | average.of.time.domain.gravity.accelaration.standard.deviation.in.y.direction   | Numeric value        |
| 14       | average.of.time.domain.gravity.accelaration.standard.deviation.in.z.direction   | Numeric value        |
| 15       | average.of.time.domain.body.accelaration.jerk.mean.in.x.direction               | Numeric value        |
| 16       | average.of.time.domain.body.accelaration.jerk.mean.in.y.direction               | Numeric value        |
| 17       | average.of.time.domain.body.accelaration.jerk.mean.in.z.direction               | Numeric value        |
| 18       | average.of.time.domain.body.accelaration.jerk.standard.deviation.in.x.direction | Numeric value        |
| 19       | average.of.time.domain.body.accelaration.jerk.standard.deviation.in.y.direction | Numeric value        |
| 20       | average.of.time.domain.body.accelaration.jerk.standard.deviation.in.z.direction | Numeric value        |
| 21       | average.of.time.domain.body.gyro.mean.in.x.direction                            | Numeric value        |
| 22       | average.of.time.domain.body.gyro.mean.in.y.direction                            | Numeric value        |
| 23       | average.of.time.domain.body.gyro.mean.in.z.direction                            | Numeric value        |
| 24       | average.of.time.domain.body.gyro.standard.deviation.in.x.direction              | Numeric value        |
| 25       | average.of.time.domain.body.gyro.standard.deviation.in.y.direction              | Numeric value        |
| 26       | average.of.time.domain.body.gyro.standard.deviation.in.z.direction              | Numeric value        |
| 27       | average.of.time.domain.body.gyro.jerk.mean.in.x.direction                       | Numeric value        |
| 28       | average.of.time.domain.body.gyro.jerk.mean.in.y.direction                       | Numeric value        |
| 29       | average.of.time.domain.body.gyro.jerk.mean.in.z.direction                       | Numeric value        |
| 30       | average.of.time.domain.body.gyro.jerk.standard.deviation.in.x.direction         | Numeric value        |
| 31       | average.of.time.domain.body.gyro.jerk.standard.deviation.in.y.direction         | Numeric value        |
| 32       | average.of.time.domain.body.gyro.jerk.standard.deviation.in.z.direction         | Numeric value        |
| 33       | average.of.time.domain.body.accelaration.magnitude.mean                         | Numeric value        |
| 34       | average.of.time.domain.body.accelaration.magnitude.standard.deviation           | Numeric value        |
| 35       | average.of.time.domain.gravity.accelaration.magnitude.mean                      | Numeric value        |
| 36       | average.of.time.domain.gravity.accelaration.magnitude.standard.deviation        | Numeric value        |
| 37       | average.of.time.domain.body.accelaration.jerk.magnitude.mean                    | Numeric value        |
| 38       | average.of.time.domain.body.accelaration.jerk.magnitude.standard.deviation      | Numeric value        |
| 39       | average.of.time.domain.body.gyro.magnitude.mean                                 | Numeric value        |
| 40       | average.of.time.domain.body.gyro.magnitude.standard.deviation                   | Numeric value        |
| 41       | average.of.time.domain.body.gyro.jerk.magnitude.mean                            | Numeric value        |
| 42       | average.of.time.domain.body.gyro.jerk.magnitude.standard.deviation              | Numeric value        |
| 43       | average.of.freq.domain.body.accelaration.mean.in.x.direction                    | Numeric value        |
| 44       | average.of.freq.domain.body.accelaration.mean.in.y.direction                    | Numeric value        |
| 45       | average.of.freq.domain.body.accelaration.mean.in.z.direction                    | Numeric value        |
| 46       | average.of.freq.domain.body.accelaration.standard.deviation.in.x.direction      | Numeric value        |
| 47       | average.of.freq.domain.body.accelaration.standard.deviation.in.y.direction      | Numeric value        |
| 48       | average.of.freq.domain.body.accelaration.standard.deviation.in.z.direction      | Numeric value        |
| 49       | average.of.freq.domain.body.accelaration.jerk.mean.in.x.direction               | Numeric value        |
| 50       | average.of.freq.domain.body.accelaration.jerk.mean.in.y.direction               | Numeric value        |
| 51       | average.of.freq.domain.body.accelaration.jerk.mean.in.z.direction               | Numeric value        |
| 52       | average.of.freq.domain.body.accelaration.jerk.standard.deviation.in.x.direction | Numeric value        |
| 53       | average.of.freq.domain.body.accelaration.jerk.standard.deviation.in.y.direction | Numeric value        |
| 54       | average.of.freq.domain.body.accelaration.jerk.standard.deviation.in.z.direction | Numeric value        |
| 55       | average.of.freq.domain.body.gyro.mean.in.x.direction                            | Numeric value        |
| 56       | average.of.freq.domain.body.gyro.mean.in.y.direction                            | Numeric value        |
| 57       | average.of.freq.domain.body.gyro.mean.in.z.direction                            | Numeric value        |
| 58       | average.of.freq.domain.body.gyro.standard.deviation.in.x.direction              | Numeric value        |
| 59       | average.of.freq.domain.body.gyro.standard.deviation.in.y.direction              | Numeric value        |
| 60       | average.of.freq.domain.body.gyro.standard.deviation.in.z.direction              | Numeric value        |
| 61       | average.of.freq.domain.body.accelaration.magnitude.mean                         | Numeric value        |
| 62       | average.of.freq.domain.body.accelaration.magnitude.standard.deviation           | Numeric value        |
| 63       | average.of.freq.domain.body.body.accelaration.jerk.magnitude.mean               | Numeric value        |
| 64       | average.of.freq.domain.body.body.accelaration.jerk.magnitude.standard.deviation | Numeric value        |
| 65       | average.of.freq.domain.body.body.gyro.magnitude.mean                            | Numeric value        |
| 66       | average.of.freq.domain.body.body.gyro.magnitude.standard.deviation              | Numeric value        |
| 67       | average.of.freq.domain.body.body.gyro.jerk.magnitude.mean                       | Numeric value        |
| 68       | average.of.freq.domain.body.body.gyro.jerk.magnitude.standard.deviation         | Numeric value        |
