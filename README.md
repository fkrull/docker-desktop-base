# desktop-base
A Docker base image running an X server.

https://hub.docker.com/r/fkrull/desktop-base

## Usage
```
    docker run --privileged -v /run/udev:/run/udev fkrull/desktop-base:<tag> <command>
```

By default, xterm is launched with no WM.
