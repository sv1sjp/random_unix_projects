#!/bin/bash

# $1 for integer 1
# $2 for integer 2

declare -a hist=(0 0 0 0 0 )
declare -a histwc=(0 0 0 0 0 )
i=-1
x=0
y=0
z=0
r=0
n=0
zz=0
answer=0


while [ $answer -eq 0 ]
do
    read -p "Enter the name of directory:  "  directory
    i=$((i+1))
    j=0
    echo " 1. Files with ' $1 ' Permission are :"
    histwc[$i,$j]=$(find $directory -type f -perm $1 | wc -l)
    x=$((histwc[i,j]+x))
    hist[$i,$j]=$(find $directory -type f -perm $1)
    echo ${histwc[i,j]}
    echo ${hist[i,j]}
    echo ''


    j=1
    echo ''
    echo " 2. Files that have been accessed these' $2 ' days are: "
    histwc[$i,$j]=$(find $directory  -type f -atime -$2 | wc -l )
    hist[$i,$j]=$(find $directory  -type f -atime -$2)
    y=$((histwc[i,j]+y))
    echo ${histwc[i,j]}
    echo ${hist[i,j]}
    echo ''


    j=2
    echo ''
    echo " 3. Directories that have been accessed these' $2 ' days are: "
    histwc[$i,$j]=$(find $directory  -type d -atime -$2 | wc -l)
    hist[$i,$j]=$(find $directory  -type d -atime -$2)
    z=$((histwc[i,j]+z))
    echo ${histwc[i,j]}
    echo ${hist[i,j]}
    echo ''

    j=3
    echo ''
    echo " 4. Number of pipes or sockets: "
    histwc[$i,$j]=$(find $directory -type c | wc -l)
    hist[$i,$j]=$(find $directory -type c)
    n=$((histwc[i,j]+n))
    echo ${histwc[i,j]}
    echo ${hist[i,j]}
    echo ''

    j=4
    echo ''
    echo " 5. Emply files from this directory are: "
    histwc[$i,$j]=$(find $directory -maxdepth 1 -type f -empty | wc -l)
    hist[$i,$j]=$(find $directory -maxdepth 1 -type f -empty)
    r=$((histwc[i,j]+r))
    echo ${histwc[i,j]}
    echo ${hist[i,j]}
    echo ''

    echo ''
    read -p "If you want to continue , press 0 . Any other option , closes the script. " answer
    clear
done

#Showing all of the history ,stored in arrays
while [ $zz -le $i ]
do
    echo ''
    echo "History: $zz st search:"
    t=0
    while [ $t -le 4 ]
    do
        echo "$t Exercise : "
        echo ""
    #Shows entire history
        echo ${histwc[zz,t]}
        echo ${hist[zz,t]}
        t=$((t+1))
    done
    zz=$((zz+1))
done

#Show the summarize
echo ""
echo " First exercise find $x files"
echo " Second exercise find $y files"
echo " Third exercise find $z directories"
echo " Fourth exercise find $n files"
echo " Fifth exercise find $r files"
