startBlue()
{
    echo -e "$DSETUP_BLUE"
}

startGreen()
{
    echo -e "$DSETUP_GREEN"
}

startRed()
{
    echo -e "$DSETUP_RED"
}

startYellow()
{
    echo -e "$DSETUP_YELLOW"
}

startNonColor()
{
    echo -e "$DSETUP_NC"    
}

endColor()
{
    startNonColor
}

endBlue()
{ 
    endColor
}

endGreen()
{ 
    endColor
}

endRed()
{ 
    endColor
}

endYellow()
{ 
    endColor
}

inBlue()
{
    echo -e "$(startBlue)$@$(endBlue)"
}

inGreen()
{
    echo -e "$(startGreen)$@$(endGreen)"
}

inRed()
{
    echo -e "$(startRed)$@$(endRed)"
}

inYellow()
{
    echo -e "$(startYellow)$@$(endYellow)"
}
