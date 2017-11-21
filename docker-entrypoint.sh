#!/bin/sh

mkdir -p /etc/X11/xorg.conf.d/
cat > /etc/X11/xorg.conf.d/00-keymap.conf <<EOF
Section "InputClass"
    Identifier "system-keyboard"
    MatchIsKeyboard "on"
    Option "XkbLayout" "${KEYMAP}"
    Option "XkbModel" "pc105"
EndSection
EOF

rm -f /tmp/.X0-lock
Xorg ${DISPLAY} &
export DISPLAY
exec sudo -u ${USER} dbus-run-session $@
