---
title: "Codebook"
date: "February 2015"
---

Analysis based on...

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=<p>
Human Activity Recognition Using Smartphones Dataset
Version 1.0<br>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=<p>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws<p>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=<p>

Raw files sourced from:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


Description of source files:

* features.txt         - List of all features
* activity_labels.txt  - Links the class labels with their activity name
* X_train.txt          - Training set
* y_train.txt          - Training labels
* X_test.txt           - Test set
* y_test.txt           - Test labels
* subject_train.txt    - Each row identifies the subject who performed the activity in the training set
* subject_test.txt     - Each row identifies the subject who performed the activity in the test set


Complete data set can be constructed by combining the raw source files...

```
subject_test.txt  +  y_test.txt  +  x_test.txt
       +                 +              +
subject_train.txt +  y_train.txt +  x_train.txt
```

The features.txt and activity_labels.txt are lookup lists for data values in x and y respectively.

Tidy data contains the average (mean) of all the mean/std features by subject and activity and can be found in the file:

* tidy_summary_data.txt
