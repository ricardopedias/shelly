trim() {
    text="$@"
    echo $(echo $text | sed 's/ *$//g')
}

