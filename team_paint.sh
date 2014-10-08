#!/bin/bash
DEFINDEX=( "TEAM" )
RED=( "FFADFF" )
BLU=( "4EBFDF" )
TEMPLATES_PATH="./templates/"
OUTPUT_PATH="./out/"
I=0
for DEFINDEX in "${DEFINDEX[@]}"
do
    :
    REDCOLOR=${RED[$I]}
    BLUCOLOR=${BLU[$I]}
    FILENAME=${DEFINDEX[$I]}
    convert -size 512x512 xc:"#${REDCOLOR}" "./${REDCOLOR}.png"
    convert -size 512x512 xc:"#${BLUCOLOR}" "./${BLUCOLOR}.png"
    composite -compose atop  "./${REDCOLOR}.png" "${TEMPLATES_PATH}redcolor.png" "./${REDCOLOR}.png"
    composite -compose atop  "./${BLUCOLOR}.png" "${TEMPLATES_PATH}blucolor.png" "./${BLUCOLOR}.png"
    composite -compose multiply  "./${REDCOLOR}.png" "${TEMPLATES_PATH}redcolor.png" "./${REDCOLOR}.png"
    composite -compose multiply  "./${BLUCOLOR}.png" "${TEMPLATES_PATH}blucolor.png" "./${BLUCOLOR}.png"
    composite -compose atop "./${REDCOLOR}.png" "${TEMPLATES_PATH}team_paintcan.png" "${OUTPUT_PATH}${DEFINDEX}_large.png"
    composite -compose atop "./${BLUCOLOR}.png" "${OUTPUT_PATH}${DEFINDEX}_large.png" "${OUTPUT_PATH}${DEFINDEX}_large.png"
    convert "${OUTPUT_PATH}${DEFINDEX}_large.png" -resize 128x128 "${OUTPUT_PATH}${DEFINDEX}.png"
    rm "./${REDCOLOR}.png" "./${BLUCOLOR}.png"
    I=$[$I +1]
done