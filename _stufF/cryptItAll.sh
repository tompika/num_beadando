#!/bin/bash


for f in $(find _problemS/ | grep .cc) 
do
#  echo  ${f}
  cat ${f} | ./_stufF/cryptIt ${1} ${2} > _otmp
  mv _otmp ${f}
#  cat _otmp | ./_stufF/cryptIt ${1} ${2}
done


if [ -e ".ced" ]; 
then
  rm .ced
else
  touch .ced
fi


