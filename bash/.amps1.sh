#!/usr/bin/env bash

# AMPSI
# (Anthony Myers PS1 - adapted from Mike Kasberg's)

# Different functions generate different parts (segments) of the PS1 prompt.
# Each function should leave the colors in a clean state (e.g. call reset if 
# they changed any colors).

# For Git PS1
#source /usr/lib/git-core/git-sh-prompt;
#GIT_PS1_SHOWDIRTYSTATE=1
#GIT_PS1_SHOWUPSTREAM="verbose"

PROMPT_DIRTRIM=2

__amps1_debian_chroot() {
    # This string is intentionally single-quoted:
    # It will be evaluated when $PS1 is evaluated to generate the prompt each 
    # time.
    echo '${debian_chroot:+($debian_chroot)}';
}

__amps1_inject_exitcode() {
    local code=$1

    if [ "$code" -ne "0" ]; then
        echo " $code "
    fi
}

__amps1_exitcode() {
    local bg_red=`tput setab 1`;
    local white=`tput setaf 15`;
    local reset=`tput sgr0`;

    # We need to run a function at runtime to evaluate the exitcode.
    echo "\[${bg_red}${white}\]\$(__amps1_inject_exitcode \$?)\[${reset}\]"
}

__amps1_time() {
    local BG_GRAY=`tput setab 240`;
    local white=`tput setaf 7`;
    local reset=`tput sgr0`;

    echo "\[${BG_GRAY}${white}\] \t \[${reset}\]"
}

__amps1_username() {
    local BG_YEL=`tput setab 178`;
    local black=`tput setaf 232`;
    local reset=`tput sgr0`;

    echo "\[${BG_YEL}${black}\] \u \[${reset}\]";
}

__amps1_arrows() {
    local bold=`tput bold`;
    local red=`tput setaf 1`;
    local green=`tput setaf 34`;
    local reset=`tput sgr0`;

    echo "\[${bold}${red}\]🮥🮥\[${green}\]🮥\[${reset}\]";
}

__amps1_workdir() {
    local bold=`tput bold`;
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;

    echo "\[${bold}${cyan}\]\w\[${reset}\]";
}

parse_git_branch() {
    local magenta=`tput setaf 213`;
    local reset=`tput sgr0`;
    local bname="$(git branch 2> /dev/null | \
    	sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"

    if [[ ! -z "$bname" ]]; then
        echo " on ${magenta}$bname${reset}"
    else
        echo ""
    fi
}

__amps1_git() {
    local magenta=`tput setaf 213`;
    local reset=`tput sgr0`;

    # Escaping the $ is intentional:
    # It makes it so the function gets re-evaluated every time the prompt is 
    # generated.
    #echo "\$(__git_ps1 ' (\[${magenta}\]%s\[${reset}\])')"
    echo "\$(parse_git_branch)"
}

__amps1_box_top() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╭\[${reset}\]"
}

__amps1_box_bottom() {
    local cyan=`tput setaf 45`;
    local reset=`tput sgr0`;
    echo "\[${cyan}\]╰\[${reset}\]"
}


__amps1_user_prompt() {
    local bold=`tput bold`;
    local reset=`tput sgr0`;

    echo "\[${bold}\]❯ \[${reset}\] ";
}

__amps1() {
    local ps1="\n$(__amps1_box_top)$(__amps1_debian_chroot)$(__amps1_exitcode)"
    ps1+="$(__amps1_time)$(__amps1_username) $(__amps1_workdir)$(__amps1_git)\n"
    ps1+="$(__amps1_box_bottom)$(__amps1_user_prompt)";

    echo $ps1;
}

# To test, for example, print output before changes and after changes
# and see if the diff is correct.
# Uncomment for testing:
#__amps1;
