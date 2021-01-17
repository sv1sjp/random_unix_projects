#!/bin/bash


if [ $1 -gt 0 ] && [ $1 -le 14 ] 
then

    x=$(find -newermt "$1:00" ! -newermt "$1:59" -ls | wc -l)
    if [ $x -eq 0 ]
    then
        echo Sorry, no files available for this hour
     else
        find -newermt "$1:00" ! -newermt "$1:59" -ls >timefile
      fi
else

echo " Inappropriate number . Please try again . : "
fi


