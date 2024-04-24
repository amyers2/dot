#!/bin/bash

#-------------------------------------------------------------------------------

#
# cd aliases
#

nxs_dir="cd /mnt/d/projects/Nexus/nexus-system-controller"
alias nxs="${nxs_dir}"
alias nxsscr="${nxs_dir}/tools/scripts"
alias nxsbld="${nxs_dir}/build"

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

# list only files sorted by size
alias ls="eza -alf --color=always --sort=size | grep -v /"

# list everything sorted by time updated
alias lt="eza -al --sort=modified"

# some more aliases originally defined in .bashrc
# (just keeping here for reference)
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'


