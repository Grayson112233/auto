# Script to set up a dev environment for LXD


# Install dependent apt packages
sudo apt install -y acl autoconf dnsmasq-base git golang libacl1-dev libcap-dev liblxc1 liblxc-dev libtool libuv1-dev make pkg-config rsync squashfs-tools tar tcl xz-utils ebtables
sudo apt install -y libapparmor-dev libseccomp-dev libcap-dev
sudo apt install -y lvm2 thin-provisioning-tools
sudo apt install -y btrfs-tools
sudo apt install -y curl gettext jq sqlite3 uuid-runtime bzr socat


go get -v -x -tags libsqlite3 github.com/lxc/lxd/lxc
go get -v -x -tags libsqlite3 github.com/lxc/lxd/lxd


cd ~/go/src/github.com/lxc/lxd
make deps

read -p "IMPORTANT: Copy the above 3 lines into your ~/.bashrc using a different terminal. This step must be completed before continuing. Press enter to continue."
read -p "Are you absolutely sure you completed the step above? Press enter to continue."

source ~/.bashrc

# Create aliases for sudo
echo "alias sudo='sudo '" >> ~/.bashrc
echo "alias runlxd='sudo -E LD_LIBRARY_PATH=$LD_LIBRARY_PATH $GOPATH/bin/lxd --group sudo'" >> ~/.bashrc
echo "alias runlxc='sudo $GOPATH/bin/lxc'" >> ~/.bashrc
echo "alias delete-lxd-data='sudo pkill -f lxd && sudo pkill -f lxc && sudo rm -rf /var/lib/lxd'" >> ~/.bashrc

source ~/.bashrc

# Add our remote and set it
cd ~/go/src/github.com/lxc/lxd
git remote add github git@github.com:Grayson112233/lxd.git
git remote update
git checkout github/master

# Build our fork
make
