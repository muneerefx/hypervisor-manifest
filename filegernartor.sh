#!/bin/bash

# Create 5 build-cwo files (NOT directories)
for i in {1..5}
do
  touch "build-cwo$i"
done

# Create 5 linuximage random files (in current directory)
for i in {1..5}
do
  rand=$(printf "%07d" $((RANDOM%9000000+1000000)))
  touch "linuximage-$rand.wic"
done

# Create only ONE directory: out
mkdir -p out

# Create dummy Android image files inside out/
touch out/boot.img
touch out/system.img
touch out/vendor.img
touch out/userdata.img
touch out/recovery.img

echo "Files and out directory created successfully."
