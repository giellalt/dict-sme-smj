#!/bin/bash

# Script to pair sme and smj after smj analysis
# To be written with variable filenames later

# Usage: Be in words/dicts/smesmj/src/. 
# Write:
# ./smesmjpairs.sh
# The resulting file can then be picked up after a minute or three.

for f1 in `cat inc-smj-ok-oddverbs.txt | cut -f1`
do
	grep $f1 inc-smesmj-alloddverbs.txt >> inc-smesmj-ok-oddverbs.txt
done

# The unknowns:
#for f1 in `cat inc-smj-unknown-oddverbs.txt`
#do
#	grep $f1 inc-smesmj-alloddverbs.txt >> inc-smesmj-unknown-oddverbs.txt
#done
