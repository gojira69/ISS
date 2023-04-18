#!/bin/bash
grep -o '\b\w\+\b' words.txt | while read word; do if [[ "$(rev <<< "$word")" == "$word" ]]; then echo "$word"; fi; done >> output_3.txt
