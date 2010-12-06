#!/usr/bin/perl
#
# generate cummulative member count based on list of members and join date
#


%bydate=();
%fees=();

$dump = <STDIN>;
while($_ = <STDIN>)
{
    chomp();
    @dat = split /\,/;
    
    $bydate{$dat[2]} += 1;
    $bydate{$dat[3]} -= 1 if($dat[3] != 0); 
    $fees{$dat[2]} += $dat[1]==1?8:20;
    $fees{$dat[3]} -= ($dat[1]==1?8:20) if($dat[3] != 0); 
}


$members = 0;
$income = 0;
print "#\tmember count\tmembership fees\n";

foreach(sort keys %bydate)
{
    $members += $bydate{$_};
    $income += $fees{$_};
    print "$_ $members $income\n";
}
