startFile()
{
    file="$1"
    
    if [[ ! -f $file ]]; then
        echo "" > $file
    fi

    cat /dev/null > $file
}

incrementFile()
{
    file=$1
    current=$(cat $file)

    if [[ "$current" == "" ]]; then
        current=1
    else
        current=$(expr $current + 1)
    fi

    echo -e $current > $file
}
