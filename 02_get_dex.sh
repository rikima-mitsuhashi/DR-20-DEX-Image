#/bin/sh

cd malware
mv 3de513a148400b457dd8d8fa9238804db3ec031a0b526d4a04b77e5112aa2dcf 3de513a148400b457dd8d8fa9238804db3ec031a0b526d4a04b77e5112aa2dcf.dex
mv 3de513a148400b457dd8d8fa9238804db3ec031a0b526d4a04b77e5112aa2dcf.dex ../dex

for f in *
do
mv "$f" "$f.zip"
mkdir $f
mv $f.zip $f
cd $f
unzip $f.zip classes.dex
mv classes.dex $f.dex
mv $f.dex	 ../../dex 
cd ..
rm -rf $f
done

