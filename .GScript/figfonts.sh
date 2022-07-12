#!/bin/sh
# https://gist.github.com/mkottman/6763446

figlist | awk '/fonts/ {f=1;next} /control/ {f=0} f {print}' | while read font; do
  echo "=== $font ==="
  echo $font | figlet -f $font
done | less


























