#!/bin/bash

# Create build folders
for i in {1..5}
do
  dir="build-cwo$i"
  mkdir -p "$dir"

  # Create 5 build-cwo files
  for j in {1..5}
  do
    touch "$dir/build-cwo$j"
  done

  # Create 5 linuximage random files
  for k in {1..5}
  do
    rand=$(printf "%07d" $((RANDOM%9000000+1000000)))
    touch "$dir/linuximage-$rand.wic"
  done
done


# Create out directory
mkdir -p out

# Create dummy Android image files
touch out/boot.img
touch out/system.img
touch out/vendor.img
touch out/userdata.img
touch out/recovery.img

echo "Structure created successfully."
