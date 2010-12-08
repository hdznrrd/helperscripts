#!/usr/bin/perl
#
#


%payed=();
%missing=();

@dates=();
for($i=3;$i<=12;++$i)
{
    push @dates, sprintf("2010-%0.2d-01",$i);
}

while(<STDIN>)
{
    chomp();
    @tok = split /,/;
    $fee = $tok[5]==1?8:20;
    for($i=7;$i<7+10;++$i)
    {
        if($tok[$i] ne '-')
        {
            if($tok[$i] eq 'x')
            {
                print 'x';
                $payed{$dates[$i-7]} += $fee;
            }
            else
            {
                print 'o';
                $missing{$dates[$i-7]} += $fee;
            }
        }
    }
        print "\n";
}


$union = {map{$_ => 1}(keys %payed,keys %missing)};


foreach(sort keys %{$union})
{
    print "$_ ",$payed{$_}||0," ", $missing{$_}||0," ",$payed{$_}+$missing{$_},"\n";
}
