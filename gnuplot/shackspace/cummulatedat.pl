#!/usr/bin/perl
#
# accumulate several .dat files for gnuplot into one
#


%data={};
while($_=<STDIN>)
{
    chomp();
    next if(/^#/);
    @tok = /(\d+-\d+-\d+)\s(-?\d+(\.\d+)?)/;
    $data{$tok[0]} += $tok[1];
}


$sum=0;
foreach(sort keys %data)
{
    $sum += $data{$_};
    print "$_ $sum\n";
}
