
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
        key=$(echo "$node" | cut -d"=" -f1)
        key=$(removeStartDashes $key)

        value=$(echo "$node" | cut -d"=" -f2)
        value=$(removeStartDashes $value)

        if [[ "$key" == "$value" ]]; then
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
