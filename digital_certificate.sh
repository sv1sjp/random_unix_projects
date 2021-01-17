#! /bin/bash
 
read -p "Type 1 to create a new certificate: " answer
if [ $answer -eq 1 ]
then
	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365
	echo ""
	echo " Certificate is created and it is valid for 365 days"
fi

read -p "Type 1 to create a new signature " answer

if [ $answer -eq 1 ]
then
	

	read -p " Give me the Certificate file: " file
	read -p " Give me the private key: " text
	openssl dgst -sha256 -sign $file -out signature.bin $text
fi


read -p "Type 1 to validate a certificate " answer
if [ $answer -eq 1 ]
then
	read -p " Give me your Certificate file:  " file
	
	openssl verify $file
fi

