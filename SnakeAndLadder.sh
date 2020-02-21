#!/bin/bash -x

echo Welcome To Snake And Ladder Simulation

#CONSTANTS
START_POSITION=0
NO_PLAY=0
LADDER=1
SNAKE=2

#VARIABLES
dieRoll=$((RANDOM%6+1))
action=$((RANDOM%3))
pos=$START_POSITION

#CHECKING FOR ACTION TO BE PERFORMED AND PERFORMING IT
case $action in 
	$NO_PLAY)
		pos=$pos
		;;
	$LADDER)
		pos=$(($pos+$dieRoll))
		;;
	$SNAKE)
		pos=$(($pos-$dieRoll))
		;;
esac
