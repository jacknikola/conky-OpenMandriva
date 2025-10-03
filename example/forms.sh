#!/bin/sh 
cd /home/koneko/Pictures/FORMS || exit && conky -c "./ConSlide/ConSlide.conkyrc" & imv -r -W 810 -H 450 ./forms/current.png & exit
