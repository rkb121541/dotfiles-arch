#!/bin/bash

internal=eDP-1
external=HDMI-1-1

function activatehdmi {
  xrandr --output "$internal" --auto --output "$external" --auto --right-of "$internal"
  xrandr --output "$internal" --mode 1920x1080 --rate 120
  xrandr --output "$external" --mode 1920x1080 --rate 60
}

function deactivatehdmi {
  xrandr --output "$external" --off --output "$internal" --auto
  xrandr --output "$internal" --mode 1920x1080 --rate 120
}

function hdmiconnected {
  xrandr | grep "^$external" | grep " connected"
}

if hdmiconnected; then
  activatehdmi
else
  deactivatehdmi
fi
