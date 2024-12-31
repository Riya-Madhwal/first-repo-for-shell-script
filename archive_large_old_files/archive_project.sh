#!/bin/bash

#variables
directory=/home/riya/tutorials/find_command
days=10
depth=1
RUN=0

#check if directory present or not

if [! -d $directory ]
then
     echo "directory does not exist: $BASE"
	 exit 1
	 
fi

#create archive folder if not present
if [! -d $directory/archive ]
then
    mkdir $directory/archive
fi

#find the list of files larger than 1GB

for i in 'find $directory -maxdepth $DEPTH -type f -size +1G'
do 
 if [$RUN -eq 0 ]
  then 
   echo "moving  files from $directory/ to $directory/archive location"
   gzip $i || exit 1
   mv $i.gz $directory/archive || exit 1
 fi
done
