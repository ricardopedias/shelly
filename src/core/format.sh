trim()
{
    # declara os caracteres de controle
    lines=$(echo -e $@)

    # remove as novas linhas
    oneline=""
    for line in $lines
    do
        oneline+=$line
    done

    # remove espaços antes e depois
    echo $(echo $oneline | sed 's/ *$//g')
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
