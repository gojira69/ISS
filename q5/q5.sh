#!/bin/bash

# Recursive function to print the contents of a directory
print_dir() {
    local dir=$1
    local depth=$2
    local sort_flag=$3
    local depth_limit=$4
    local all_files_flag=$5
    local ascending_flag=$6
    local descending_flag=$7

    # Check if depth limit is reached
    if [ $depth -gt $depth_limit ]; then
        return
    fi

    # Print directory name
    echo -n "|"
    for ((i=0; i<depth; i++)); do
        echo -ne "  "
    done
    echo -ne "-- "
    echo "$(basename "$dir")/"

    # Sort files and directories by name or size
    if [ "$sort_flag" == "-s" ]; then
        sorted_items=$(du -s "$dir"/* | sort -n | awk '{print $2}')
    elif [ "$ascending_flag" == "-a" ]; then
        sorted_items=$(ls -1 "$dir" | sort $sort_flag)
    elif [ "$descending_flag" == "-d" ]; then
        sorted_items=$(ls -1 "$dir" | sort $sort_flag -r)
    else
        sorted_items=$(ls "$dir")
    fi

    # Print files and directories
    for item in $sorted_items; do
        if [ -d "$item" ]; then
            if [ "$item" == "." ] || [ "$item" == ".." ]; then
                continue
            fi
            print_dir "$item" $((depth+1)) $sort_flag $depth_limit $all_files_flag $ascending_flag $descending_flag
        elif [ -f "$item" ]; then
            if [ "${item:0:1}" == "." ] && [ "$all_files_flag" != "-A" ]; then
                continue
            fi
            echo -n "|"
            for ((i=0; i<=depth; i++)); do
                echo -ne "  "
            done
            echo -ne "-- "
            echo "$(basename "$item")"
        fi
    done
}

# Parse command line arguments
dir=$1
depth_limit=999
all_files_flag=""
sort_flag=""
ascending_flag=""
descending_flag=""
while getopts "AD:a:d:s:" opt; do
    case $opt in
        A)
            all_files_flag="-A"
            ;;
        D)
            if ! [[ "$OPTARG" =~ ^[0-9]+$ ]]; then
                echo "Invalid depth!"
                exit 1
            fi
            depth_limit=$OPTARG
            ;;
        a)
            sort_flag="-n"
            ascending_flag="-a"
            ;;
        d)
            sort_flag="-r"
            descending_flag="-d"
            ;;
        s)
            sort_flag="-s"
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Print directory contents
if [ -d "$dir" ]; then
    print_dir "$dir" 0 $sort_flag $depth_limit $all_files_flag $ascending_flag $descending_flag
elif [ -f "$dir" ]; then
    echo "$dir"
else
    echo "Error: $dir is not a valid file or directory."
fi
