#!/bin/bash -x

FirstPosition=0
CountDicePlayed=0
numberofPlayer=2

function play() {
while [[ $FirstPosition -ne 100 ]]
do
	if [[ $numberofPlayer -eq 2 ]]
	then
		diceNumber=$(( RANDOM%6+1 ))
		echo "First player position:" $FirstPosition
		(( countDicePlayed++ ))
		ch=$(( RANDOM%3+1 ))
		case $ch in
		1)  #no play
			FirstPosition=$FirstPosition  ;;

		2)  #ladder
			FirstPosition=$(( $FirstPosition+$diceNumber ))  ;;

		3)  #snake
			FirstPosition=$(( $FirstPosition-$diceNumber ))  ;;
		esac
		if [[ $FirstPosition -gt 100 ]]
		then
			FirstPosition=$(( $FirstPosition-$diceNumber ))
		fi

		if [[ $FirstPosition -eq 100 ]]
      then
         echo "Player first is winner"
					break
      fi
