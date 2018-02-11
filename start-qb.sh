#!/bin/bash

set -eu

mkdir -p qb45/helper
echo 'C:\QB45\QB.EXE /AH /H /L C:\QB45\QB.QLB' > qb45/helper/qb.bat

dosbox -conf dosbox.conf -c "mount c $PWD" -c 'C:' -c 'SET PATH=C:\QB45\HELPER;%PATH%'
