#!/bin/bash

#
# ANSI color codes
#
#  Use `echo -e "${RED}red text${RST}"` to enable the colors to print
#  Also, the color will stick around until changed or reset.
#
BLK=$'\e[30m'
RED=$'\e[31m'
GRN=$'\e[32m'
YEL=$'\e[33m'
BLU=$'\e[34m'
MAG=$'\e[35m'
CYN=$'\e[36m'
LGT_GRY=$'\e[37m'
GRY=$'\e[90m'
LGT_RED=$'\e[91m'
LGT_GRN=$'\e[92m'
LGT_YEL=$'\e[93m'
LGT_BLU=$'\e[94m'
LGT_MAG=$'\e[95m'
LGT_CYN=$'\e[96m'
WHT=$'\e[97m'

#
# Non-color codes.
#
RST=$'\e[0m' # Reset the current modification.
UND=$'\e[4m' # Underline.


#-------------------------------------------------------------------------------


# Run this function in the terminal by issuing `source ./<this-script>; test_colors`.
function test_colors()
{
   echo -e "This is some text ${RED}printed in RED${RST}. What do you think?"
   echo -e "This is some text ${LGT_RED}printed in LGT_RED${RST}. What do you think?"
   echo -e "This is some text ${GRN}printed in GRN${RST}. What do you think?"
   echo -e "This is some text ${LGT_GRN}printed in LGT_GRN${RST}. What do you think?"
   echo -e "This is some text ${YEL}printed in YEL${RST}. What do you think?"
   echo -e "This is some text ${LGT_YEL}printed in LGT_YEL${RST}. What do you think?"
   echo -e "This is some text ${BLU}printed in BLU${RST}. What do you think?"
   echo -e "This is some text ${LGT_BLU}printed in LGT_BLU${RST}. What do you think?"
   echo -e "This is some text ${MAG}printed in MAG${RST}. What do you think?"
   echo -e "This is some text ${LGT_MAG}printed in LGT_MAG${RST}. What do you think?"
   echo -e "This is some text ${CYN}printed in CYN${RST}. What do you think?"
   echo -e "This is some text ${LGT_CYN}printed in LGT_CYN${RST}. What do you think?"
   echo -e "This is some text ${GRY}printed in GRY${RST}. What do you think?"
   echo -e "This is some text ${LGT_GRY}printed in LGT_GRY${RST}. What do you think?"
   echo -e "This is some text ${WHT}printed in WHT${RST}. What do you think?"
}