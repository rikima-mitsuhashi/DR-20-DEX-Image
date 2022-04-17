#!/bin/sh


for file in `\find . -maxdepth 1 -type f`; do

 SIZE=`wc -c $file | awk '{print $1}'`

 COL=0

 if   [      0 -le "$SIZE" ] && [ "$SIZE" -lt   10240 ]; then COL=32
 elif [  10240 -le "$SIZE" ] && [ "$SIZE" -lt   30720 ]; then COL=64
 elif [  30720 -le "$SIZE" ] && [ "$SIZE" -lt   61440 ]; then COL=128
 elif [  61440 -le "$SIZE" ] && [ "$SIZE" -lt  102400 ]; then COL=256
 elif [ 102400 -le "$SIZE" ] && [ "$SIZE" -lt  204800 ]; then COL=384
 elif [ 204800 -le "$SIZE" ] && [ "$SIZE" -lt  512000 ]; then COL=512
 elif [ 512000 -le "$SIZE" ] && [ "$SIZE" -lt 1024000 ]; then COL=768
 else COL=1024 
 fi


# The last line of the image is cut off.

 ROW=$((SIZE/COL))


# Zero-padding option: the remainder of the last line is filled with zero.
# If you want to use the option, please uncomment out the following.

# TEST=$((SIZE%COL))
# TEMP=$((SIZE/COL))
# ONE=1
# if   [ $TEST -eq 0 ]; then ROW=$((SIZE/COL))
# else ROW=$((TEMP+ONE)); cat ../zero.bin >> $file
# fi


 echo $file - pgm
 sed -i -e '1 i\P5 '$COL' '$ROW' 255 ' $file
 pnmtopng $file > $file.png
 rm $file

done



cd ..

