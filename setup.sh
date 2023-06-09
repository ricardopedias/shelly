#!/bin/bash
#
# setup.sh
# 
# Este programa é a porta de entrada para as funcionalidades do framework.
# instalando dependências e fazendo as configurações necessárias para desenvolvimento
# 
# Para saber mais, execute:
# setup.sh -h
# 

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

source "$ROOT_PATH/src/init.sh"

# DSETUP_HELP_FILE="$ROOT_PATH/lixo.md"


if [[ "$@" == "" ]]; then
    renderCurrentHelp
fi

argumentList=$(prepareArgumentPairs $@)

for argumentPair in $argumentList
do
    paramKey=$(pairKey $argumentPair)
    paramValue=$(pairValue $argumentPair)

    case "$paramKey" in
        h) renderCurrentHelp ;;
        help) renderCurrentHelp ;;

        # *) 
        #     showError "Opção inválida: $PARAM_KEY"
        #     exitSuccess
        #     ;;
    esac
done
