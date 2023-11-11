# clear apt cache
sudo apt-get clean

# clear Visual Studio Code workspace storage
# VS Code is installed in my home directory
rm -rvf /home/${USER}/.config/Code/User/workspaceStorage
mkdir /home/${USER}/.config/Code/User/workspaceStorage

# clear old Snap packages (Firefox and GNOME are replaced somewhat frequently)
# TODO: this should only execute on Ubuntu
LANG=C snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done