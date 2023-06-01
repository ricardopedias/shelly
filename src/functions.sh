
showSupport()
{
    showText none none "Os sistemas suportados são:"
    showText blue arrow "fedora 36, 37, 38"
    showText blue arrow "ubuntu 22.10, 23.04, 23.04"
    showText blue arrow "windows 10, 11"

    showSection
}

showText()
{
    COLOR_BLUE='\e[0;34m'
    COLOR_GRAY='\e[0;30m'
    COLOR_GREEN='\e[0;32m'
    COLOR_RED='\e[0;31m'
    COLOR_YELLOW='\e[1;33m'
    COLOR_NC='\e[0m'

    case $1 in 
        "blue") COLOR=$COLOR_BLUE ;;
        "gray") COLOR=$COLOR_GRAY ;;
        "green") COLOR=$COLOR_GREEN ;;
        "red") COLOR=$COLOR_RED ;;
        "yellow") COLOR=$COLOR_YELLOW ;;
        *) COLOR=$COLOR_NC ;;
    esac

    case $2 in 
        "danger") ICON="✖" ;;
        "ok") ICON="✔" ;;
        "dot") ICON="●" ;;
        "hand") ICON="🖝" ;;
        "arrow") ICON="►" ;;
        *) ICON=" " ;;
    esac

    # o conteúdo a partir da 3 opção deve ser considerado um texto
    MESSAGE=$(echo "$@" | cut -d" " -f3-99)

    if [[ "$MESSAGE" == "--" ]]; then
        MESSAGE="----------------------------------------------------------"
    fi

    echo -e "$COLOR $ICON $MESSAGE $COLOR_NC"
}

showError()
{
    showText red danger $@
}

showInfo()
{
    showText blue hand $@
}

showMuted()
{
    showText gray none $@
}

showSuccess()
{
    showText green ok $@
}

showWarning()
{
    showText yellow dot $@
}

showItem()
{
    showText none arrow $@
}

showCheckbox()
{
    COLOR_BLUE='\e[0;34m'
    COLOR_GREEN='\e[1;32m'
    COLOR_RED='\e[1;31m'
    COLOR_NC='\e[0m'
    
    MESSAGE=$(echo "$@" | cut -d" " -f2-99)
    CHECK="${COLOR_GREEN}[OK]"

    if [[ "$1" == "no" ]]; then
        CHECK="${COLOR_RED}[Não instalado]"
    fi

    echo -e "${COLOR_BLUE}   $MESSAGE $CHECK ${COLOR_NC}"
}

# extrai a lista de pares parâmetro=valor
parseArgumentPairs()
{
    ARGS=$@

    # remove os espaços, para juntar todas as opções
    ARGS=${ARGS//" "/"="}

    # adiciona espaços apenas antes dos sinalizadores -- e -
    ARGS=${ARGS//"=--"/" --"}
    ARGS=${ARGS//"=-"/" -"}

    # libera uma lista com pares de opção=valor
    echo $ARGS
}

# Extrai o nome do parâmetro de um par
pairKey()
{
    PAIR=${1//"="/" "}
    for NODE in $PAIR
    do
        echo ${NODE//"-"/""}
        return
    done
}

# Extrai o valor de um par
pairValue()
{
    KEY="none"
    VALUE="none"

    PAIR=${1//"="/" "}

    for NODE in $PAIR
    do
        if [[ "$KEY" == "none" ]]; then
            KEY="$NODE"
        fi

        VALUE="$NODE"
    done

    if [[ "$KEY" == "$VALUE" ]]; then
        echo "1"
        return
    fi

    echo ${VALUE//"-"/""}
}

showHelp()
{
    showSection "Setup: Ajuda"
    showSection
    echo ""
    showHelpHeader $1
    echo ""
    showHelpOptions
    echo ""
    showSection
    exit 0
}

showHelpShort()
{
    showSection "Setup: Ajuda"
    showSection
    echo ""
    showHelpHeader $1
    echo ""
    showSection
    exit 0
}

showHelpHeader()
{
    if [[ "$1" != "" ]]; then
        showError $1
        echo ""
    fi

    showText blue none "Modo de uso: setup.sh <opções>"
    echo ""
    showText blue none "Exemplos:"
    echo ""
    showMuted "setup.sh -s fedora -r 39 -a"
    showMuted "setup.sh --system=ubuntu --release=23.04 --all"
}


showHelpOptions()
{
    showText blue none "Opções:" none
    echo ""
    showMuted "-h|--help......Exibe_essa_ajuda"
    showMuted "-s|--system....Tipo de sistema: Ex: fedora, ubuntu, windows, macos"
    showMuted "-r|--release...Versão do sistema. Ex: 38, 23.04, etc"
    showMuted "-a|--all.......Efetua todas as instalações e configurações"
    showMuted "--cmake........Instala o cmake como builder"
    showMuted "--xmake........Instala o xmake como builder"
    showMuted "--git..........Instala e configura o Git"
    showMuted "--chrome.......Instala o Google Chrome"
    showMuted "--ssh..........Instala e configura o SSH e a chave para o GitHub"
    showMuted "--vscode.......Instala e configura o Visual Studio Code"
    showMuted "--zsh..........Instala e configura o Oh My Zsh"
}

showSection()
{
    showText blue none "--"

    if [[ "$1" != "" ]]; then
        showText green none $1
    fi
}
