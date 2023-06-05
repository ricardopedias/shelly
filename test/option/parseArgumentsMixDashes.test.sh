
testMixDashTwoParams()
{
    assertEquals "a=1 b=1" "$(prepareArgumentPairs --a --b)" 

    assertEquals "a=0 b=0" "$(prepareArgumentPairs -a 0 --b 0)" 
    assertEquals "a=0 b=0" "$(prepareArgumentPairs --a 0 -b 0)" 

    assertEquals "a=0 b=0" "$(prepareArgumentPairs -a=0 --b=0)" 
    assertEquals "a=0 b=0" "$(prepareArgumentPairs --a=0 -b=0)" 

    assertEquals "a=1 b=1" "$(prepareArgumentPairs -a 1 --b 1)" 
    assertEquals "a=1 b=1" "$(prepareArgumentPairs --a 1 -b 1)" 

    assertEquals "a=1 b=1" "$(prepareArgumentPairs -a=1 --b=1)" 
    assertEquals "a=1 b=1" "$(prepareArgumentPairs --a=1 -b=1)" 

    assertEquals "a=2 b=2" "$(prepareArgumentPairs -a 2 --b 2)" 
    assertEquals "a=2 b=2" "$(prepareArgumentPairs --a 2 -b 2)" 

    assertEquals "a=2 b=2" "$(prepareArgumentPairs -a=2 --b=2)" 
    assertEquals "a=2 b=2" "$(prepareArgumentPairs --a=2 -b=2)" 

    assertEquals "a=abc b=def" "$(prepareArgumentPairs -a abc --b def)" 
    assertEquals "a=abc b=def" "$(prepareArgumentPairs --a abc -b def)" 

    assertEquals "a=abc b=def" "$(prepareArgumentPairs -a=abc --b=def)" 
    assertEquals "a=abc b=def" "$(prepareArgumentPairs --a=abc -b=def)" 

    assertEquals "abc=0 def=0" "$(prepareArgumentPairs -abc 0 --def 0)" 
    assertEquals "abc=0 def=0" "$(prepareArgumentPairs --abc 0 -def 0)" 

    assertEquals "abc=0 def=0" "$(prepareArgumentPairs -abc=0 --def=0)" 
    assertEquals "abc=0 def=0" "$(prepareArgumentPairs --abc=0 -def=0)" 

    assertEquals "abc=1 def=1" "$(prepareArgumentPairs -abc 1 --def 1)" 
    assertEquals "abc=1 def=1" "$(prepareArgumentPairs --abc 1 -def 1)" 

    assertEquals "abc=1 def=1" "$(prepareArgumentPairs -abc=1 --def=1)" 
    assertEquals "abc=1 def=1" "$(prepareArgumentPairs --abc=1 -def=1)" 

    assertEquals "abc=2 def=2" "$(prepareArgumentPairs -abc 2 --def 2)" 
    assertEquals "abc=2 def=2" "$(prepareArgumentPairs --abc 2 -def 2)" 

    assertEquals "abc=2 def=2" "$(prepareArgumentPairs -abc=2 --def=2)" 
    assertEquals "abc=2 def=2" "$(prepareArgumentPairs --abc=2 -def=2)" 

    assertEquals "abc=abc def=def" "$(prepareArgumentPairs -abc abc --def def)" 
    assertEquals "abc=abc def=def" "$(prepareArgumentPairs --abc abc -def def)" 

    assertEquals "abc=abc def=def" "$(prepareArgumentPairs -abc=abc --def=def)" 
    assertEquals "abc=abc def=def" "$(prepareArgumentPairs --abc=abc -def=def)" 
}

source $DSETUP_INIT
source $DSETUP_SHUNIT