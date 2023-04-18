#!/bin/bash
tr '[:upper:]' '[:lower:]'  < $1 > $2 
shuf  $2 -o $2

