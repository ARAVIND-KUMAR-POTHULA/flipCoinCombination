#! /bin/bash/ -x
declare -A doubletCombination
heads=1
tails=0
headsHeadsCount=0
headsTailsCount=0
tailsHeadsCount=0
tailsTailsCount=0
count=1
read -p "enter a number how many times to flip a coin " multiple
	function percentage() {
		local count=$1
		multiplication=$(( count*100 ))
		percentage=$((  multiplication/multiple))
		echo $percentage
	}

	while (( $count<=$multiple ))
	do
		flip=$(( RANDOM%2 ))
		flip1=$(( RANDOM%2 ))
		if (( $flip==$heads && flip1==$heads))
		then
			((headsHeadsCount++))
			doubletCombination[ "doubleflip $count" ]="HH"
		 elif (( $flip==$heads && flip1==$tails))
                then
                        ((headsTailsCount++))
                        doubletCombination[ "doubleflip $count" ]="HT"
		elif (( $flip==$tails && flip1==$heads))
                then
                        ((tailsHeadsCount++))
                        doubletCombination[ "doubleflip $count" ]="TH"
		else
                        ((tailsTailsCount++))
                        doubletCombination[ "doubleflip $count" ]="TT"
		fi
		((count++))
	done
percentage1="$( percentage $headsHeadsCount )"
echo "PERCENTAGE OF (HH) IN DOUBLET COMBINATION "$percentage1"%"

percentage1="$( percentage $headsTailsCount )"
echo "PERCENTAGE OF (HT) IN DOUBLET COMBINATION "$percentage1"%"

percentage1="$( percentage $tailsHeadsCount )"
echo "PERCENTAGE OF (TH) IN DOUBLET COMBINATION "$percentage1"%"

percentage1="$( percentage $tailsTailsCount )"
echo "PERCENTAGE OF (TT) IN DOUBLET COMBINATION "$percentage1"%"

echo ${doubletCombination[@]}
echo ${!doubletCombination[@]}
