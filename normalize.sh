#!/bin/bash

#
# Find the max volume (in -dB) of each audio file
# Then normalize the max volume of all other files to match the max volume of the highest
# The end result should be that all audio files have a similar max volume level and also sound good 
#

mkdir -p ./stereo
rsync -al ./stereo-original/* ./stereo

HIGHEST_MAX_VOLUME=-99
for f in `find ./stereo-original -type f | grep oga`; do
    MAX_VOLUME=$(ffmpeg -i $f \
	    -af "volumedetect" -vn -sn -dn -f null /dev/null \
         > tmp.txt 2>&1 && \
        grep max_volume tmp.txt \
        | awk -F' ' '{print $5}')

    rm -f tmp.txt

    IS_HIGHER=`echo "$MAX_VOLUME > $HIGHEST_MAX_VOLUME" | bc`
    if [ $IS_HIGHER -eq 1 ]; then
        HIGHEST_MAX_VOLUME=$MAX_VOLUME
    fi
done

for f in `find ./stereo-original -type f | grep oga`; do
    MAX_VOLUME=$(ffmpeg -i $f \
        -af "volumedetect" -vn -sn -dn -f null /dev/null \
         > tmp.txt 2>&1 && \
    grep max_volume tmp.txt \
    | awk -F' ' '{print $5}')

    rm tmp.txt

    VOLUME_DIFF=`echo $HIGHEST_MAX_VOLUME - $MAX_VOLUME | bc`

    base_f=$(basename $f)
    echo "Normalizing $base_f"
    
    ffmpeg -hide_banner -y -i $f \
        -af "volume=${VOLUME_DIFF}dB" \
        -c:a libvorbis ./stereo/$base_f > /dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "ffmpeg command failed.  Exiting..."
        exit 1;
    fi
done
