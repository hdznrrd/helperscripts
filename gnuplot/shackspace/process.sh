#!/bin/sh

cat 101109_liquiditaet_mitgliedsbeitrag_shack.csv | ./liqicsv2memberscsv.pl|./fixliqicsvdates.pl >members.csv
cat members.csv |./deltamemberscsv.pl >membersdelta.dat
cat members.csv |./cummulatememberscsv.pl >memberscummulative.dat
cat *txt |./bookings2dat.pl >bookings.dat
cat *txt |./cummulativebookings2dat.pl >bookingscummulative.dat
./replot.sh
