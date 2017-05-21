#!/bin/bash

pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > ~/.packages/.pacman
pacman -Qqm > ~/.packages/.aur

npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > ~/.packages/.npm
