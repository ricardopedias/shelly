
shapeLine()
{
    lineLength=$1
    
    line="-"
    for i in $(seq 2 $lineLength)
    do 
        line="-$line"
    done

    echo -e "+-$line-+"
}

shapeLineText()
{
    lineLength=$1
    message=$(echo "$@" | cut -d" " -f2-99) # a partir do segundo parâmetro
    countChars=${#message}

    for i in $(seq 2 $lineLength)
    do 
        if [[ $countChars -lt $i ]]; then
            message+=" "
        fi
    done

    echo -e "| $message |"
}

_shapeConsoleLength()
{
    echo $(tput cols)
}

shapeLineFull()
{
    length=$(expr $(_shapeConsoleLength) - 6)

    shapeLine $length
}

shapeLineTextFull()
{
    length=$(expr $(_shapeConsoleLength) - 6)

    shapeLineText $length $@
}    

shapeBlock()
{
    blockLength=$1
    message=$(echo "$@" | cut -d" " -f2-99) # a partir do segundo parâmetro
    
    shapeLine $blockLength
    shapeLineText $blockLength $message
    shapeLine $blockLength
}

shapeBlockAuto()
{
    message="$@"
    countChars="${#message}"

    shapeBlock $countChars $message
}

shapeBlockFull()
{
    message="$@"
    length=$(expr $(_shapeConsoleLength) - 6)

    shapeBlock $length $message
}
