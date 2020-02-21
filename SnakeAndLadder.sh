#!/bin/bash -x

echo Welcome To Snake And Ladder Simulation

#CONSTANTS
START_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2
WINNING_POSITION=100

#VARIABLES
position=$START_POSITION

while [ $position -lt $WINNING_POSITION ]
do
	dieRoll=$((RANDOM%6+1))
	action=$((RANDOM%3))
	#CHECKING FOR ACTION TO BE PERFORMED AND PERFORMING IT
	case $action in 
		$NO_PLAY)
			position=$position
			;;
		$LADDER)
			position=$(($position+$dieRoll))
			;;
		$SNAKE)
			if [ $(($position-$dieRoll)) -lt $START_POSITION ]
			then
				position=$START_POSITION
			else
				position=$(($position-$dieRoll))
			fi
			;;
	esac
done
