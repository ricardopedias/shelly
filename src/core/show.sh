
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
    type=$1
    message=$(echo "$@" | cut -d" " -f2-99)

    case $1 in 
        "yes") check="$(startGreen)[YES]$(endGreen)" ;;
        "no") check="$(startRed)[NO]$(endRed)" ;;
        *) check="$(startBlue)[${type//_/" "}]$(endBlue)" ;;
    esac

    echo -e "$message $check"
}
