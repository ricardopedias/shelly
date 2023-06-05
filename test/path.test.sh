
THIS_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

THIS_ROOT_PATH=$(dirname $THIS_PATH)

testRoot() {
    assertEquals "$THIS_ROOT_PATH" "$(pathRoot)" 
}

testSrc() {
    assertEquals "$THIS_ROOT_PATH/src" "$(pathSrc)" 
}

testTest() {
    assertEquals "$THIS_ROOT_PATH/test" "$(pathTest)" 
}

testVendor() {
    assertEquals "$THIS_ROOT_PATH/vendor" "$(pathVendor)" 
}

source $DSETUP_INIT
source $DSETUP_SHUNIT
