#!/bin/bash

#-------------------------------------------------------------------------------

#
# cd aliases
#

if [[ $HOSTNAME == "AI932995" ]]; then
   nxs_dir="/mnt/d/projects/Nexus/nexus-system-controller"

   alias nxs="cd ${nxs_dir}"
   alias nxsscr="cd ${nxs_dir}/tools/scripts"
   alias nxsbld="cd ${nxs_dir}/build"
fi

#-------------------------------------------------------------------------------

#
# ls/eza aliases
#
# source: 
#   https://denisrasulev.medium.com/eza-the-best-ls-command-replacement-9621252323e
#

# list only directories (no files)
alias ld="eza -lD"

# list only the files (no dirs)
alias lf="eza -lf --color=always | grep -v /"

# list only hidden files (no dirs)
alias lh="eza -dl .* --group-directories-first"

# list everything with dirs first
alias ll="eza -alF --group-directories-first"

# list files like normal ls, but with eza
alias ls="eza"

# list everything sorted by time updated
alias lt="eza -al --sort=modified"

# some more aliases originally defined in .bashrc
# (just keeping here for reference)
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'


