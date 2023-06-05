
startBlue()
{
    echo -e "$DSETUP_BLUE"
}

endBlue()
{ 
    echo -e "$DSETUP_NC"
}

inBlue()
{
    echo -e "$(startBlue)$@$(endBlue)"
}

startGreen()
{
    echo -e "$DSETUP_GREEN"
}

endGreen()
{ 
    echo -e "$DSETUP_NC"
}

inGreen()
{
    echo -e "$(startGreen)$@$(endGreen)"
}

startRed()
{
    echo -e "$DSETUP_RED"
}

endRed()
{ 
    echo -e "$DSETUP_NC"
}

inRed()
{
    echo -e "$(startRed)$@$(endRed)"
}

startYellow()
{
    echo -e "$DSETUP_YELLOW"
}

endYellow()
{ 
    echo -e "$DSETUP_NC"
}

inYellow()
{
    echo -e "$(startYellow)$@$(endYellow)"
}
