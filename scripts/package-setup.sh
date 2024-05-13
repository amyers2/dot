#!/bin/bash

#-------------------------------------------------------------------------------

function config_eza_install()
{
   sudo mkdir -p /etc/apt/keyrings
   wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc \
      | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
   echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" \
      | sudo tee /etc/apt/sources.list.d/gierens.list
   sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
   sudo apt update
}

function config_codium_install()
{
   wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
      | gpg --dearmor \
      | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
   echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] \
      https://download.vscodium.com/debs vscodium main' \
      | sudo tee /etc/apt/sources.list.d/vscodium.list
   sudo apt update
}

#-------------------------------------------------------------------------------

function check_and_install_package()
{
   if [ "$(dpkg -s $1 | grep installed)" ]; then
      echo -e "[${LGT_GRN}  OK   ${RST}] ${LGT_MAG}$1${RST} already installed."
      return
   fi

   echo
   echo -e "[${LGT_RED}MISSING${RST}] ${LGT_MAG}$1${RST}; Installing now..."
   echo

   # If we get here, the package is not installed; proceed with installation.
   case $1 in
      "eza")    config_eza_install    ;;
      "codium") config_codium_install ;;
   esac

   sudo apt -y install "$1"
   echo
}

#-------------------------------------------------------------------------------

function main()
{
   SCRIPT_RELPATH="$(dirname "${BASH_SOURCE[0]}")"
   SCRIPT_ABSPATH="$(cd "$SCRIPT_RELPATH" && pwd)"

   cd ${SCRIPT_ABSPATH}
   source ansi-color-codes.sh  # import the ANSI color defines
   
   echo
   
   if [ "$1" = "--update" ]; then
      sudo apt update && sudo apt upgrade
   fi

   check_and_install_package "eza"
   check_and_install_package "codium"
}

main "$@"  # call main, passing in all arguments