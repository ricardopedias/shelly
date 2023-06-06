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
    amount=$2
    current=$(cat $file)

    if [[ "$current" == "" ]]; then
        current=0
    else
        current=$((current + amount))
    fi

    echo -e $current > $file
}
