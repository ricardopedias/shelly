
# Exibe o arquivo .md fornecido de maneira formatada como ajuda
showHelp()
{
    file=$1

    while read -r row
    do
        if [[ "$(_isHeader $row)" == "yes" ]]; then
            startBlue 
            shapeBlockFull "${row:1:99}"
        elif [[ "$(_isSection $row)" == "yes" ]]; then
            startBlue 
            echo -e "${row:3:99}" 
            endBlue
        elif [[ "$row" != "" ]]; then
            # _renderColumns "$row"
            echo "$row"
        fi

    done < "$file"

    startBlue 
    shapeLineFull
    endBlue
}

renderCurrentHelp()
{
    if [[ ! -z "$DSETUP_HELP_FILE" ]]; then 
        showHelp $DSETUP_HELP_FILE        
        return
    fi

    showHelp "$(pathRoot)/src/help_main.md"
}

_isHeader()
{
    content=$(trim $@)
    charOne=${content:0:1}
    charTwo=${content:1:1}

    if [[ "$charOne" == "#" ]] && [[ "$charTwo" != "#" ]]; then
        echo "yes"
        return
    fi

    echo "no"
}

_isSection()
{
    content=$(trim $@)
    charOne=${content:0:1}
    charTwo=${content:1:1}

    if [[ "$charOne" == "#" ]] && [[ "$charTwo" == "#" ]]; then
        echo "yes"
        return
    fi

    echo "no"
}

_renderColumns()
{
    content="$@"

    if [[ "$content" != *":"* ]]; then
        echo $content
        return
    fi

    columnOne=$(echo $content | cut -d ":" -f 1)
    columnTwo=$(echo $content | cut -d ":" -f 2)
    
    columnOneSize=${#columnOne}
    
    increase=$(expr 14 - $columnOneSize)

    if [[ "$increase" > 0 ]]; then
        for count in `seq $increase`
        do
            columnOne+=" "
        done
    fi

    echo "$columnOne : $columnTwo"
}
