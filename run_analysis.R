run_analysis<-function (){
  library("dplyr")
  library("reshape2")
  ## 1.prepare the dir
  if(!file.exists("rowdata")){  
    dir.create("rowdata")
  }
  fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  ## 2.downlaod the file and unzip the file
  download.file(fileurl,"./rowdata/rowdata.zip",method="curl")
  unzip("./rowdata/rowdata.zip",exdir="./rowdata")
  ## 3.prepare mean and std col names and serial numbers
  featurenames<-read.table("./rowdata/UCI HAR Dataset/features.txt")
  activity_names<-read.table("./rowdata/UCI HAR Dataset/activity_labels.txt")
  targetcolnames<-featurenames[grepl("\\-mean\\(\\)",featurenames$V2),]
  targetcolnames<-rbind(targetcolnames,
                  featurenames[grepl("\\-std\\(\\)",featurenames$V2),])
  targetcolnames<-targetcolnames[order(targetcolnames$V1),]
  ## 4.read raw files and clean it
  ## read and clean test files
  ## read files 
  testdata<-read.table("./rowdata/UCI HAR Dataset/test/X_test.txt")
  test_subject_data<-read.table("./rowdata/UCI HAR Dataset/test/subject_test.txt")
  test_activity_data<-read.table("./rowdata/UCI HAR Dataset/test/y_test.txt")
  ## Extracts only the measurements on the mean and standard deviation for each measurement 
  testdata<-testdata[,targetcolnames[,1]]
  ## descriptive variable names
  colnames(testdata)<-targetcolnames[,2]
  colnames(testdata)<-gsub("\\(\\)","",colnames(testdata))
  colnames(testdata)<-gsub("\\-","\\.",colnames(testdata))
  colnames(test_subject_data)<-c("subject_id")
  colnames(test_activity_data)<-c("activity_id")
  test_activity_data<-merge(activity_names,test_activity_data,
                            by.x="V1",by.y="activity_id")
  colnames(test_activity_data)<-c("activity_id","activity_name")
  ## bind cols
  testdata<-cbind(test_activity_data$activity_name,testdata)
  testdata<-cbind(test_subject_data,testdata)
  colnames(testdata)[2]<-"activity_name"
  ## average of each variable for each activity and each subject
  testdatamean<-aggregate(testdata[,3:68] ,
                          by=list(subject_id=testdata$subject_id,
                                  activity_name=testdata$activity_name),FUN=mean)
  ## read and clean train files
  ## read files 
  traindata<-read.table("./rowdata/UCI HAR Dataset/train/X_train.txt")
  train_subject_data<-read.table("./rowdata/UCI HAR Dataset/train/subject_train.txt")
  train_activity_data<-read.table("./rowdata/UCI HAR Dataset/train/y_train.txt")
  ## Extracts only the measurements on the mean and standard deviation for each measurement 
  traindata<-traindata[,targetcolnames[,1]]
  ## descriptive variable names
  colnames(traindata)<-targetcolnames[,2]
  colnames(traindata)<-gsub("\\(\\)","",colnames(traindata))
  colnames(traindata)<-gsub("\\-","\\.",colnames(traindata))
  colnames(train_subject_data)<-c("subject_id")
  colnames(train_activity_data)<-c("activity_id")
  train_activity_data<-merge(activity_names,train_activity_data,
                             by.x="V1",by.y="activity_id")
  colnames(train_activity_data)<-c("activity_id","activity_name")
  ## bind cols
  traindata<-cbind(train_activity_data$activity_name,traindata)
  traindata<-cbind(train_subject_data,traindata)
  colnames(traindata)[2]<-"activity_name"
  ## average of each variable for each activity and each subject
  traindatamean<-aggregate(traindata[,3:68] ,
                           by=list(subject_id=traindata$subject_id,
                                   activity_name=traindata$activity_name),FUN=mean)
  ## 5. merge two dataset
  outputdata<-rbind(traindatamean,testdatamean)
  ## 6.write to files
  write.table(outputdata,"./tidydata.txt", row.name=FALSE)
}