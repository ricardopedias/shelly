
startBlue() {
    echo -e "\e[0;34m"
}

endBlue() { 
    echo -e "\e[0m"
}

inBlue() {
    echo -e "\e[0;34m$@\e[0m"
}

startGreen() {
    echo -e "\e[0;32m"
}

endGreen() { 
    echo -e "\e[0m"
}

inGreen() {
    echo -e "\e[0;32m$@\e[0m"
}

startRed() {
    echo -e "\e[0;31m"
}

endRed() { 
    echo -e "\e[0m"
}

inRed() {
    echo -e "\e[0;31m$@\e[0m"
}

startYellow() {
    echo -e "\e[1;33m"
}

endYellow() { 
    echo -e "\e[0m"
}

inYellow() {
    echo -e "\e[1;33m$@\e[0m"
}
