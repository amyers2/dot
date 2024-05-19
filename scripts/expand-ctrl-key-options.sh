#!/bin/bash

killall xcape 2> /dev/null

spare_modifier="Hyper_L"

xmodmap -e "keycode 36 = $spare_modifier"
xmodmap -e "remove mod4 = $spare_modifier" # hyper_l is mod4 by default
xmodmap -e "add Control = $spare_modifier"

# Map enter to an unused keycode (to keep it around for xcape to use).
xmodmap -e "keycode any = Return"

# Finally use xcape to cause the space bar to generate a <CR> when tapped.
xcape -e "$spare_modifier=Return"
