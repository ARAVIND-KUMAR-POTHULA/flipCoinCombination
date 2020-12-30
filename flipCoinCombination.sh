#! /bin/bash/ -x
declare -A singletCombination
heads=1
tails=0
headsCount=0
tailsCount=0
count=1
read -p "enter a number how many times to flip a coin " multiple
	while (( $count<=$multiple ))
	do
		flip=$(( RANDOM%2 ))
		if (( $flip==$heads ))
		then
			((headsCount++))
			singletCombination[ "flip $count" ]="H"
		else
			 singletCombination[ "flip $count" ]="T"
			((tailsCount++))
		fi
		((count++))
	done
multiplication=$(( headsCount*100 ))
percentage=$((  multiplication/multiple))
echo "PERCENTAGE OF HEADS IN SINGLET COMBINATION "$percentage"%"
multiplication=$(( tailsCount*100 ))
percentage=$((  multiplication/multiple))
echo "PERCENTAGE OF TAILS "$percentage"%"
echo ${singletCombination[@]}
echo ${!singletCombination[@]}
