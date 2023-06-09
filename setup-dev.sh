#!/bin/bash
#
# setup-dev.sh
# 
# Este programa é a porta de entrada para as funcionalidades do framework.
# Diferente do programa setup.sh, o setup-dev.sh contém ferramentas para o 
# desenvolvimento da própria biblioteca, como pode ser consultado na ajuda.
# 
# Para saber mais, execute:
# setup-dev.sh -h
# 

ROOT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

DSETUP_HELP_FILE="$ROOT_PATH/src/help_dev.md"

source "$ROOT_PATH/setup.sh"

argumentList=$(prepareArgumentPairs $@)

for argumentPair in $argumentList
do
    paramKey=$(pairKey $argumentPair)
    paramValue=$(pairValue $argumentPair)

    case "$paramKey" in
        install) vendorInstall ;;

        update) vendorUpdate ;;

        test) 
            if [[ "$2" != "" ]]; then
                runSearchTest "$@"
            else 
                runAllTests
            fi
            ;;

        *) 
            showError "Opção inválida: $paramKey"
            exitSuccess
            ;;
    esac
done
