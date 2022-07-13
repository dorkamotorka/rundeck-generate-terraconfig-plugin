#!/bin/bash

#array=( $RD_OPTION_INSTANCEOS )
#array1=( $RD_OPTION_INSTANCETYPE )
#array2=( $RD_OPTION_INSTANCENUM )
#array3=( $RD_OPTION_INSTANCENAME )
#
#if [ ${#array[@]} != ${#array1[@]} ]; then
#    echo "All input lists should be of equal size. Make sure you specified for each instance its type"
#    exit 1
#elif [ ${#array[@]} != ${#array2[@]} ]; then
#    echo "All input lists should be of equal size. Make sure you specified how much instances you want to spawn for each OS"
#    exit 1
#elif [ ${#array[@]} != ${#array3[@]} ]; then
#    echo "All input lists should be of equal size. Make sure you specified a unique name for each OS"
#    exit 1
#else
#    echo "Input parameter OK"
#fi
#
#OUTPUTFILE=/home/ubuntu/terraform-fri-vmgenerator/config.auto.tfvars
#
#echo "configuration = [" > $OUTPUTFILE 
#for i in "${!array[@]}"; do
#    echo "{" >> $OUTPUTFILE
##    echo "name  = ${array3[i]}," >> $OUTPUTFILE
#    echo "image  = ${array[i]}," >> $OUTPUTFILE
#    echo "type  = ${array1[i]}," >> $OUTPUTFILE
#    echo "count  = ${array2[i]}" >> $OUTPUTFILE
#    echo "}," >> $OUTPUTFILE
#done
#echo "]" >> $OUTPUTFILE

cat <<EOF > /home/ubuntu/terraform-fri-vmgenerator/config.auto.tfvars
configuration = [
  {
    "name"  = "vm-ubuntu1804",
    "image" = "images:ubuntu/18.04/cloud",
    "type" = "$2",
    "count" = $1
  },
  {
    "name"  = "vm-ubuntu2004",
   "image" = "images:ubuntu/focal/cloud",
    "type" = "$4",
    "count" = $3
  },
  {
    "name"  = "vm-debian",
    "image" = "images:debian/12/cloud",
    "type" = "$6",
    "count" = $5
  },
  {
    "name"  = "vm-centos",
    "image" = "images:centos/9-Stream/cloud"
    "type" = "$8",
    "count" = $7
}]
EOF
