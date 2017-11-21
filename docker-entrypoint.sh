#!/bin/sh
Xorg $DISPLAY &
export DISPLAY
exec sudo -u pi dbus-run-session $@
