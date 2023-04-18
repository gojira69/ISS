#!/bin/bash
grep -E '\w{3,}' $1 >> $2
