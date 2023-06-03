
assertionFails()
{
    count=$(cat $(_assertionFailsFile))

    if [[ "$count" == "" ]]; then
        count=0
    fi

    echo $count
}

assertionOk()
{
    count=$(cat $(_assertionOkFile))

    if [[ "$count" == "" ]]; then
        count=0
    fi

    echo $count
}

_assertionFailsFile()
{
    echo "/tmp/shtest_fails.log"
}

_assertionOkFile()
{
    echo "/tmp/shtest_ok.log"
}

assertionIncrementFails()
{
    incrementFile "$(_assertionFailsFile)"
}

assertionIncrementOk()
{
    incrementFile "$(_assertionOkFile)"
}

_assertionGetActual()
{
    ARGS="$@"
    firstChar=${ARGS:0:1}

    if [[ "$firstChar" == ":" ]]; then
        actual=$(echo "$@" | cut -d":" -f3)
    else
        actual=$(echo "$@" | cut -d":" -f2)
    fi

    echo -e $(trim "$actual")
}

_assertionGetExpected()
{
    ARGS="$@"
    firstChar=${ARGS:0:1}

    if [[ "$firstChar" == ":" ]]; then
        expected=$(echo "$@" | cut -d":" -f2)
    else
        expected=$(echo "$@" | cut -d":" -f1)
    fi

    echo -e $(trim "$expected")
}

# _assertionGetLastFunction()
# {
#     echo $(fc -ln -1)
# }

assertEquals()
{
    expected=$(_assertionGetExpected "$@")
    actual=$(_assertionGetActual "$@")

    message="Assert Equals"

    if [[ "$expected" == "$actual" ]]; then
        message=$(showCheckbox yes $message)
        message+=": \"$expected\" is equal to \"$actual\""
        assertionIncrementOk
    else
        message=$(showCheckbox no $message)
        message+="  : \"$expected\" is not equal to \"$actual\""
        assertionIncrementFails
    fi

    testStackAdd "$message"
}

assertContains()
{
    expected=$(_assertionGetExpected "$@")
    contains=$(_assertionGetActual "$@")

    message="Assert Contains"

    if [[ "$expected" =~ .*"$contains".* ]]; then
        message=$(showCheckbox yes $message)
        message+=": \"$expected\" contains \"$actual\""
        assertionIncrementOk
    else 
        message=$(showCheckbox no $message)
        message+="  : \"$expected\" does not contain \"$actual\""
        assertionIncrementFails
    fi

    testStackAdd "$message"
}

# Efeitos colaterais necessários
# iniciam os arquivos de log
startFile $(_assertionFailsFile)
startFile $(_assertionOkFile)