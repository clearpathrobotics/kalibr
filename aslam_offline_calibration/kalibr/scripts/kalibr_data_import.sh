#!/bin/bash

PWD=`pwd`

folder=$1

if [ ! -d "$folder" ]; then
  echo "Folder $folder does not exist!! Please check and run again!"
  exit
fi

if [ ! -f "$folder/calibrationdata.tar.gz" ]; then
  echo "ROS Calibration tarfile calibrationdata.tar.gz does not exist!!"
  exit
fi

cd $folder

mkdir calibration_params && tar xzf calibrationdata.tar.gz -C ./calibration_params
cd calibration_params/

mkdir cam0
for file in left-*.png; do
  mv "$file" "./cam0/${file/left-/}"
done

mkdir cam1
for file in right-*.png; do
  mv "$file" "./cam1/${file/right-/}"
done

cd $PWD


