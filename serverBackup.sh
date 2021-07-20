#/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "**************************************************************************"
echo "__________________Server Backup Tool by DimitrisV SV1SJP______________"
echo "**************************************************************************"

echo ""

read -p "Backup or Restore? Type 0 or 1: " answerBR
if [ $answerBR -eq 0 ] 
then
	clear
	
	echo " ________________BACKUP__________:"

	echo ""
	echo ""

	

	
	echo "Time for a Backup. Please Keep in mind that you can literally destroy anything. Please be ready for this!!!"

	echo ""

	read -p "Type 0 for sv1eig's backup , 1 for Georgia's , 2 for Vflix Backup: " answer
	clear



	if [ $answer -eq 0 ] 
	then
		echo "_____________________SV1EIG_________________________"
		echo ""
		
		rsync -av --delete --dry-run /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/sv1eig/ /media/tuxserver/Elements/Users/sv1eig/

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure -eq 1 ]
			then
				rsync -av --delete /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/sv1eig/ /media/tuxserver/Elements/Users/sv1eig/
			fi
		fi
	fi


	if [ $answer -eq 1 ] 
	then
		echo "___________________Georgia_________________________"
		echo ""

		rsync -av --delete --dry-run /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/georgia/ /media/tuxserver/Elements/Users/georgia/

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure -eq 1 ]
			then
				rsync -av --delete /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/georgia/ /media/tuxserver/Elements/Users/georgia/
			fi
		fi
	fi


	if [ $answer -eq 2 ] 
	then
		echo "_____________________Vflix_________________________"
		echo ""

		rsync -av --delete --dry-run /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/EXTertnalVflix/ /media/tuxserver/Elements/ExternalVflix/

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure -eq 1 ]
			then
				rsync -av --delete /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/EXTertnalVflix/ /media/tuxserver/Elements/ExternalVflix/
			fi
		fi
	fi
fi


if [ $answerBR -eq 1 ] 
then
	clear
	
	echo " ________________RESTORE__________:"
	echo ""
	echo ""
	echo "Time for Restore. Please Keep in mind that you can literally destroy anything. Please be ready for this!!!"

	echo ""
	read -p "Type 0 for father's backup , 1 for Georgia's , 2 for Vflix Backup: " answer
	clear



	if [ $answer -eq 0 ] 
	then
		echo "_____________________SV1EIG_________________________"
		echo ""

		rsync -av --dry-run /media/tuxserver/Elements/Users/sv1eig/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/sv1eig/

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure-eq 1 ]
			then
				rsync -av  /media/tuxserver/Elements/Users/sv1eig/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/sv1eig/
			fi
		fi
	fi


	if [ $answer -eq 1 ] 
	then
		echo "___________________Georgia_________________________"
		echo ""

		rsync -av --dry-run /media/tuxserver/Elements/Users/georgia/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/georgia/

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure -eq 1 ]
			then
				rsync -av /media/tuxserver/Elements/Users/georgia/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/users/georgia/ 
			fi
		fi
	fi


	if [ $answer -eq 2 ] 
	then
		echo "_____________________Vflix_________________________"
		echo ""

		rsync -av --dry-run /media/tuxserver/Elements/ExternalVflix/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/EXTertnalVflix/ 

		read -p "Note: You can DELETE ANYTHING. Are you sure you want to sychronise this folder and delete all the old files from the backed up folder? 0 for no , 1 for yes: " sure

		if [ $sure -eq 1 ] 
		then
			read -p "Last chance: 0 for no, 1 for yes: " sure
			if [ $sure -eq 1 ]
			then
				rsync -av /media/tuxserver/Elements/ExternalVflix/ /media/tuxserver/2167328c-4fb8-4047-a5d8-452d04c9807b/EXTertnalVflix/ 
			fi
		fi
	fi
fi
