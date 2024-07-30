#!/bin/bash
# Function that converts a decimal number to Roman numerals
normal(){
clear
echo " Your number is:  "
echo
    while [ $inter -ne 0 ]
    do
            if [ $inter -ge 1000 ]
                then   echo -n "M"
                     inter=$((inter-1000))
            elif [ $inter -ge 900 ]
                then   echo -n "CM"
                      inter=$((inter-900))
            elif [ $inter -ge 500 ]
                then   echo -n "D"
                      inter=$((inter-500))
                            
             elif [ $inter -ge 400 ]
                then   echo -n "CD"
                      inter=$((inter-400))           
             
            elif [ $inter -ge 100 ]
                then   echo -n "C"
                        inter=$((inter-100))
            elif [ $inter -ge 90 ]
                then   echo -n "XC"
                        inter=$((inter-90))           
            elif [ $inter -ge 50 ]
                then   echo -n "L"
                        inter=$((inter-50))      
             elif [ $inter -ge 40 ]
                then   echo -n "XL"
                        inter=$((inter-40))              
               elif [ $inter -ge 10 ]
                then   echo -n "X"
                        inter=$((inter-10))        
              elif [ $inter -ge 9 ]
                then   echo -n "IX"
                        inter=$((inter-9))
                       elif [ $inter -ge 5 ]
                then   echo -n "V"
                        inter=$((inter-5))
               elif [ $inter -ge 4 ]
                then   echo -n "IV"
                        inter=$((inter-4))
                elif [ $inter -ge 1 ]
                    then 
                            if [ $inter -eq 3 ]
                                then echo -n "III"
                                    break
                            elif [ $inter -eq 2 ]
                                then echo -n "II"
                                    break
                            elif [ $inter -eq 1 ]
                                then echo -n "I "
                                    break
                             fi
            fi            
    done
    echo  
    echo
    
   
}
#Function that converts a Roman numeral to a decimal number
romantodec(){
clear
echo " Your number is:  "
echo
echo "$inter" > "temp.txt"
# Conversions from larger character to smaller with the goal of making all of them as multiple "I"s
sed -i "s/CM/DCD/g" temp.txt
sed -i "s/M/DD/g" temp.txt
sed -i "s/CD/CCCC/g" temp.txt
sed -i "s/D/CCCCC/g" temp.txt
sed -i "s/XC/LXL/g" temp.txt
sed -i "s/C/LL/g" temp.txt
sed -i "s/XL/XXXX/g" temp.txt
sed -i "s/L/XXXXX/g" temp.txt
sed -i "s/IX/VIV/g" temp.txt
sed -i "s/X/VV/g" temp.txt
sed -i "s/IV/IIII/g" temp.txt
sed -i "s/V/IIIII/g" temp.txt
inter=$(<temp.txt)
echo "$inter"
# Counting the I's to find the number the user provided, in decimal
grep I -o temp.txt | wc -l
echo "$inter"
}

# Main part of the script with the goal of checking if the user's data is a decimal number or Roman numeral!
echo "Decimal Number to Roman & Reversed , Created By DimitrisV SV1SJP "
read -p "Give me a decimal number from 1 ro 3999 or a Roman Number:" inter
if [ $inter -ge 0 ] || [ $inter -le 0 ]
    then 
        if [ $inter -le 0 ] || [ $inter -ge 4000 ]
        then echo "Invalid number"
        elif [ $inter -gt 0 ]
        then normal
        fi
else romantodec
fi
read -p "Press Enter to  exit" z
