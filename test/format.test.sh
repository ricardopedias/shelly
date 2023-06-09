
testTrim()
{
    assertNotEquals "abc" "abc    "
    assertEquals "abc" $(trim "abc    ")
    assertEquals "abc" $(trim "    abc    ")
    assertEquals "abc" $(trim "    abc")
}

testTrimNotContentSpaces()
{
    assertEquals "a b c" "$(trim "a b c    ")"
    assertEquals "a b c" "$(trim "    a b c    ")"
    assertEquals "a b c" "$(trim "    a b c")"

    # assertEquals "abc" $(trim "\nabc")
    # assertEquals "abc" $(trim "abc\n")
    # assertEquals "abc" $(trim "\nabc\n")
}

testRemoveDashes()
{
    assertEquals "abc" $(removeStartDashes "--abc")
    assertEquals "abc" $(removeStartDashes "-abc")

    assertEquals "abc-" $(removeStartDashes "--abc-")
    assertEquals "abc-" $(removeStartDashes "-abc-")
    assertEquals "abc--" $(removeStartDashes "--abc--")
}

source $DSETUP_INIT
source $DSETUP_SHUNIT
