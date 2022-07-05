#!/bin/sh

first=$(ls "$1" | head -n 1)

w=$(jhead "$1"/"$first" | grep Res | awk '{print $3}')
h=$(jhead "$1"/"$first" | grep Res | awk '{print $5}')

echo $first $w x $h

echo "::: Processing $1 ..."
for i in "$1"/*[0-9].jpg
do
    aspect "$w"x"$h" -m pad -c black -g center "$i" "${i%.*}"-padded.jpg
    aspect 540x960 -m crop -g center "${i%.*}"-padded.jpg "${i%.*}"-cropped.jpg
    rm "$1"/*-padded.jpg
done

echo "::: Writing $1 to .gif"
convert -delay 150 -loop 0 -dispose previous "$1"/*-cropped.jpg "$2"

rm "$1"/*-cropped.jpg
