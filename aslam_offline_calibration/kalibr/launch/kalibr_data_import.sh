folder=$1
string=$2
camera_number=$3
cd $folder
mkdir $camera_number
for file in $string-*.png; do
  mv "$file" "./$camera_number/${file/$string-/}"
done
cd -
