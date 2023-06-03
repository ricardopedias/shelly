
testStackAdd()
{
    TEST_STACK_FILE="$(_testStackFile)"

    echo -e $@ >> "$TEST_STACK_FILE"
}

_testStackFile()
{
    echo "/tmp/shtest_stack.log"
}

testStackStart()
{
    TEST_STACK_FILE="$(_testStackFile)"

    # limpa o arquivo de log
    cat /dev/null > $TEST_STACK_FILE

    testStackAdd "$(startBlue)"
    testStackAdd "$(showLineFull)"
    testStackAdd "Running unit tests"
    testStackAdd "$(showLineFull)"
    testStackAdd "$(endBlue)"
}

testPrint()
{
    testStackAdd $@
}

runSearchTest()
{
    testStackStart

    search="$2"
    allTests=$(find $(pathTest) -maxdepth 5 -type f -name "*$search*")

    index=1
    for file in $allTests
    do
        basename="$(basename -- $file)"
        testStackAdd "Test $index: $basename\n$(showLineFull)"
        _runSingleTest "$file"

        index=$(expr $index + 1)
    done

    testStackAdd "Ok: $(assertionOk), Fails: $(assertionFails)\n"

    cat $(_testStackFile)

   if [[ $(assertionFails) > 0 ]]; then
        exit $EXIT_WITH_ERROR
        return
    fi

    exit $EXIT_WITH_SUCCESS
}

runAllTests()
{
    testStackStart

    allTests=$(find $(pathTest) -maxdepth 5 -type f)

    index=1
    for file in $allTests
    do
        basename="$(basename -- $file)"
        testStackAdd "Test $index: $basename\n$(showLineFull)"
        _runSingleTest "$file"

        index=$(expr $index + 1)
    done

    testStackAdd "Ok: $(assertionOk), Fails: $(assertionFails)\n"

    cat $(_testStackFile)

   if [[ $(assertionFails) > 0 ]]; then
        exit $EXIT_WITH_ERROR
        return
    fi

    exit $EXIT_WITH_SUCCESS
}

_runSingleTest()
{
    file="$@"

    if [[ ! -f $file ]]; then
        testStackAdd $(
            inRed $(showLineFull)
            showError File \"$fileName\" does not exists
            inRed $(showLineFull)
        )
        
        exit $EXIT_WITH_ERROR
    fi

    $(source "$file")

    testStackAdd "\n"
}
