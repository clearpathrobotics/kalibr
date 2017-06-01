#!/bin/bash

FOLDER=$1

if [ ! -d "$FOLDER" ]; then
  echo "Folder $FOLDER does not exist!! Please check and run again!"
  exit
fi

echo "Folder with tar file : "
echo $FOLDER

rosrun kalibr kalibr_data_import.sh $FOLDER

echo "Imported data from tar file!"

rosrun kalibr kalibr_bagcreater --folder $FOLDER/calibration_params \
                                --output-bag $FOLDER/kalibr_data.bag

echo "Created Kalibr input image bag file!"

KALIBR_LOCATION=`rospack find kalibr`

echo "Location of Kalibr package : "
echo $KALIBR_LOCATION

echo "Now Calibrating!!"
echo
echo

rosrun kalibr kalibr_calibrate_cameras  --models pinhole-radtan pinhole-radtan \
                                        --target $KALIBR_LOCATION/config/target.yaml \
                                        --bag $FOLDER/kalibr_data.bag \
                                        --topics /cam0/image_raw /cam1/image_raw \
                                        --output-folder $FOLDER/calibration_params

echo "Done calibration!!"

rosrun kalibr rename_namespaces.sh $FOLDER/calibration_params/camchain.yaml

echo "Ready to move the final calibration files to the right location!!"
