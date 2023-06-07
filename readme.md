# Developer Setup

Este é um framework simples para criação de scripts bash baseados em linha de comando.

## Como usar



## Testes

Na 
```bash
# para instruções de uso
./setupd.sh

# para configurar e instalar todas as ferramentas no fedora 38
setupd.sh -t c++ --xmake

# para instalar e configurar somente o xmake no ubuntu 23.04
setupd.sh -t php --docker

setupd.sh --config git-commiter
setupd.sh --config ssh-key
```

## Set de ferramentas

--toolset c++|php|js

### Gerais

Obrigatórios:
git ssh zip wget curl 

Perguntas: 
docker

### IDEs e editores

vscode
netbeans
eclipse
codeblocks

### Linguagem PHP

Obrigatórios:
php-cli
composer

Perguntas:
plugins vscode [se vscode detectado]
chrome

### Linguagem C++

Obrigatórios
g++
clang
mingw64-g++
mingw64-clang

Perguntas
plugins vscode [se vscode detectado]
cmake
xmake

### Lingagem Javascript

Obrigatórios
nodejs

Perguntas
plugins vscode [se vscode detectado]
npm

