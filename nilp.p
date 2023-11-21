# Set the output to a png file
set terminal pngcairo size 640,480
# The file we'll write to
set output 'png/nilp.png'
# plot the graphic
plot 'fort.10' u 1: 2 w l t 'analytic', 'fort.10' u 1:3 w p t 'numeric'
