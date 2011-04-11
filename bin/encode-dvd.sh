#!/bin/bash
film=${1%%.AVI}
ffmpeg -i $1 -sameq -pass 1 -target ntsc-dvd -acodec ac3 -ab 128k -r 23.976 $film.MPG
ffmpeg -i $1 -sameq -pass 2 -target ntsc-dvd -acodec ac3 -ab 128k -r 23.976 -y $film.MPG
