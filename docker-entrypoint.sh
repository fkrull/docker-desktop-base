#!/bin/sh
Xorg ${DISPLAY} &
export DISPLAY
exec sudo -u ${USER} dbus-run-session $@
