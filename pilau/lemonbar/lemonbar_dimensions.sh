#!/bin/sh
# currently designed for one screen setups only

# get screen width
SCREEN_WIDTH=$(xrandr -q | grep -o "current\s[0-9]\{3,4\}" | grep -o "[0-9]\{3,4\}")

# set bar dimensions
if [[ "${BAR_OFFSET_X}" == "" ]]; then
    BAR_OFFSET_X="440"
fi

if [[ "${BAR_OFFSET_Y}" == "" ]]; then
    BAR_OFFSET_Y="8"
fi

BAR_HEIGHT="24"
BAR_WIDTH=$(($SCREEN_WIDTH-$((BAR_OFFSET_X*2))))

# build bar dimensions string
BAR_DIMS="${BAR_WIDTH}x${BAR_HEIGHT}+${BAR_OFFSET_X}+${BAR_OFFSET_Y}"
echo $BAR_DIMS
