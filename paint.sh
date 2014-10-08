#!/bin/bash
I=0
DEFINDEX=("SINGLE" )
COLORS=( "992C60" )
TEMPLATES_PATH="./templates/"
OUTPUT_PATH="./out/"
for DEFINDEX in "${DEFINDEX[@]}"
do
    :
    COLOR=${COLORS[$I]}
    convert -size 512x512 xc:"#${COLOR}" "./${COLOR}.png"
    composite -compose atop  "./${COLOR}.png" "${TEMPLATES_PATH}paintcolor.png" "./${COLOR}.png"
    composite -compose multiply  "./${COLOR}.png" "${TEMPLATES_PATH}paintcolor.png" "./${COLOR}.png"
    composite -compose atop "./${COLOR}.png" "${TEMPLATES_PATH}paintcan.png" "${OUTPUT_PATH}${DEFINDEX}_large.png"
    convert "${OUTPUT_PATH}${DEFINDEX}_large.png" -resize 128x128 "${OUTPUT_PATH}${DEFINDEX}.png"
    rm "./${COLOR}.png"
    I=$[$I +1]
done

