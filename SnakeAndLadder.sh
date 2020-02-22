#!/bin/bash -x

echo Welcome To Snake And Ladder Simulation

#CONSTANTS
START_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2
PLAYER_1=1
PLAYER_2=2

#VARIABLES
player1Position=$START_POSITION
player2Position=$START_POSITION
player=$PLAYER_1

#FUNCTION TO SIMULATE DIE ROLL AND RETURN POSITION AFTER EVERY DIE ROLL
function snakeLadder(){
	local position=$1
	dieRoll=$((RANDOM%6+1))
	action=$((RANDOM%3))
	#CHECKING FOR ACTION TO BE PERFORMED AND PERFORMING IT
	case $action in
		$NO_PLAY)
			position=$position
			;;
		$LADDER)
			#IF STATEMENT TO ENSURE POSITION NEVER BECOMES GREATER THAN WINNING POSITION
			if [ $(($position+$dieRoll)) -le $WINNING_POSITION ]
			then
				position=$(($position+$dieRoll))
			fi
			;;
		$SNAKE)
			#IF STATEMENT TO ENSURE POSITION NEVER BECOMES NEGATIVE
			if [ $(($position-$dieRoll)) -lt $START_POSITION ]
			then
				position=$START_POSITION
			else
				position=$(($position-$dieRoll))
			fi
			;;
	esac
	echo $position
}

#USING WHILE LOOP TO CHANGE PLAYER AFTER EVERY DIE ROLL AND CALL FUNCTION SNAKELADDER
while [ $player1Position -ne $WINNING_POSITION -a $player2Position -ne $WINNING_POSITION ]
do
	if [ $player -eq $PLAYER_1 ]
	then
		((numberOfDieRollsForPlayer1++))
		player1Position=$(snakeLadder $player1Position)
		player1PositionArray[$numberOfDieRollsForPlayer1]=$player1Position
		player=$PLAYER_2
	else
		((numberOfDieRollsForPlayer2++))
		player2Position=$(snakeLadder $player2Position)
		player2PositionArray[$numberOfDieRollsForPlayer2]=$player2Position
		player=$PLAYER_1
	fi
done

#STORING THE WINNER IN A VARIABLE
if [ $player1Position -eq $WINNING_POSITION ]
then
	winner="player "$PLAYER_1
else
	winner="player "$PLAYER_2
fi
