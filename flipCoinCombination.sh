#! /bin/bash/ -x
declare -A tripletCombination
heads=1
tails=0
HHHcount=0
HHTcount=0
HTHcount=0
HTTcount=0
THHcount=0
THTcount=0
TTHcount=0
TTTcount=0

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
		flip1=$(( RANDOM%2 ))
		flip2=$(( RANDOM%2 ))
		flip3=$(( RANDOM%2 ))
		if (( $flip1==$heads && $flip2==$heads && $flip3==$heads ))
		then
			((HHHcount++))
			tripletCombination[ "doubleflip $count" ]="HHH"
		elif (( $flip1==$heads && $flip2==$heads && $flip3==$tails ))
                then
                        ((HHTcount++))
                        tripletCombination[ "doubleflip $count" ]="HHT"
		elif (( $flip1==$heads && $flip2==$tails && $flip3==$heads ))
                then
                        ((HTHcount++))
                        tripletCombination[ "doubleflip $count" ]="HTH"
		elif (( $flip1==$heads && $flip2==$tails && $flip3==$tails ))
                then
                        ((HTTcount++))
                        tripletCombination[ "doubleflip $count" ]="HTT"
		elif (( $flip1==$tails && $flip2==$heads && $flip3==$heads ))
                then
                        ((THHcount++))
                        tripletCombination[ "doubleflip $count" ]="THH"
                elif (( $flip1==$tails && $flip2==$heads && $flip3==$tails ))
                then
                        ((THTcount++))
                        tripletCombination[ "doubleflip $count" ]="THT"
                elif (( $flip1==$tails && $flip2==$tails && $flip3==$heads ))
                then
                        ((TTHcount++))
                        tripletCombination[ "doubleflip $count" ]="TTH"
                elif (( $flip1==$tails && $flip2==$tails && $flip3==$tails ))
                then
                        ((TTTcount++))
                        tripletCombination[ "doubleflip $count" ]="TTT"
		fi
		((count++))
	done
percentage1="$( percentage $HHHcount )"
echo "PERCENTAGE OF (HHH) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $HHTcount )"
echo "PERCENTAGE OF (HHT) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $HTHcount )"
echo "PERCENTAGE OF (HTH) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $HTTcount )"
echo "PERCENTAGE OF (HTT) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $THHcount )"
echo "PERCENTAGE OF (THH) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $THTcount )"
echo "PERCENTAGE OF (THT) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $TTHcount )"
echo "PERCENTAGE OF (TTH) IN TRIPLET COMBINATION "$percentage1"%"

percentage1="$( percentage $TTTcount )"
echo "PERCENTAGE OF (TTT) IN TRIPLET COMBINATION "$percentage1"%"

echo ${tripletCombination[@]}
echo ${!tripletCombination[@]}
