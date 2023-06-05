
pathRoot()
{
    corePath=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
    srcPath=$(dirname "$corePath")
    echo $(dirname "$srcPath")
}

pathSrc()
{

    echo "$(pathRoot)/src"
}

pathTest()
{
    echo "$(pathRoot)/test"
}

pathVendor()
{
    echo "$(pathRoot)/vendor"
}
