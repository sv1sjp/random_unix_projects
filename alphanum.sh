#!/bin/bash



answer=-1
#$1 file
#$2 character


while [ $answer -lt 1 ] || [ $answer -gt 3 ]
do
   read -p "Please enter your choice from 1 to 3: "  answer
done

if [ $answer -eq 1 ] 
then
    echo " The lines of the file $1 which start rom String $2 are : "
    grep -n ^$2. $1
     echo "__________________________________________________________________________"
    


echo " The number of lines of the file $1 which starts from String $2 is : "
grep -n ^$2. $1 | wc -l
 fi
 
 if [ $answer -eq 2 ] 
then
    echo " The lines of the file $1 which contains the string $2 is :"
    grep -n  $2 $1
    echo "__________________________________________________________________________"
 
echo " The number of lines of the fie $1 which contrain the string $2 is : "
grep -n -Fc $2 $1
fi
 
 
  if [ $answer -eq 3 ] 
  then
    echo " The lines of the files $1 which end with the string $2 are : "
    grep -n $2 $1
     echo "__________________________________________________________________________"
 
    echo " The number of lines of the files $1 which end with string $2 is : "
    grep -n $2$ $1 | wc -l
fi
