#!/bin/bash
read -p "Enter Name: " name
read -p "Enter DOB: " month year
month=$(echo $((10#$month)))
months=$((    12 * ((2022-year))   ))
ans=$((   months +  ((12-month))  ))
res=$((ans+3))
echo "Hello $name, your age is $res months"