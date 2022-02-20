#!/bin/bash

# Simple script to use the pomodoro technique using rofi

chosen=$(echo -e "Start a new pomodoro\nFinish the active pomodoro\nCancel the active pomodoro\nTake a break" | rofi -dmenu -i)

if  [[ $chosen = "Start a new pomodoro" ]]; then
        arguments=""

        arguments+=$(rofi -dmenu -p 'Task description')

        durationText=$(echo -e "Duration 55\nDuration 45\nDuration 35\nDuration 25\nDuration 20\nDuration 15\nDuration 10" | rofi -dmenu -i)
        duration=$(echo $durationText | cut -c 10-) 
        arguments+=' --duration '
        arguments+=$duration

        pomodoro start $arguments
elif [[ $chosen = "Finish the active pomodoro" ]]; then
	pomodoro finish
elif [[ $chosen = "Cancel the active pomodoro" ]]; then
	pomodoro cancel
elif [[ $chosen = "Take a break" ]]; then
        minutes=$(rofi -dmenu -p 'Break duration in minutes (default 5)')
	xterm -e pomodoro break $minutes
fi
