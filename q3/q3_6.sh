#!/bin/bash

tr '[:upper:]' '[:lower:]' < words.txt | tr -s '[:punct:][:blank:]' '\n' | sort | uniq | awk '{
    split($0, chars, "");
    delete seen;
    for (i = 1; i <= length(chars); i++) {
        if (chars[i] in seen) {
            next;
        }
        seen[chars[i]] = 1;
    }
    print;
}' >> output_3.txt
