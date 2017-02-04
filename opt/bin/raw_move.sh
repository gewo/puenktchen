#!/usr/bin/env bash

[ -n "$DEBUG" ] && set -x

EXT=${EXT:-rw2}
DST=${DST:-$HOME/Pictures}
FMT="%Y/%Y%m%d"

src=$1
SRC=${src:-.}

# exiftool -progress '-Directory<CreateDate' -d ${DST}/${FMT} -r -ext $EXT $SRC
exiftool -progress '-Directory<DateTimeOriginal' -d ${DST}/${FMT} -r -ext $EXT $SRC

# mts files only have DateTimeOriginal
