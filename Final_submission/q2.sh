#!/bin/bash


CONTACTS_FILE="contacts.csv"

while getopts "C:f:l:n:o:k:c:v:ad" opt; do
    case $opt in
        C)
            COMMAND="$OPTARG"
        ;;
        f)
            FIRST_NAME="$OPTARG"
        ;;
        l)
            LAST_NAME="$OPTARG"
        ;;
        n)
            MOBILE="$OPTARG"
        ;;
        o)
            OFFICE="$OPTARG"
        ;;
        k)
            search_name="$OPTARG"
        ;;
        c)
            COLUMN="$OPTARG"
        ;;
        v)
            VALUE="$OPTARG"
        ;;
        a)
            SORT_ASCENDING=true
        ;;
        d)
            SORT_DESCENDING=true
        ;;
    esac
done

function insert_contact {
    
    if grep -q "^$FIRST_NAME," $CONTACTS_FILE; then
        echo "Unable to insert contact!"
    else
        
        echo "$FIRST_NAME,$LAST_NAME,$MOBILE,$OFFICE" >> $CONTACTS_FILE
    fi
}

# function edit_contact {
    
#     sed -i "/^  search_name,/c $FIRST_NAME,$LAST_NAME,$MOBILE,$OFFICE" $CONTACTS_FILE
# }

function edit_contact {
    sed -i "/^$search_name/c$FIRST_NAME,$LAST_NAME,$MOBILE,$OFFICE" $CONTACTS_FILE
}


function display_all_contacts {
    
    if [[ $SORT_ASCENDING ]]; then
        sort -t, -k1 $CONTACTS_FILE
        elif [[ $SORT_DESCENDING ]]; then
        sort -t, -k1 -r $CONTACTS_FILE
    else
        cat $CONTACTS_FILE
    fi
}

function search_and_display {
    
    grep -i "$VALUE" $CONTACTS_FILE | cut -d',' -f1,2,3,4
}

function delete_contact {
    
    sed -i "/^  search_name,/d" $CONTACTS_FILE
}


case $COMMAND in
    insert)
        insert_contact
    ;;
    edit)
        edit_contact
    ;;
    display)
        display_all_contacts
    ;;
    search)
        search_and_display
    ;;
    delete)
        delete_contact
    ;;
esac