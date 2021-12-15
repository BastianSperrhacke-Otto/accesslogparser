#!/bin/bash
s3Bucket=$1
AWS_PROFILE=$2
wordir="./"
clear
if [[ -z "$s3Bucket" ]];
then
    echo "please provide a s3Bucket uri."
    exit 16
fi
if [[ -z "$2" ]];
then
    echo "please provide an AWS_PROFILE."
    exit 16
fi
if [[ -z "$3" ]];
then
    echo "please provide an string you want to find (e.g. 'jndi')."
    exit 16
fi
AWS_PROFILE=$AWS_PROFILE aws s3 sync $s3Bucket $wordir
find . -type f -name '*.gz' |sort |uniq | while IFS= read -r filename; do
	echo "unzip for $filename"
	gzip -d $filename
done
echo "searching for $3"
find ./ -type f -name *.log -exec grep -Hni "$3" {} \;
exit 0