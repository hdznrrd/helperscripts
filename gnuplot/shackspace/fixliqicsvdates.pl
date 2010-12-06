#!/usr/bin/perl
#
# fixes the totally broken dates from the csv export
#


while($_ = <STDIN>)
{
   @dat = split /\,/;
   @date = split /\//, $dat[2];
   $date[0] += 4;
   $dat[2] = join '-',@date;
   if($dat[3] != 0)
   {
    @date = split /\//, $dat[3];
    $date[0] += 4;
    $dat[3] = join '-',@date;
   }
   print  join(',',@dat[0..3]),"\n";
}
