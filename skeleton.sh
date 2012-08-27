#!/usr/bin/env bash

PATH="$PATH:$HOME/bin";
PID_FILE="/tmp/screencast.lock";
RUN_FILE="screencast";

if [ -e $PID_FILE ]
then
	PID=$(cat $PID_FILE);
	kill -SIGTERM $PID;
	rm $PID_FILE;
else
	$RUN_FILE "$@" & PID=$!;
	echo $PID > $PID_FILE;
fi

exit 0;
