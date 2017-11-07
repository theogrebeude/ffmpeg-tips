#!/bin/bash
process (){
	localpath="$(pwd)"
	local space=""
	reg=".*\/([^\/]+)"
	if [ "$1" ]
	then
		localpath=$1
	fi
	if [ "$2" ]
	then
		space=$space$2
	fi
	if [ "$3" ]
	then
		if [[ $localpath =~ $reg ]]; then debut="┣━ "${BASH_REMATCH[1]}; fi
	else
		if [[ $localpath =~ $reg ]]; then debut="┗━ "${BASH_REMATCH[1]}; fi
	fi
	echo "$space $debut($(du -hs $localpath| cut -f1))::$(find $localpath -maxdepth 1 -type f |sort | uniq -c| wc -l) files"
	subdircount=`find $localpath -maxdepth 1 -type d | wc -l`
	if [ $subdircount -ne 1 ]
	then
		local count="$((subdircount-1))"
			#echo "contient $count sous dossier"
		subdir=(`find $localpath -maxdepth 1 -type d |sort `)
		for i in "${subdir[@]}"
		do :
			if [ $i != $localpath ]
			then
				count=$((count-1))
				if [ $count != 0 ]
				then
					process $i "$space " 1
				else
					process $i "$space "
				fi
				#echo "-----------"
			fi
		done
	fi
}
if [ "$1" ]
then
process $1
else
process
fi
