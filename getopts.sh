#!/bin/bash

whereareyou(){
    whereami
}

sys(){
    neofetch
}

calender(){
    cal
}

listfiles(){
    ls -al
}


while getopts 'abcde:h' OPTION; do
case "$OPTION" in
a)
whereareyou
;;
b)
sys;;
c)
calender
;;
d)
listfiles
;;
e)
evalue="$OPTARG"
cat "$OPTARG"
;;
h)
help
;;
esac
done