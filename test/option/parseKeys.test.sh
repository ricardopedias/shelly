testKeys()
{
    assertEquals "a" "$(pairKey a=0)" 
    assertEquals "a" "$(pairKey a=1)" 
    assertEquals "a" "$(pairKey a=a)"

    assertEquals "abc" "$(pairKey abc=1)" 
    assertEquals "abc" "$(pairKey abc=0)" 
    assertEquals "abc" "$(pairKey abc=abc)" 

    assertEquals "abc" "$(pairKey abc=def)"
}

source $DSETUP_INIT
source $DSETUP_SHUNIT