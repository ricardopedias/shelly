
# 
# Padroniza uma lista de opções.
# As opções são padronizadas da seguinte forma:
#  --param=value ou --param value : param=value
#  -p=value ou -p value           : p=value
#  -p ou --param                  : p=true
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
