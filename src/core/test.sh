TEST_CASE=""
TEST_NUMBER=0
RESULT_FAIL="no"

RESULT_STACK="$(startBlue)\n"
RESULT_STACK="${RESULT_STACK}$(showLineFull)\n"
RESULT_STACK="${RESULT_STACK}Running unit tests\n"
RESULT_STACK="${RESULT_STACK}$(showLineFull)\n"
RESULT_STACK="${RESULT_STACK}$(endBlue)"

trim() {
    text="$@"
    echo $(echo $text | sed 's/ *$//g')
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

assertEquals() {
    expected=$(_assertionGetExpected "$@")
    actual=$(_assertionGetActual "$@")

    message="Assert Equals"

    if [[ "$expected" != "$actual" ]]; then
        message=$(showCheckbox no $message)
        message="${message}  : fails to check if \"$expected\" is equal to \"$actual\""
        RESULT_FAIL="yes"
    else 
        message=$(showCheckbox yes $message)
        message="${message}: \"$expected\" is equal to \"$actual\""
    fi

    RESULT_STACK="$RESULT_STACK\n$message"
}

runAllTests() {
    testDir="$(pathTest)"

    allTests=$(ls $testDir)

    for file in $allTests
    do
        RESULT_STACK="$RESULT_STACK\n$file\n$(showLineFull)"
        source "$testDir/$file"
        RESULT_STACK="$RESULT_STACK\n"
    done

    echo -e "$RESULT_STACK\n"

    if [[ "$RESULT_FAIL" == "yes" ]]; then
        exit $EXIT_WITH_ERROR
    else 
        exit $EXIT_WITH_SUCCESS
    fi
}

runSingleTest() {
    fileName=$(echo "$@" | cut -d" " -f2) # a partir do segundo parâmetro

    file="$(pathTest)/$fileName.test.sh"

    TEST_CASE="$file"

    if [[ ! -f $file ]]; then
        inRed $(showLineFull)
        showError File \"$fileName.test.sh\" does not exists
        inRed $(showLineFull)
        
        exit $EXIT_WITH_ERROR
    fi

    RESULT_STACK="$RESULT_STACK\n$fileName.test.sh\n$(showLineFull)"

    source "$file"
    
    echo -e $RESULT_STACK

    startBlue
    showLineFull 
    endBlue

    if [[ "$RESULT_FAIL" == "yes" ]]; then
        exit $EXIT_WITH_ERROR
    else 
        exit $EXIT_WITH_SUCCESS
    fi
}