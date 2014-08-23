#!/bin/bash

input=$(cat)

issue=$(echo "$input" | sed -nr 's/<software-distribution.*issue="([0-9]{10})">/\1/p')
date=${issue:0:8}
rev=${issue:8:2}

today=$(date +%Y%m%d)
if [ "$date" = "$today" ]; then
    let rev=rev+1
    rev="0${rev}"
else
    rev="00"
fi

echo "$input" | sed -r "s/(<software-distribution.*issue=\")[0-9]{10}(\">)/\1${today}${rev: -2}\2/"
