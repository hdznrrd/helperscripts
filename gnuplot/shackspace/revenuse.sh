#!/bin/sh
grep -v " -" bookings.dat |cut -b 12-|perl -e '$sum=0;while(<>){$sum+=$_;}print $sum'
echo
