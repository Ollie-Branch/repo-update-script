#!/bin/sh

SCRIPT_DIR=$PWD
DIRS_TO_ITER=$(ls -al | awk '{print $9}' | sed 1,3d | sed '/update.sh/d')
NUM_DIRS_TO_ITER=$(printf '%s\n' "$DIRS_TO_ITER" | wc -l)

echo list of dirs to iterate = $DIRS_TO_ITER
echo number of dirs to iterate = $NUM_DIRS_TO_ITER
echo current working directory = $SCRIPT_DIR

CURRENT_FOLDER=$(echo $DIRS_TO_ITER | awk '{print $1}')
CURRENT_DIR=1

echo The first folder is "$CURRENT_FOLDER"

for i in $DIRS_TO_ITER
do
	CURRENT_DIR=$i
	echo $CURRENT_DIR
	cd $CURRENT_DIR
	git pull
	cd ..
done
