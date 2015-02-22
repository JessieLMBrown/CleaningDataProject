#Code Book for Getting and Cleaning Data Course Project
#Jessica Brown

This Code Book describes the variables contained in the dataset "tidydata". The dataset contains 180 observations (six observations corresponding to activities for each of 30 subjects). Each observation has 79 variables. The first 79 columns of the dataframe correspond to these 79 variables (described below). TThe last two columns correspond to the subject number and the activity, respectively. 

The 79 variables selected for this dataset are a subset of the variables measured by the Human Activity Recognition Using Smartphones (HARUS) Data Set described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The 79 I selected pertain to mean and standard deviation measures. The run_analysis.R file contains commented sections describing the code for how the data was subsetted and how I renamed the the selected HARUS variables. Here I provide a list of my variables and explain their names:

tBodyAccmean.X                
tBodyAccmean.Y
tBodyAccmean.Z
tGravityAccmean.X
tGravityAccmean.Y
tGravityAccmean.Z
tBodyAccJerkmean.X
tBodyAccJerkmean.Y          
tBodyAccJerkmean.Z
tBodyGyromean.X
tBodyGyromean.Y
tBodyGyromean.Z   
tBodyGyroJerkmean.X
tBodyGyroJerkmean.Y
tBodyGyroJerkmean.Z
tBodyAccMagmean.      
tGravityAccMagmean.
tBodyAccJerkMagmean.
tBodyGyroMagmean.
tBodyGyroJerkMagmean.
fBodyAccmean.X
fBodyAccmean.Y
fBodyAccmean.Z
fBodyAccmeanFreq.X
fBodyAccmeanFreq.Y
fBodyAccmeanFreq.Z
fBodyAccJerkmean.X
fBodyAccJerkmean.Y          
fBodyAccJerkmean.Z
fBodyAccJerkmeanFreq.X
fBodyAccJerkmeanFreq.Y
fBodyAccJerkmeanFreq.Z      
fBodyGyromean.X
fBodyGyromean.Y
fBodyGyromean.Z
fBodyGyromeanFreq.X
fBodyGyromeanFreq.Y
fBodyGyromeanFreq.Z
fBodyAccMagmean.
fBodyAccMagmeanFreq.
fBodyBodyAccJerkMagmean.
fBodyBodyAccJerkMagmeanFreq.
fBodyBodyGyroMagmean.
fBodyBodyGyroMagmeanFreq.
fBodyBodyGyroJerkMagmean.
fBodyBodyGyroJerkMagmeanFreq.
tBodyAccstd.X
tBodyAccstd.Y                
tBodyAccstd.Z
tGravityAccstd.X
tGravityAccstd.Y
tGravityAccstd.Z            
tBodyAccJerkstd.X
tBodyAccJerkstd.Y
tBodyAccJerkstd.Z
tBodyGyrostd.X              
tBodyGyrostd.Y
tBodyGyrostd.Z
tBodyGyroJerkstd.X
tBodyGyroJerkstd.Y        
tBodyGyroJerkstd.Z
tBodyAccMagstd.
tGravityAccMagstd.
tBodyAccJerkMagstd.      
tBodyGyroMagstd.
tBodyGyroJerkMagstd.
fBodyAccstd.X
fBodyAccstd.Y               
fBodyAccstd.Z
fBodyAccJerkstd.X
fBodyAccJerkstd.Y
fBodyAccJerkstd.Z            
fBodyGyrostd.X
fBodyGyrostd.Y
fBodyGyrostd.Z
fBodyAccMagstd.              
fBodyBodyAccJerkMagstd.
fBodyBodyGyroMagstd.
fBodyBodyGyroJerkMagstd.

The following description of the variables was taken directly from the features_info.txt corresponding to the HARUS dataset. The only difference is that my variable names above do not contain dashes "-" or parentheses "()". 

Features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
