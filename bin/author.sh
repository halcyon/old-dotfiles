#!/bin/bash
USAGE="$0 MPEG2 CINT"
if [ -z $1 ]
then
  echo $USAGE
  exit
else
  MPEG2=$1
  FILM=${1%%.MPG}
fi

if [ -z $2 ]
then
  echo $USAGE
  exit
else
  CINT=$2
fi

LENGTH=`mediainfo $MPEG2  | grep Duration | head -1 | awk '{print ($3*60)+($4)}'`

CHAPTERS=`
ruby <<-EOF
  chapters=[];
  0.step($LENGTH,$CINT) do |i|
    chapters<<"#{i}:0"
  end
  if $LENGTH%$CINT == 0
    total=chapters.size-1
  else
    total=chapters.size
  end
  total.times do |i|
    if i==total-1
      print "#{chapters[i]}"
    else
      print "#{chapters[i]},"
    end
  end
EOF
`
dvdauthor -t -c $CHAPTERS $MPEG2 -o $FILM
dvdauthor -T -o $FILM
mkisofs -dvd-video -udf -o $FILM.iso -V "$FILM" "$FILM"
