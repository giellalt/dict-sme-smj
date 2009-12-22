#!/usr/bin/perl -w
#
# kvasikode
#
# Felt:
# # smesmj (denne berre for referanse)
# #"Lemma;POS;trans;stamme1;stamme2;eks;syn1;syn2"
# 
# Les inn felta
# sme<tab>smj<tab>POS
# Putt relevante felt inn i relevante stader i xml-strukturen
# 
#   <entry>
#     <lemma pos="POS">Lemma</lemma>
#     <mgr>
#       <trgr>
#         <trans pos="POS">trans</trans>
#       </trgr>
#     </mgr>
#  </entry>      

########################################################

use encoding 'utf-8';

# File and directory variables:
$SRCDIR = ".";

$CSVF = $SRCDIR . "/smesmj.txt";
#$CSVF = $SRCDIR . "/test.csv";
$DICT = $SRCDIR . "/../bin/smesmj.xml";

open CSVF or die "Can't find file $CSVF: $!\n";
open DICT, ">$DICT" or die "Can't open file $DICT: $!\n";

print DICT "<dictionary >\n";

$line = <CSVF> ;

while ( $line = <CSVF> ) {
	chomp $line;
	($sme,
	 $smj,
     $POS)
	   = split /\t/, $line ;
#    print "Lina er: $line\n";
#    print "Lemma er: $Lemma\n";
#    $Lemma =~ s/"\W?(\w)/$1/; # rens $Lemma for " og ^L
	@smj = split /,/, $smj;
    print DICT "\t<entry>\n";
    print DICT "\t  <lemma POS=\"$POS\">$sme</lemma>\n";
    print DICT "\t  <mgr>\n";
    print DICT "\t    <trgr>\n";
    foreach ( @smj ) {
    print DICT "\t      <trans decl=\"$POS\">$_</trans>\n";
    }
    print DICT "\t    </trgr>\n";
    print DICT "\t  </mgr>\n";
    print DICT "\t</entry>\n";
}

print DICT "</dictionary>\n";
close DICT;
close CSVF;

