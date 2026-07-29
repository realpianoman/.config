#!/bin/bash

i3-msg "append_layout ~/.config/i3/layouts/projeuler.json"
sleep 0.3

wezterm &
sleep 0.3
wezterm &
sleep 0.3

firefox --new-window "https://projecteuler.net/archives" &
