# script to set the environment variable for xinit

# possible WMs
# openbox-session
# i3

# the wm you _want_ to use
export TARGET_WM=i3



# initialise logging for this script
mkdir -p ~/.logs
export WM_LOG_FILE=~/.logs/setwm.log

# the default wm to be used if the target wm can't be found
export DEFAULT_WM=openbox-session

echo "Default window manager is ${DEFAULT_WM}" \
| cat >> $WM_LOG_FILE

echo "Checking to see if ${TARGET_WM} is available" \
| cat >> $WM_LOG_FILE

# the wm that will be used. falls back to default
export REAL_WM=$DEFAULT_WM

if which $TARGET_WM >/dev/null; then
    echo "${TARGET_WM} is available" | cat >> $WM_LOG_FILE
    REAL_WM=$TARGET_WM
else
    echo "It's not..." | cat >> $WM_LOG_FILE
fi

echo "Will try to use ${REAL_WM} as window manager" \
| cat >> $WM_LOG_FILE
