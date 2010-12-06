#!/usr/bin/perl
#
# merge several .dat files for gnuplot into one
#


%data={};
while($_=<STDIN>)
{
    chomp();
    next if(/^#/);
    @tok = /(\d+-\d+-\d+)\s(-?\d+(\.\d+)?)/;
    $data{$tok[0]} += $tok[1];
}

foreach(sort keys %data)
{
    print "$_ $data{$_}\n";
}
