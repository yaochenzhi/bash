#!/usr/bin/bash

vars=""

for i in `seq 1 10`
do
  declare "num$i=hello world this is num $i"
  vars+="num$i "
done

for var in $vars
do
  echo ${!var}
done

echo
echo helo world
echo there you are
echo here you are
echo 