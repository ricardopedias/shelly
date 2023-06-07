#!/bin/bash
#
# setup-dev.sh - Configurações do ambiente de desenvolvimento do projeto
# 
# Para saber mais, execute:
# ./setup-dev.sh -h
# 

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

source "$ROOT_PATH/src/init.sh"

if [[ "$@" == "" ]] || [[ "$1" == "-h" ]]; then
    showHelp
    exitSuccess
fi

if [[ "$1" == "--install" ]]; then
    vendorInstall
    exitSuccess
fi

if [[ "$1" == "--update" ]]; then
    rm -Rf $(pathVendor)
    vendorInstall
    exitSuccess
fi

checkVendorInstalation

if [[ "$1" == "--test" ]] && [[ "$2" != "" ]]; then
    runSearchTest "$@"
    exitSuccess
fi

if [[ "$1" == "--test" ]]; then
    runAllTests
    exitSuccess
fi


PARAM_LIST=$(parseArgumentPairs $@)

for PAIR in $PARAM_LIST
do
    PARAM_KEY=$(pairKey $PAIR)
    PARAM_VALUE=$(pairValue $PAIR)

    case "$PARAM_KEY" in
        all) OPTION_ALL="yes" ;;
        a) OPTION_ALL="yes" ;;

        cmake) OPTION_XMAKE="yes" ;;

        compilers) OPTION_COMPILERS="yes" ;;

        git) OPTION_GIT="yes" ;;

        help) showHelp ;;
        h) showHelp ;;

        chrome) OPTION_CHROME="yes" ;;

        release) OPTION_RELEASE="$PARAM_VALUE" ;;
        r) OPTION_RELEASE="$PARAM_VALUE" ;;

        system) OPTION_SYSTEM="$PARAM_VALUE" ;;
        s) OPTION_SYSTEM="$PARAM_VALUE" ;;

        ssh) OPTION_SSH="yes" ;;

        vscode) OPTION_VSCODE="yes" ;;

        xmake) OPTION_XMAKE="yes" ;;
        
        zsh) OPTION_ZSH="yes" ;;

        *) showHelpShort "Opção inválida: $PARAM_KEY" && exit 1;;
    esac
done
