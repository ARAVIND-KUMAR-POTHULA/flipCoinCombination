#! /bin/bash/ -x
heads=1
tails=0
flip=$(( RANDOM%2 ))
	if (( $flip==$heads ))
	then
		echo "HEADS IS WINNER"
	else
		 echo "TAILS IS WINNER"
	fi
