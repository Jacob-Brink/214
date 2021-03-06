#!/bin/bash

echo -e "Enter Non Thread Command: \c"
read ncommand
echo -e "Enter Thread Command: \c "
read bcommand
echo -e "Enter Directory of Numbers: \c"
read ndir

echo -e "FILE \t 0 \t 1 \t 2 \t 3 \t 4 \t 5\n" > results.txt

TOTAL=18

function charseq {
    NUM=$1
    CHAR=$2
    if (( NUM > 0 )); then
	printf "${CHAR}%.0s" $(seq 1 $NUM)
    fi
}

function pbar {
    printf '\r['
    PROGRESS=$1
    LEFT=`expr $TOTAL - $1`
    charseq $PROGRESS =
    charseq $LEFT "*"
    # printf '=%.0s' $(seq 1 $1)
    # 
    # if (( LEFT > 0 )); then
    # 	printf '*%.0s' $(seq 1 $LEFT)
    # fi
    printf ']'
}

for file in "$ndir"/*; do
    if [ -f "$file" ]; then
        CSV_ROW="${file}"
        echo -e "\n\n${file}..."
	
	progress=0
	pbar 0
        for i in `seq 0 5`; do
	        RESULTS=()
        	for j in `seq 0 2`; do

		   # on first loop do non threaded command
		   if (( i == 0 )); then
		       RAWINPUT=$($ncommand ${file})
		   else
 RAWINPUT=$($bcommand ${file} $i)
		   fi

		   #do adding by concatenation cuz its a mess otherwise
		   num=$(echo $(grep -o 'took[ ]*\(\([0-9]*.[0-9][0-9]*\)\|\([0-9][0-9]*\)\)' <<< $RAWINPUT) | sed -e 's/took[ ]*//')
		   RESULTS[$j]=$num

		   #update progress bar
		   ((progress++))
		   pbar  $progress
	       done
		#echo ${RESULTS[*]}
		#sort numbers and get median
		IFS=$'\n' sorted=($(sort -g <<<"${RESULTS[*]}"))
		unset IFS
		MEDIAN=${RESULTS[1]}
		CSV_ROW="${CSV_ROW} \t ${MEDIAN}"
        done
	echo -e $CSV_ROW >> results.txt
    fi
done

echo -e "\n\n"
