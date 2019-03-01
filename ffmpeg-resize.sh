#!/bin/sh
#

MYNAME=`basename $0`

CMDNAME="ffmpeg"
#OUT_OPT="-vf scale=640:-1"
OUT_OPT="-vf scale=960:-1"
#OUT_OPT="-vf scale=1280:-1"

#OUT_OPT="$OUT_OPT -vf format=yuv420p -strict -2 -movflags +faststart -crf 18 -preset veryfast"
OUT_OPT="$OUT_OPT -vf format=yuv420p -strict -2 -movflags +faststart -preset veryfast"

usage () {
    echo ""
    echo "	usage: ${MYNAME} infile outfile"
    echo ""
}


INFILE=$1
if [ "X$INFILE" = "X" ]; then
    usage
    exit 1
fi
if [ ! -f $INFILE ]; then
    echo $INFILE: no such file
    exit 2
fi

shift
OUTFILE=$1
if [ "X$OUTFILE" = "X" ]; then
    usage
    exit 1
fi

CMDLINE="${CMDNAME} -i ${INFILE} ${OUT_OPT} ${OUTFILE}"
echo $CMDLINE
exec $CMDLINE
