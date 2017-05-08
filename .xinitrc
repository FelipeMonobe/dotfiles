/usr/lib/xscreensaver/glmatrix -root &
setxkbmap -model abnt2 -layout br -variant abnt2 &
xrdb ~/.Xresources &
xsetroot -cursor_name left_ptr &
xscreensaver -no-splash &

exec xmonad
