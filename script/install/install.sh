#!/bin/bash

error_exit() {
	printf "An error occured,\n$1,\nplease resolve the error given the instructions, exiting...\n"
	exit
}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DOTS_MANAGER="stow -t $HOME --no-folding --verbose=1 --dotfiles"
CFGDIR="$SCRIPT_DIR/../../config"

# Check for directories in config/
CONFIG_STOW=$(grep -v '^#' $CFGDIR/stow_list)
CONFIG_DIRS=$(basename -a $(ls -d ${CFGDIR}/*/))
ALL_UNIQUE=$(printf "$CONFIG_DIRS\n$CONFIG_STOW" | sort | uniq -u)
DIRS_UNIQUE=$(printf "$ALL_UNIQUE\n$CONFIG_DIRS" | sort | uniq -d)
STOW_UNIQUE=$(printf "$ALL_UNIQUE\n$CONFIG_STOW" | sort | uniq -d)

# Check for directories in stow list that do not exist (if they don't, exit the script)
if [[ "$STOW_UNIQUE" != "" ]]; then
	error_exit "the directories \"$STOW_UNIQUE\" are defined in \"stow_list\" but do not exist"
fi

# Check for directories undefined in the script (if they exist, prompt to include them)
if [[ $DIRS_UNIQUE != "" ]]; then
	echo "The directories \"$DIRS_UNIQUE\" are in the config folder but not defined in \"stow_list\""
	printf "Use the undefined directories anyway? [y/N]: "
	read INCLUDE_DIRS_UNIQUE
fi

# Create the final list of directories
FINAL_DIRS_LIST="$CONFIG_STOW"
if [[ "${INCLUDE_DIRS_UNIQUE,,}" = "y" ]]; then
	FINAL_DIRS_LIST="${CONFIG_STOW} ${DIRS_UNIQUE}"
fi

# Add package requirements from each config directory into a list
PKGS=""
for confdir in $FINAL_DIRS_LIST
do
	PKG_LIST="${CFGDIR}/${confdir}/pkg_list"
	if ! [ -f $PKG_LIST ]; then
		echo $PKG_LIST does not exist, continuing...
		continue
	fi
	PKGS="${PKGS} $(cat $PKG_LIST)"
done

# Install packages
PKG_START="${CFGDIR}/pkg_start"

if ! [ -f $PKG_START ]; then
	error_exit "file $PKG_START does not exist"
fi

PKG_MANAGER="$(grep -v '^#' $PKG_START)"
$PKG_MANAGER $PKGS

for conf in $FINAL_DIRS_LIST
do
	CURRENT_CONF_DIR=${CFGDIR}/${conf}

	# Move the original stow-ignore to a .bak
	if [ -f $CURRENT_CONF_DIR/.stow-local-ignore ]; then
		cp ${CURRENT_CONF_DIR}/.stow-local-ignore ${CURRENT_CONF_DIR}/.stow-local-ignore.og  	
	fi
	# Add the global_ignore to the original
	cat ${SCRIPT_DIR}/global_ignore >> ${CURRENT_CONF_DIR}/.stow-local-ignore
	# Stow
	$DOTS_MANAGER -d ${CFGDIR} ${conf}
	# Delete the combined used and move the original back
	rm -f ${CURRENT_CONF_DIR}/.stow-local-ignore
	if [ -f ${CURRENT_CONF_DIR}/.stow-local-ignore.og ]; then
		mv ${CURRENT_CONF_DIR}/.stow-local-ignore.og ${CURRENT_CONF_DIR}/.stow-local-ignore
	fi
	
done
