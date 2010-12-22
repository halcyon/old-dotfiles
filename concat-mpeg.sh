#!/bin/bash
film=${5%%.MPG}
cat $1 $2 $3 $4| ffmpeg -i - -sameq -target ntsc-dvd -vcodec copy -acodec copy -r 23.976 $film.MPG
