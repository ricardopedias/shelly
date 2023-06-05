
# 
# Padroniza uma lista de opções.
# As opções são padronizadas da seguinte forma:
#  --param=value ou --param value : param=value
#  -p=value ou -p value           : p=value
#  -p ou --param                  : p=1 ou 
prepareArgumentPairs()
{
    arguments=$@

    # remove os espaços, para juntar todas as opções
    arguments=${arguments//" "/"="}

    # adiciona espaços apenas antes dos sinalizadores -- e -
    arguments=${arguments//"=--"/" --"}
    arguments=${arguments//"=-"/" -"}

    parsedArguments=""

    for node in $arguments
    do
        originKey=$(echo "$node" | cut -d"=" -f1)
        originValue=$(echo "$node" | cut -d"=" -f2)

        key=$(removeStartDashes $originKey)
        value=$(removeStartDashes $originValue)

        # se a chave (-- ou -) for igual ao valor, 
        # significa que não foi passado um valor para ela
        if [[ "$originKey" == "$originValue" ]]; then
            parsedArguments+="$key=1 "
        else 
            parsedArguments+="$key=$value "
        fi
    done

    # libera uma lista com pares de opção=valor
    echo $parsedArguments
}

# Extrai o nome do parâmetro de um par
pairKey()
{
    pair=${1//"="/" "}
    for node in $pair
    do
        echo ${node//"-"/""}
        return
    done
}

# Extrai o valor de um par
pairValue()
{
    key="none"
    value="none"

    pair=${1//"="/" "}

    for node in $pair
    do
        if [[ "$key" == "none" ]]; then
            key="$node"
        fi

        value="$node"
    done

    echo ${value//"-"/""}
}
