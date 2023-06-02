
ASSERTION_FAILS=0
ASSERTION_OK=0

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

assertionFails()
{
    echo $ASSERTION_FAILS
}

assertionOk()
{
    echo $ASSERTION_OK
}

assertEquals()
{
    expected=$(_assertionGetExpected "$@")
    actual=$(_assertionGetActual "$@")

    message="Assert Equals"

    if [[ "$expected" != "$actual" ]]; then
        message=$(showCheckbox no $message)
        message+="  : fails to check if \"$expected\" is equal to \"$actual\""
        ASSERTION_FAILS=$(expr $ASSERTION_FAILS + 1)
    else 
        message=$(showCheckbox yes $message)
        message+=": \"$expected\" is equal to \"$actual\""
        ASSERTION_OK=$(expr $ASSERTION_OK + 1)
    fi

    testStackAdd "$message"
}
