#!/bin/sh
 
for m4a in *.m4a; do
	mp3=`echo "$m4a" | sed -e 's/m4a$/mp3/'`
	if [ ! -e "$mp3" ]; then
		ffmpeg -i "$m4a" -acodec libmp3lame -ab 256k "$mp3"
		test -s "$mp3" && rm "$m4a"
	fi
done

