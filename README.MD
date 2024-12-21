# HarrisonFld Dots
Simple dots that use GNU Stow to install and symlink the files
## Features
- Install script at /script/install/install.sh
- Ability to specify local and global ignores for stow
- Ability to specify global copy only instead of stowing
- Change and specify the package manager in /config/pkg_start
- Disclude and include certain configs in /config/stow_list
- Specify required packages in the configs pkg_list
## Notes
- Anything that varies based on the user/machine should be a configurable file in ~/Desktop/
- Changing the package manager will most likely require the changing of pkg_list in each config
- The install doesn't currently have the ability to use more than one package manager (no AUR packages)

