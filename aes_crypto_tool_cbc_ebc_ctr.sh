#!/bin/bash


echo " Welcome to AES/RC4 Crypto Tool By DimitrisV SV1SJP"
read -p " Give me the name of the file. The file must be in the same directory with this script  " file
read -p "Do you want to Encrypt Or Decrypt a file? Press 0 For Encrypt Or 1 for Decrypt  " answer

#User can type only 0 or 1 to continue
while [ $answer -ne 0 ] && [ $answer -ne 1 ] 
  do

      read -p "Do you want to Encrypt Or Decrypt a file? Press 0 to Encrypt Or 1 to Decrypt  " answer

  done

if [ $answer -eq 0 ] 
then
	read -p "Do you want to Encrypt via AES-CTR or RC4? Press 0 For AES-CTR Or 1 RC4  " answer1

#User can type only 0,1 or 2 to continue
	while [ $answer1 -ne 0 ] && [ $answer1 -ne 1 ] && [ $answer1 -ne 2 ] 
  		do

     			 read -p "Do you want to Encrypt via AES-CTR or RC4? Press 0 For AES-CTR Or 1 RC4  " answer1

  		done
		
		
		if [ $answer1 -eq 0 ]
		then
			
#Encrypt using CTR
			openssl enc -aes-256-ctr -pbkdf2 -in $file -out [$file].enc	
		
		elif [ $answer1 -eq 1 ]
		then

#Encrypt using RC4
			openssl enc -rc4 -pbkdf2 -in $file -out [$file].enc

        fi



	
else 
	read -p "Do you want to Decrypt via AES-CTR or RC4? Press 0 For AES-CTR Or 1 RC4    " answer1

#User can type only 0 or 1 to continue
	while [ $answer1 -ne 0 ] && [ $answer1 -ne 1 ] && [ $answer1 -ne 2 ] 
  		do

     			 read -p "Do you want to Decrypt via AES-CTR or RC4? Press 0 For AES-CTR Or 1 RC4  " answer1

  		done
		
		read -p "Give me the name of the file you want  to export  " file2
		if [ $answer1 -eq 0 ]
		then
			
#Decrypt using CTR
			openssl enc -aes-256-ctr -pbkdf2 -in $file -d -out $file2
		
		elif  [ $answer1 -eq 1 ]
		then

#Decrypt using RC4
			openssl enc -rc4 -pbkdf2 -in $file -d -out $file2

			

		fi

fi 
