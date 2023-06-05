
testValues()
{
    assertEquals "0" "$(pairValue a=0)"
    assertEquals "1" "$(pairValue a=1)"
    assertEquals "a" "$(pairValue a=a)"

    assertEquals "1" "$(pairValue abc=1)" 
    assertEquals "0" "$(pairValue abc=0)" 
    assertEquals "abc" "$(pairValue abc=abc)" 
    
    assertEquals "def" "$(pairValue abc=def)" 
}

source $DSETUP_INIT
source $DSETUP_SHUNIT