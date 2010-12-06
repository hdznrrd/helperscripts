#!/usr/bin/perl
#
# generate cummulative member count based on list of members and join date
#


%bydate=();

$dump = <STDIN>;
while($_ = <STDIN>)
{
    chomp();
    @dat = split /\,/;
    
    $bydate{$dat[2]} += 1;
    $bydate{$dat[3]} -= 1 if($dat[3] != 0); 
}


$members = 0;
foreach(sort keys %bydate)
{
    $members += $bydate{$_};
    print "$_ $members\n";
}
