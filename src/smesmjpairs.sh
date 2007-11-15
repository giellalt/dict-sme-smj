#!/bin/bash

# Script to pair sme and smj after smj analysis
# This file is called from the makefile.

echo "LEXICON Root" > ../bin/smesmj.lexc

grep -v "\#" smesmj.txt | grep [a-z] | tr -d '7' | cut -f1 > ../tmp/smesmj-sme

grep -v "\#" smesmj.txt | grep [a-z] | cut -f2 > ../tmp/smesmj-smj

paste -d":" ../tmp/smesmj-sme ../tmp/smesmj-smj | sed 's/$/ \# ;/g' >> ../bin/smesmj.lexc



# Old version, obsolete:
# # Usage: Be in words/dicts/smesmj/src/. 
# # Write:
# # ./smesmjpairs.sh
# # The resulting file can then be picked up after a minute or three.
# 
# for f1 in `cat inc-smj-ok-oddverbs.txt | cut -f1`
# do
# 	grep $f1 inc-smesmj-alloddverbs.txt >> inc-smesmj-ok-oddverbs.txt
# done
# 
# # The unknowns:
# #for f1 in `cat inc-smj-unknown-oddverbs.txt`
# #do
# #	grep $f1 inc-smesmj-alloddverbs.txt >> inc-smesmj-unknown-oddverbs.txt
# #done
