#!/bin/bash
# xrandr wrapper; switch between single/extended/cloned desktop;
CONFIGURED_DEVICES=($(xrandr|egrep -o '[[:alnum:]]+ [dis]{0,3}connected [0-9]{3,}x[0-9]{3,}'|awk '{echo $1}'))
CONNECTED_DEVICES=($(xrandr|grep ' connected '|awk '{echo $1}'))
PRIMARY=${CONFIGURED_DEVICES[1]}
RES_PRIMARY=$(xrandr|grep ${PRIMARY} -A1|tail -n1|egrep -o '[0-9]{3,}x[0-9]{3,}')

if [ ${#CONFIGURED_DEVICES[*]} -eq 1 ]; then
  [ ${#CONNECTED_DEVICES[*]} -lt 2 ] && { echo 'only one display conencted';exit; }
  CUR_MODE='single'
  EXTERNAL=${CONNECTED_DEVICES[2]}
elif [ ${#CONFIGURED_DEVICES[*]} -eq 2 ]; then
  CUR_MODE='extended'
  EXTERNAL=${CONFIGURED_DEVICES[2]}
else
  echo 'something weird happened...'
  exit;
fi

RES_EXTERNAL=$(xrandr|grep ${EXTERNAL} -A1|tail -n1|egrep -o '[0-9]{3,}x[0-9]{3,}')
POS_EXTERNAL=$(echo "${RES_PRIMARY}"|egrep -o '[0-9]{3,}x')0

if [[ -z "$1" && ${CUR_MODE} == 'extended' ]]; then
  # set only primary
  xrandr --output ${EXTERNAL} --off --output ${PRIMARY} --mode "${RES_PRIMARY}" --pos 0x0 --rotate normal
elif [[ -z "$1" && ${CUR_MODE} == 'single' ]]; then
  # set extended desktop
  xrandr --output ${PRIMARY} --mode "${RES_PRIMARY}" --pos 0x0 --rotate normal --output "${EXTERNAL}" --mode "${RES_EXTERNAL}" --pos "${POS_EXTERNAL}" --rotate normal
elif [[ -n "$1" && "$1" == 'clone' ]]; then
  # clone displays
  xrandr --output ${PRIMARY} --mode 1024x768 --output "${EXTERNAL}" --mode 1024x768 --same-as ${PRIMARY}
else
  echo "$0 [clone]"
fi
