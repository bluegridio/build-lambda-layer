#!/bin/bash

#Checking system requirements 

if [ -z `which docker 2>/dev/null` ]; then
    echo "Docker is not configured properly. Please check your docker installation: https://docs.docker.com/install/"
    exit 2
fi

if [ $# != 1 ]; then
    echo "Enter the name of one Python library to build!"
    exit 1
fi

echo "Step 1/2: Building AWS Lambda Layer"
build=$(docker build --build-arg package=$1 -t lambda_layer_image . 2>/dev/null)
if [ $? -eq 0 ]; then
    echo " ---> Successfully built"
else
  echo " ---> Error: Could not find a version that satisfies the requirement: $1" 
  exit 1
fi  

echo "Step 2/2: Coping AWS Lambda Layer"
docker container run --rm -d --name $1_container lambda_layer_image

docker cp $1_container:/lambda_layer/$1.zip .

if [ $? -eq 0 ]; then
    echo " ---> Successfully copied to `ls $PWD/$1.zip`"
    rm=$(docker container rm $1_container 2>/dev/null)
else
  echo " ---> Error: Copying failed" 
  exit 1
fi  


