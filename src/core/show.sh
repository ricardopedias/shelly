
showText()
{
    case $1 in 
        "error") ICON="✖ " ;;
        "ok") ICON="✔ " ;;
        "dot") ICON="● " ;;
        "hand") ICON="🖝 " ;;
        "arrow") ICON="► " ;;
        "space") ICON="  " ;;
        *) ICON="" ;;
    esac

    # o conteúdo a partir da 3 opção deve ser considerado um texto
    MESSAGE=$(echo "$@" | cut -d" " -f2-99)

    echo "${ICON}${MESSAGE}"
}

showError()
{
    echo $(inRed $(showText error $@))
}

showInfo()
{
    inBlue $(showText hand $@)
}

showMuted()
{
    showText space $@
}

showSuccess()
{
    inGreen $(showText ok $@)
}

showWarning()
{
    inYellow $(showText dot $@)
}

showItem()
{
    showText arrow $@
}

showCheckbox()
{
    COLOR_BLUE='\e[0;34m'
    COLOR_GREEN='\e[1;32m'
    COLOR_RED='\e[1;31m'
    COLOR_NC='\e[0m'
    
    MESSAGE=$(echo "$@" | cut -d" " -f2-99)
    CHECK="${COLOR_GREEN}[YES]"

    if [[ "$1" == "no" ]]; then
        CHECK="${COLOR_RED}[NO]"
    fi

    echo -e "${COLOR_BLUE}$MESSAGE $CHECK ${COLOR_NC}"
}

showLine() {
    lineLength=$1
    
    line="-"
    for i in $(seq 2 $lineLength)
    do 
        line="-$line"
    done

    echo -e "+-$line-+"
}

showLineText() {
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

showLineFull() {
    consoleLength=$(tput cols)
    length=$(expr $consoleLength - 6)

    showLine $length
}

showLineTextFull() {
    consoleLength=$(tput cols)
    length=$(expr $consoleLength - 6)

    showLineText $length $@
}    

showBlock() {
    blockLength=$1
    message=$(echo "$@" | cut -d" " -f2-99) # a partir do segundo parâmetro
    
    showLine $blockLength
    showLineText $blockLength $message
    showLine $blockLength
}

showBlockAuto() {
    message="$@"
    countChars="${#message}"

    showBlock $countChars $message
}

showBlockFull()
{
    message="$@"
    consoleLength=$(tput cols)
    length=$(expr $consoleLength - 6)

    showBlock $length $message
}
