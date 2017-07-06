#!/bin/bash

file=$1

sed -i -e "s/cam0/left/g" $file
sed -i -e "s/cam1/right/g" $file
