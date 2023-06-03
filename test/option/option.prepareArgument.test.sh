assertEquals \
    : "$(prepareArgumentPairs abc)" \
    : "abc=1"

assertEquals \
    : "$(prepareArgumentPairs abc def)" \
    : "abc=def"

testPrint Este é um teste de output na stack

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs -a)" \
    : "a=1"

assertEquals \
    : "$(prepareArgumentPairs -a -b)" \
    : "a=1 b=1"

assertEquals \
    : "$(prepareArgumentPairs -a -b -c)" \
    : "a=1 b=1 c=1"

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs -a aaa)" \
    : "a=aaa"

assertEquals \
    : "$(prepareArgumentPairs -a aaa -b bbb)" \
    : "a=aaa b=bbb"

assertEquals \
    : "$(prepareArgumentPairs -a aaa -b bbb -c ccc)" \
    : "a=aaa b=bbb c=ccc"

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs -a=aaa)" \
    : "a=aaa"

assertEquals \
    : "$(prepareArgumentPairs -a=aaa -b=bbb)" \
    : "a=aaa b=bbb"

assertEquals \
    : "$(prepareArgumentPairs -a=aaa -b=bbb -c=ccc)" \
    : "a=aaa b=bbb c=ccc"

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs --a)" \
    : "a=1"

assertEquals \
    : "$(prepareArgumentPairs --a --b)" \
    : "a=1 b=1"

assertEquals \
    : "$(prepareArgumentPairs --a --b --c)" \
    : "a=1 b=1 c=1"

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs --a aaa)" \
    : "a=aaa"

assertEquals \
    : "$(prepareArgumentPairs --a aaa --b bbb)" \
    : "a=aaa b=bbb"

assertEquals \
    : "$(prepareArgumentPairs --a aaa --b bbb --c ccc)" \
    : "a=aaa b=bbb c=ccc"

# - - - - - - - - - - - - - - - - - - - - - - - - 

assertEquals \
    : "$(prepareArgumentPairs --a=aaa)" \
    : "a=aaa"

assertEquals \
    : "$(prepareArgumentPairs --a=aaa --b=bbb)" \
    : "a=aaa b=bbb"

assertEquals \
    : "$(prepareArgumentPairs --a=aaa --b=bbb --c=ccc)" \
    : "a=aaa b=bbb c=ccc"

# - - - - - - - - - - - - - - - - - - - - - - - - 
