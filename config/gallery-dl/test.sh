#!/bin/sh

a=1
for i in "$1"/*; do
  new=$(printf "%04d.gif" "$a") #04 pad to length of 4
  ./gif.sh "$" ~/gt-sync/"$new"
  let a=a+1
done
