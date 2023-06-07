# Setup Developer

## Howto

Modo de uso: setup.sh <opções>

## Examples

setup.sh -s fedora -r 39 -a
setup.sh --system=ubuntu --release=23.04 --all

## Options

-h|--help : Exibe_essa_ajuda
-s|--system : Tipo de sistema: Ex: fedora, ubuntu, windows, macos
-r|--release : Versão do sistema. Ex: 38, 23.04, etc
-a|--all : Efetua todas as instalações e configurações
--cmake : Instala o cmake como builder
--xmake : Instala o xmake como builder
--git : Instala e configura o Git
--chrome : Instala o Google Chrome
--ssh : Instala e configura o SSH e a chave para o GitHub
--vscode : Instala e configura o Visual Studio Code
--zsh : Instala e configura o Oh My Zsh
