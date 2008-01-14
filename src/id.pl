#/usr/bin/perl

while (<>) {

my $FH1;
open($FH1,  ">smesmjnoun_diff.txt");

my $FH2;
open($FH2,  ">smesmjnoun_id.txt");

#my $FH3;
#open($FH3,  ">smesmj_uncertain.txt");

while(<>) {
    if ( m/^(\S+)\t\1$/ ) {
        print $FH2 $_ ; # print good ones to file Y = smesmjnoun_id.txt
#        next ;
#    }
#    if ( m/^\S+\t\S*[cčđšŧžz]/ ||
#         m/^\S*[äæå]\S*\t/   ||
#         m/^[ts]j/           ) {
#        print $FH1 $_ ; # print error pairs to file smesmj_error.txt
#    } elsif ( m/^\S*[cčđšŧžz]\S*\t/ ||
#              m/^\S+\t\S*[äæå]/     ||
#              m/^\S+\t[ts]j/           ) {
#        print $FH2 $_ ; # print certainly good ones to file smesmj_clean.txt
    } else {
        print $FH1 $_ ; # print the rest to file smesmjnoun_diff.txt
    }
}

close($FH1);
close($FH2);
#close($FH3);
}
