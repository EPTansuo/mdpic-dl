#!/bin/bash


#
if [ $# == 0 ]
then 
	echo "Please intput a markdown file!"
	exit 255
fi
input="$1"

if [ $# == 2 ]
then 
	output="$2"
else
	output="$1"
fi


#args=`grep  '.[*]*(*)' $input`
args=`grep -E --text '\!\[.*\]\(.+\)' $input`

if [ $input != $output ]
then
	cp $input $output
fi



mkdir "${output}.files"

i=0
for arg in $args
do
	tmp=${arg%)*}
	url=${tmp#*(}
	echo Downloading file : $url 
	png="`echo $url | grep -i .png`" 
	jpg="`echo $url | grep -i .jpg`" 
	if [  -n $png ]
	then 
		curl -o "${output}.files/${i}.png"  $url
		sed -i "s#${url}#./${output}.files/${i}.png#g" "$output"

		echo sed -i "s#${url}#./${output}.files/${i}.png#g" "$output"
	elif [ -n $jpg ] 
	then 
		curl -o "${output}.files/${i}.jpg"  $url
		sed -i "s#${url}#./${output}.files/${i}.jpg#g" "$output"
	else	
		cd "${output}.files"
		curl -O $url
		cd .. 
	fi
	let i++
done














