# LXD Setup Instructions

### First Time User Account Setup

- cd into `~/auto`
- Run `bash machine_setup.sh` and follow the instructions.
- Run `bash go_setup.sh`
- Run `bash lxd_setup.sh` and follow the instructions.
- There is most likely an instance of LXD created on the machine. You can confirm this by checking for the existence of `/var/lib/lxd`. If the directory exists, but `runlxc list` fails, you probably need to run the LXD daemon. See "Running the Daemon" below.
- The script creates two aliases you can use to invoke *our* version of LXD.
	- Call `runlxd` to spawn the daemon from your `$GOPATH/bin`. You will see the output on your terminal.
	- Call `runlxc` to invoke our lxc client (from `$GOPATH/bin`). You can of course add arguments, e.g. `runlxc list`
	- If you want to completley purge the existing installation of LXD from the system and reinstall your build, reference the instructions below.

### Running the Daemon
You will need a running instance of LXD to do anything with LXD or LXC. You should run `runlxd` in a background terminal if an instance is not already running.

### Subsequent Builds

In most cases, you should be able to simply kill the running LXD instance, rebuild the binaries, and relaunch LXD to see your changes. However, if you made changes to container generation, storage pool generation, network bridge generation, etc, then you will need to completley purge existing LXD data in addition to using your new binaries. (This means you will also need to recreate conatiners.) If you need to do this, follow these steps:
- Kill any existing instance of lxd you have runnning
- Rebuild LXD if you haven't already
- Restart the machine with `sudo reboot now`
- After logging back in, run `delete-lxd-data`. This purges `/var/lib/lxd`.
- You should now be able to run `runlxd`. **Leave the daemon running in a background terminal for the following steps.**
- You will need to also run `$GOPATH/bin/lxd init` in anther terminal to initialize new storage pools, network bridges, etc. **Use the default options by repeatedly hitting enter.**
- You can now use `runlxc launch` to create a new image. (see below)


### Container management

- `runlxc launch ubuntu:18.04 <containername>`
- `runlxc list`
- `runlxc exec <containername> /bin/bash`
- `runlxc delete <containername>`
