#!/bin/bash

i3-msg "append_layout ~/.config/i3/layouts/programming.json"
sleep 0.3

wezterm &
sleep 0.3
wezterm &
sleep 0.3

firefox --new-window &
