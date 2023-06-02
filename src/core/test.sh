
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

runTest()
{
    startFile $(_testStackFile)
    
    # primeiro parâmetro é --test
    # a partir do segundo parâmetro é o nome do teste
    fileName=$(echo "$@.test.sh" | cut -d" " -f2) 

    testStackStart

    testStackAdd "Test: $fileName\n$(showLineFull)"

    _runSingleTest $fileName

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

    allTests=$(ls $(pathTest))

    index=1
    for file in $allTests
    do
        testStackAdd "Test $index: $file\n$(showLineFull)"
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
    file="$(pathTest)/$@"

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
