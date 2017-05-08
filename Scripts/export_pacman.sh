pacman -Qqe | grep -Fvx "$(pacman -Qqm)" > ~/.pacman.pkgs
