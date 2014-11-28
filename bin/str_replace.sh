#!/bin/bash


from=$1
to=$2


if [ -z $from ]
then
  echo "Please provide string to look for!"
  echo "Usage: str_replace.sh search replace"
  exit 1
fi

if [ -z $to ]
then
echo "Please provide string to replace!"
  echo "Usage: str_replace.sh search replace"
  exit 1
fi


for file in $(find . -type f); do
  sed "s/$from/$to/g" $file > sed_dummy.txt;
  mv sed_dummy.txt $file
  rm sed_dummy*.txt > /dev/null 2> /dev/null
done;