#!/bin/sh
 
##########################################################################
##               conky slideshow by Christian Brassat                   ##
##		                 a.k.a.					##
##    __         __    __    __           __ __                         ##
##   /\ \      /'__`\ /\ \__/\ \__       /\ \\ \                        ##
##   \ \ \/'\ /\_\L\ \\ \ ,_\ \ ,_\   ___\ \ \\ \    _ __               ##
##    \ \ , < \/_/_\_<_\ \ \/\ \ \/  /'___\ \ \\ \_ /\`'__\             ##
##     \ \ \\`\ /\ \L\ \\ \ \_\ \ \_/\ \__/\ \__ ,__\ \ \/              ##
##      \ \_\ \_\ \____/ \ \__\\ \__\ \____\\/_/\_\_/\ \_\              ##
##       \/_/\/_/\/___/   \/__/ \/__/\/____/   \/_/   \/_/              ##
##                                                                      ##
##                               v 0.0.2                                ##
##                          GNU GPLv3 2009                              ##
##########################################################################
 
##########################################################################
# Settings
##########################################################################
 
directory="./forms/"    # Directory containing the script and the pictures
geometry="810x450"             # Max Geometry of the pictures in the slideshow
 
##########################################################################
# Script (do not change unless you know what you're doing)
##########################################################################
 
# Generates the specified directories
mkdir -p -v $directory/pics 
 
# Converts the image files for conky to use
cp -v * $directory/pics
mogrify -format png -resize $geometry $directory/*
rm -v -f $directory/*.jpg
 
# Creates an array from all pictures
files=($directory/pics/*.*)           	# create an array of the files.
N=${#files[@]}                     	# Number of members in the array
((N=RANDOM%N))
randomfile=${files[$N]}
 
# Sets picture from random file
cp -v $randomfile $directory/current.png
 
# Generates the Script itself
touch $directory/slideshow
echo "#!/bin/sh
 
##########################################################################
##               conky slideshow by Christian Brassat                   ##
##				v 0.0.2					##
##                           aka. k3ttc4r                               ##
##                          GNU GPLv3 2009                              ##
##########################################################################
 
##########################################################################
# Settings
##########################################################################
 
directory='$directory'		    	# Directory containing the script and the pictures
 
##########################################################################
# Script (do not change unless you know what you're doing)
##########################################################################
 
# Creates an array from all pictures
files=(\$directory/pics/*.*)        # create an array of the files.
N=\${#files[@]}                     	# Number of members in the array
((N=RANDOM%N))
randomfile=\${files[\$N]}
 
# Sets picture from random file
cp \$randomfile \$directory/current.png
" > $directory/slideshow
chmod -v +x $directory/slideshow
 
exit
