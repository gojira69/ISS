#!/bin/bash
find_maximum_vowels(){
    local max_vowel=0
    local file=$1
    while read -r word; do
        vowels=$(echo $word | grep -o -i "[aeiou]" | wc --lines)
        if (( vowels > $max_vowel)); then
            max_vowel=$vowels
        fi
    done < "$file"
    echo $max_vowel
}

count_vowels () {
    local word=$1
    local count=0
    for ((i=0; i<${#word}; i++)); do
        if [[ "${word:i:1}" =~ [aeiouAEIOU] ]]; then
            count=$((count+1))
        fi
    done
    echo $count
}

max_vowels=$(find_maximum_vowels $1)

group_words(){
    local file2=$1
    for ((vowel_count=1; vowel_count<=$max_vowels; vowel_count++)); do
        while read -r word; do
            if [[ $(count_vowels "$word") -eq $vowel_count ]]; then
                echo "$word"
            fi
        done <  "$file2" | sort
        echo
    done
}

group_words $1 > $2
