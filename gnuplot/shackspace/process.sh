#!/bin/sh

cat 101109_liquiditaet_mitgliedsbeitrag_shack.csv | ./liqicsv2memberscsv.pl|./fixliqicsvdates.pl >members.csv
cat members.csv |./deltamemberscsv.pl >membersdelta.dat
cat members.csv |./cummulativememberscsv.pl >memberscummulative.dat
./replot.sh
