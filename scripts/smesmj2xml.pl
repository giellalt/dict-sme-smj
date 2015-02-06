#!/usr/bin/perl -w
# -*- mode: cperl; indent-tabs-mode: nil; cperl-indent-level: 4; -*-
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

use strict;
use warnings;
use Encode;
use encoding::warnings;
use utf8;
use v5.14;
use autodie;
use open qw( :encoding(UTF-8) :std );

binmode( STDIN, ':utf8' );
binmode( STDOUT, ':utf8' );
binmode( STDERR, ':utf8' );

$ENV{'PERL_UNICODE'}="S";


# File and directory variables:
my $dict_file = "../bin/smesmj.xml";

open (my $dict_h, ">", $dict_file) or die "Can't open $dict_file: $!\n";
binmode($dict_h, ":encoding(UTF-8)");

print $dict_h "<r id=\"smesmj\" xml:lang=\"sme\">\n";

while ( my $line = <> ) {
	chomp $line;
	my ($sme,
        $smj,
        $POS)
      = split /\t/, $line ;
    #    print "Lina er: $line\n";
    #    print "Lemma er: $Lemma\n";
    #    $Lemma =~ s/"\W?(\w)/$1/; # rens $Lemma for " og ^L
	my @smj = split /,/, $smj;
    my $tg = join "\n", map {"            <t pos=\"$POS\">$_</t>"} @smj;
    print $dict_h <<EOS
   <e>
      <lg>
         <l pos=\"$POS\">$sme</l>
      </lg>
      <mg>
         <tg>
$tg
         </tg>
      </mg>
   </e>
EOS
}

print $dict_h "</r>\n";
close $dict_h;
