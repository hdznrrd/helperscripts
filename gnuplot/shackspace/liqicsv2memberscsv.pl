#!/usr/bin/perl
#
# extract the first 4 columns froma csv export of the liquidity analysis excel spreadsheet
# this contains: memberid, fee (1=8, 2=20EUR), join date, quit date
#


while($_ = <STDIN>)
{
   @dat = split /\,/;
   print  join(',',@dat[0..3]),"\n";
}
