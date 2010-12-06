#!/usr/bin/perl
#
#
# convert pasted txt from pdf to csv



#15.04.2010 53/3 shack Snack-Bar              Sven Schoengarth, Moritz Fren-      16,00

%data=();
while($_=<STDIN>)
{
    chomp();
    @tok = /^(\d+).(\d+).(\d+).+?(-?\d+,\d+)/;
    $date = "$tok[2]-$tok[1]-$tok[0]";
    $tok[3] =~ s/,/./g;
    $data{$date} += $tok[3];
}


$sum = 0;
foreach(sort keys %data)
{
    $sum += $data{$_};
    print "$_ $sum\n";
}
