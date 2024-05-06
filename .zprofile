export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
export XZ_OPT="--threads=0"
export WINEESYNC=1
export WINEFSYNC=1
export PBA_ENABLE=1
export CMAKE_GENERATOR=Ninja
#
# https://github.com/wine-compholio/wine-staging/wiki/Environment-Variables
export STAGING_SHARED_MEMORY=1
# Have been causing stalls lately
#export STAGING_RT_PRIORITY_SERVER=90

#export __GL_YIELD=NOTHING
export __GL_SYNC_TO_VBLANK=0
export TODOTXT_CFG_FILE="$HOME/.config/todo.cfg"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"

source "$HOME/.zprofile_thispc"

export HOMEBREW_NO_AUTO_UPDATE=1
