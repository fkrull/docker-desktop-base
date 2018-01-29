# desktop-base
A Docker base image running an X server.

https://hub.docker.com/r/fkrull/desktop-base

## Usage
```
    docker run --privileged -v /run/udev:/run/udev fkrull/desktop-base:<tag> <command>
```

By default, xterm is launched with no WM.

The command is run as an unprivileged user (currently `pi` by default, though this can be changed using the `USER` build argument). This user can use `sudo` to run privileged commands. A session dbus daemon is launched as well.
