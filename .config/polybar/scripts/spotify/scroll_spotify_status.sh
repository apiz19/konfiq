#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 2 \
        --scroll-padding "  " \
        --match-command "$HOME/.config/polybar/scripts/spotify/get_spotify_status.sh --status" \
        # --match-text "Playing" "--scroll 1" \
        # --match-text "Paused" "--scroll 0" \
        --update-check true "$HOME/.config/polybar/scripts/spotify/get_spotify_status.sh" &

# wait
# zscroll -l 30 \
#         --delay 0.075 \
#         --match-command "playerctl --player=spotify status" \
#         --match-text "Playing" "--scroll true" \
#         --match-text "Paused" "--scroll false" \
#         --update-check true '/$HOME/.config/polybar/scripts/spotify/scroll_spotify_status.sh' &

# wait
