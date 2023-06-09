trim()
{
    echo $(echo $@ | sed -e 's/^[[:space:]]*//')
}

removeStartDashes()
{
    content=$1

    dash=${content:0:1}
    if [[ "$dash" == "-" ]]; then
        content=${content:1:99}
    fi

    dash=${content:0:1}
    if [[ "$dash" == "-" ]]; then
        content=${content:1:99}
    fi

    echo $content
}

removeStartHashes()
{
    content=$1

    dash=${content:0:1}
    if [[ "$dash" == "#" ]]; then
        content=${content:1:99}
    fi

    dash=${content:0:1}
    if [[ "$dash" == "#" ]]; then
        content=${content:1:99}
    fi

    echo $content
}
