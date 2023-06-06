
testLine()
{
    assertEquals "+---+" "$(shapeLine 1)"
    assertEquals "+----+" "$(shapeLine 2)"
    assertEquals "+------------+" "$(shapeLine 10)"
}

testLineText()
{
    assertEquals "| Ricardo |" "$(shapeLineText 1 Ricardo)"
    assertEquals "| Ricardo |" "$(shapeLineText 2 Ricardo)"
    assertEquals "| Ricardo    |" "$(shapeLineText 10 Ricardo)"
}

# TODO:
# shapeLineFull
# shapeLineTextFull
# shapeBlock
# shapeBlockAuto
# shapeBlockFull

source $DSETUP_INIT
source $DSETUP_SHUNIT
