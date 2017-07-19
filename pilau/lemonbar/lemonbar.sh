#!/bin/sh

# set directory
export LBDIR=$DOTFILES_REPO_DIR/pilau/lemonbar

# functions
__get_dims() {
    source $LBDIR/lemonbar_dimensions.sh
}

__get_theme() {
    source $LBDIR/lemonbar_theme.sh
}

while true; do

    # this should allow for changing data configuration on the fly
    source $LBDIR/lemonbar_data.sh

    # echo the output so it pipes to lemonbar
    echo $BAR_OUTPUT

	sleep 5s

done | lemonbar -g $(__get_dims) -B $(__get_theme)
