testWords()
{
    assertEquals "abc=1" "$(prepareArgumentPairs abc)" 
    assertEquals "abc=def" "$(prepareArgumentPairs abc def)" 
}

source $DSETUP_INIT
source $DSETUP_SHUNIT