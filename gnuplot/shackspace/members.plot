set xdata time
set timefmt "%Y-%m-%d"
set terminal png
set xzeroaxis lt -1



set output "membersdelta.png"
plot "membersdelta.dat" using 1:2


set output "memberscummulative.png"
plot "memberscummulative.dat" using 1:2 with steps

