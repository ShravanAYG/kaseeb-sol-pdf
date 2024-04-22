#!/bin/bash
echo KASEEB solutions website to PDF
echo Enter link
read link
var=100
mkdir tmpkaseeb
cd tmpkaseeb
for i in $(curl --silent $link | grep "<img class" | awk -Fsrc= '{printf $2 "\n"}' | awk -F\" '{printf $2 "\n"}'| awk -F.png '{printf $1 ".png \n"}')
do
    wget $i -O $var.png
    ((var++))
    sleep 0.1
done
rm *log*
ls > ../tmp.log
convert * $(echo $link | rev | awk -F/ '{printf $2}' | rev).pdf
cp *.pdf ~/Downloads/
cd ..
rm -r tmpkaseeb
echo Saved to ~/Downloads/$(echo $link | rev | awk -F/ '{printf $2}' | rev).pdf
xdg-open ~/Downloads/$(echo $link | rev | awk -F/ '{printf $2}' | rev).pdf
