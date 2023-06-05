testOneDashOneParam()
{
    assertEquals "a=1" "$(prepareArgumentPairs -a)" 

    assertEquals "a=0" "$(prepareArgumentPairs -a 0)" 
    assertEquals "a=0" "$(prepareArgumentPairs -a=0)" 

    assertEquals "a=1" "$(prepareArgumentPairs -a 1)" 
    assertEquals "a=1" "$(prepareArgumentPairs -a=1)" 

    assertEquals "a=2" "$(prepareArgumentPairs -a 2)" 
    assertEquals "a=2" "$(prepareArgumentPairs -a=2)" 

    assertEquals "a=abc" "$(prepareArgumentPairs -a abc)" 
    assertEquals "a=abc" "$(prepareArgumentPairs -a=abc)" 

    assertEquals "abc=0" "$(prepareArgumentPairs -abc 0)" 
    assertEquals "abc=0" "$(prepareArgumentPairs -abc=0)" 

    assertEquals "abc=1" "$(prepareArgumentPairs -abc 1)" 
    assertEquals "abc=1" "$(prepareArgumentPairs -abc=1)" 

    assertEquals "abc=2" "$(prepareArgumentPairs -abc 2)" 
    assertEquals "abc=2" "$(prepareArgumentPairs -abc=2)" 

    assertEquals "abc=abc" "$(prepareArgumentPairs -abc abc)" 
    assertEquals "abc=abc" "$(prepareArgumentPairs -abc=abc)" 
}

testOneDashTwoParams()
{
    assertEquals "a=1 b=1" "$(prepareArgumentPairs -a -b)" 

    assertEquals "a=0 b=0" "$(prepareArgumentPairs -a 0 -b 0)" 
    assertEquals "a=0 b=0" "$(prepareArgumentPairs -a=0 -b 0)" 

    assertEquals "a=1 b=1" "$(prepareArgumentPairs -a 1 -b 1)" 
    assertEquals "a=1 b=1" "$(prepareArgumentPairs -a=1 -b=1)" 

    assertEquals "a=2 b=2" "$(prepareArgumentPairs -a 2 -b 2)" 
    assertEquals "a=2 b=2" "$(prepareArgumentPairs -a=2 -b 2)" 

    assertEquals "a=abc b=def" "$(prepareArgumentPairs -a abc -b def)" 
    assertEquals "a=abc b=def" "$(prepareArgumentPairs -a=abc -b=def)" 

    assertEquals "abc=0 def=0" "$(prepareArgumentPairs -abc 0 -def 0)" 
    assertEquals "abc=0 def=0" "$(prepareArgumentPairs -abc=0 -def=0)" 

    assertEquals "abc=1 def=1" "$(prepareArgumentPairs -abc 1 -def 1)" 
    assertEquals "abc=1 def=1" "$(prepareArgumentPairs -abc=1 -def=1)" 

    assertEquals "abc=2 def=2" "$(prepareArgumentPairs -abc 2 -def 2)" 
    assertEquals "abc=2 def=2" "$(prepareArgumentPairs -abc=2 -def=2)" 

    assertEquals "abc=abc def=def" "$(prepareArgumentPairs -abc abc -def def)" 
    assertEquals "abc=abc def=def" "$(prepareArgumentPairs -abc=abc -def=def)" 
}

source $DSETUP_INIT
source $DSETUP_SHUNIT