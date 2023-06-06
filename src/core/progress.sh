# 
# Ferramentas para exibição de barras de progresso
# Modo de usar:
# progressBarStart
# progressBarChange 25
# progressBarChange 60
# progressBarChange 90
# progressBarEnd Mensagem de sucesso
# 

progressBarStart()
{
    progressBarChange 0
}

progressBarChange()
{
    base=$1
    message=$(echo "$@" | cut -d" " -f2-99)

    percentage=$((base / 10))
    percentage=$((percentage * 2))

    progressBar=""
    for currentPercent in $(seq 1 20)
    do
        if [[ "$percentage" -ge "$currentPercent" ]]; then
            progressBar+="▬"
        else
            progressBar+="▭"
        fi
    done

    if [[ "$message" == "$base" ]]; then
        message=""
    else
        message=" $message"
    fi

    echo -ne "$progressBar (${base}%)$message\r"
}

progressBarEnd()
{
    progressBarChange 100 $1
    echo -ne '\n'
}
