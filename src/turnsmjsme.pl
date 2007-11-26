#!/usr/bin/perl

use utf8;

# quasi:
# in the smesmj.txt doc, the intended format is
# sme<tab>smj<tab>POS
# Unfortunately, certain lines are mixed:
# smj<tab>sme<tab>POS
# and it happened a long time ago
# goal:
# Take all the words with sme letters/phonotax in the second column
# or all wds with smj in the first, and move those line to
# another doc
# Turn those columns
# add to original, sort and uniq 
# Almost all the wrong lines are duplicates of correct ons, but
# that in itself is not a problem, it will be fixed via uniq
# the prop should be removed, they are probably not wrong at all

# sme-specific:
# čđŋšŧž // Vow + i

# smj-specific:
# æäå // tj, sj, Vow + j

my $FH1;
open($FH1,  ">smesmj_error.txt");

my $FH2;
open($FH2,  ">smesmj_clean.txt");

my $FH3;
open($FH3,  ">smesmj_uncertain.txt");

while(<>) {
    if ( m/^(\S+)\t\1\t/ ) {
        print $FH2 $_ ; # print good ones to file Y = smesmj_clean.txt
        next ;
    }
    if ( m/^\S+\t\S*[cčđšŧžz]/ ||
         m/^\S*[äæå]\S*\t/   ||
         m/^[ts]j/           ) {
        print $FH3 $_ ; # print error pairs to file smesmj_error.txt
    } elsif ( m/^\S*[cčđšŧžz]\S*\t/ ||
              m/^\S+\t\S*[äæå]/     ||
              m/^\S+\t[ts]j/           ) {
        print $FH2 $_ ; # print certainly good ones to file smesmj_clean.txt
    } else {
        print $FH1 $_ ; # print potentially bad ones to file smesmj_dirty.txt
    }
}

close($FH1);
close($FH2);
close($FH3);


# a. snu regex ovafor og printe sikre
# b . printe a<tab>a<tab>
# asme->ok
# bsme->feil
# asmj->feil
# bsmj->ok

