#!/bin/bash
grep -oE '\b[aeiouAEIOU][a-zA-Z]*[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]\b' words.txt >> output_3.txt