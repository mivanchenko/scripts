#!/bin/bash

CURRENT=$(xrandr | sed -n '/VGA/,/[[:upper:]]/p' | grep '*' | cut -d' ' -f4)
if [ $CURRENT == '1920x1080' ]; then
	MODELINE=$(cvt 1366 768 | grep Modeline | cut -d' ' -f2-)
	MODE=$(echo $MODELINE | cut -d' ' -f1)
	HAS1366=$(xrandr | sed -n '/VGA/,/[[:upper:]]/p' | grep '13[[:digit:]][[:digit:]]')
	if [[ -z $HAS1366 ]]; then
		xrandr --newmode $MODELINE
		xrandr --addmode VGA1 $MODE
	fi
	xrandr --output VGA1 --mode $MODE --primary --left-of LVDS1
else
	xrandr --output VGA1 --mode '1920x1080' --primary --left-of LVDS1
fi
