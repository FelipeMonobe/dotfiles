#!/bin/bash

cat /proc$(ps aux | grep [x]monad | cut -d "" -f4)/fd/* > /dev/null
