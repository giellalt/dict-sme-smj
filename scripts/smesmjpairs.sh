#!/bin/bash

# Script to pair sme and smj after smj analysis
# This file is called from the makefile.

echo "LEXICON Root" > ../bin/smesmj.lexc

grep -v "\#" smesmj.txt | grep [a-z] | tr -d '7' | cut -f1 > ../tmp/smesmj-sme

grep -v "\#" smesmj.txt | grep [a-z] | cut -f2 > ../tmp/smesmj-smj

paste -d":" ../tmp/smesmj-sme ../tmp/smesmj-smj | sed 's/$/ \# ;/g' >> ../bin/smesmj.lexc



