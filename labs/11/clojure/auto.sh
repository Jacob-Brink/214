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
	        EQUATION=""
        	for j in `seq 1 3`; do

		   # on first loop do non threaded command
		   if (( i == 0 )); then
		       RAWINPUT=$($ncommand ${file})
		   else
 RAWINPUT=$($bcommand ${file} $i)
		   fi

		   #do adding by concatenation cuz its a mess otherwise
		   num=$(echo $(grep -o 'took[ ]*\(\([0-9]*.[0-9][0-9]*\)\|\([0-9][0-9]*\)\)' <<< $RAWINPUT) | sed -e 's/took[ ]*//')
		   if (( j == 1 )); then
		       EQUATION='('num
		   else
		       EQUATION="${EQUATION}+${num}"		   
		   fi

		   #update progress bar
		   # progress_bar=$(echo $progress_bar | sed -e 's/\(:-\)\|\(=-\)/==/')
		   # echo -ne "${progress_bar}\r"
		   ((progress++))
		   pbar  $progress
	       done

	  #actually do maths
	  EQUATION="${EQUATION})/3"
	  avg=$(bc <<< "scale=9; ${EQUATION}")

	  CSV_ROW="${CSV_ROW} \t ${avg}"
        done
	CSV_ROW="${CSV_ROW}"
	echo -e $CSV_ROW >> results.txt
    fi
done

echo -e "\n\n"
