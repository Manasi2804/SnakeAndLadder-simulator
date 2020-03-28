#!/bin/bash -x

echo "Welcome to the snack and ladder simulator"
FirstPosition=0
SecondPosition=0
CountDicePlayed=0
numberofPlayer=2

function play() {
while [[ $FirstPosition -ne 100 && $SecondPosition -ne 100 ]]
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

		if [[ $FirstPosition -lt 0 ]]
      then
        playerFirst=0
      fi
		(( numberofPlayer-- ))

	elif [[ $numberofPlayer -eq 1 ]]
	then
		diceNumber=$(( RANDOM%6+1 ))
			echo "Second Position:" $SecondPosition
		(( countDicePlayed++ ))

		ch=$(( RANDOM%3+1 ))
		case $ch in
			1)
				#no play
				SecondPosition=$SecondPosition ;;
			2)
				#ladder
				SecondPosition=$(( $SecondPosition+$diceNumber )) ;;
			3)
				#snake
				SecondPosition=$(( $SecondPosition-$diceNumber )) ;;
		esac
		if [[ $SecondPosition -gt 100 ]]
		then
			SecondPosition=$(( $SecondPosition-$diceNumber ))
		fi
		if [[ $SecondPosition -eq 100 ]]
		then
			echo "Player second is winner"
			break
		fi

		if [[ $SecondPosition -lt 0 ]]
		then
			SecondPosition=0
		fi
	numberofPlayer=2
fi
done
}
play
echo "Number of time dice was played to win the game:" $countDicePlayed
