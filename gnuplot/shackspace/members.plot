set xdata time
set timefmt "%Y-%m-%d"
set terminal png
set output "membersdelta.png"
plot "membersdelta.dat" using 1:2 with boxes
set output "memberscummulative.png"
plot "memberscummulative.dat" using 1:2 with boxes

