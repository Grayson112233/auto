# Script to set up a dev environment for LXD


# Install dependent apt packages
sudo apt install acl autoconf dnsmasq-base git golang libacl1-dev libcap-dev liblxc1 liblxc-dev libtool libuv1-dev make pkg-config rsync squashfs-tools tar tcl xz-utils ebtables
sudo apt install libapparmor-dev libseccomp-dev libcap-dev
sudo apt install lvm2 thin-provisioning-tools
sudo apt install btrfs-tools
sudo apt install curl gettext jq sqlite3 uuid-runtime bzr socat

# Download lxd source
go get -v -x -d github.com/lxc/lxd/lxc
go get -v -x -d github.com/lxc/lxd/lxd

cd ~/go/src/github.com/lxc/lxd
make deps