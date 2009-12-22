#!/bin/bash

# Script to pair sme and smj after smj analysis
# This file is called from the makefile smesmj/src/Makefile.

echo "LEXICON Root" > ../bin/smesmj.lexc

grep -v "\#" ../src/*.csv | grep [a-z] | tr -d '7' | cut -f1 > ../tmp/smesmj-sme

grep -v "\#"  ../src/*.csv | grep [a-z] | cut -f2 > ../tmp/smesmj-smj

paste -d":" ../tmp/smesmj-sme ../tmp/smesmj-smj | sed 's/$/ \# ;/g' | cut -d":" -f2- >> ../bin/smesmj.lexc
