
showHelp()
{
    file=$1

    while read -r row
    do
        _isHeader $row
        if [[ "$(_isHeader $row)" == "yes" ]]
        then
            # shapeBlockFull $(removeStartHashes $row)
            echo $row
        fi

        # echo "$row"
    done < "$file"

    
    # showSection "Setup: Ajuda"
    # showSection
    # echo ""
    # _showHelpHeader $1
    # echo ""
    # _showHelpOptions
    # echo ""
    # showSection
    # exit 0
}

_isHeader()
{
    content=$(trim $@)
    charOne=${content:0:1}
    charTwo=${content:1:2}

    if [[ "$charTwo" == "#" ]]; then
        echo "no"
    else 
        echo "yes"
    fi
}

_isSection()
{
    content=$@
    charOne=${content:0:1}
    charTwo=${content:1:2}

    if [[ "$charOne" == "#" ]] && [[ "$charTwo" == "#" ]]
    then
        echo "yes"
    else
        echo "no"
    fi
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

showSupport()
{
    showText none none "Os sistemas suportados são:"
    showText blue arrow "fedora 36, 37, 38"
    showText blue arrow "ubuntu 22.10, 23.04, 23.04"
    showText blue arrow "windows 10, 11"

    showSection
}

# 
# PRIVATE
#

_showHelpHeader()
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

_showHelpOptions()
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
