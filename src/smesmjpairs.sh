#!/bin/bash

# Script to pair sme and smj after smj analysis
# To be written with variable filenames later



for f1 in `cat inc-smj-unknown-oddverbs.txt`
do
	grep $f1 inc-smesmj-alloddverbs.txt >> inc-smesme-unknown-oddverbs.txt
done
