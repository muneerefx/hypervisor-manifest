#!/bin/bash

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
