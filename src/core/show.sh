
startBlue() {
    echo -e "\e[0;34m"
}

endBlue() { 
    echo -e "\e[0m"
}

inBlue() {
    echo -e "\e[0;34m$@\e[0m"
}

startGreen() {
    echo -e "\e[0;32m"
}

endGreen() { 
    echo -e "\e[0m"
}

inGreen() {
    echo -e "\e[0;32m$@\e[0m"
}

startRed() {
    echo -e "\e[0;31m"
}

endRed() { 
    echo -e "\e[0m"
}

inRed() {
    echo -e "\e[0;31m$@\e[0m"
}

startYellow() {
    echo -e "\e[1;33m"
}

endYellow() { 
    echo -e "\e[0m"
}

inYellow() {
    echo -e "\e[1;33m$@\e[0m"
}

showText() {
    case $1 in 
        "error") ICON="✖" ;;
        "ok") ICON="✔" ;;
        "dot") ICON="●" ;;
        "hand") ICON="🖝" ;;
        "arrow") ICON="►" ;;
        "space") ICON=" " ;;
        *) ICON="" ;;
    esac

    # o conteúdo a partir da 3 opção deve ser considerado um texto
    MESSAGE=$(echo "$@" | cut -d" " -f3-99)

    echo -e "$ICON $MESSAGE"
}

showError() {
    inRed $(showText error $@)
}

showInfo() {
    showText hand $@
}

showMuted() {
    showText none $@
}

showSuccess() {
    showText ok $@
}

showWarning() {
    showText dot $@
}

showItem() {
    showText arrow $@
}

showCheckbox() {
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
            message="$message "
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
