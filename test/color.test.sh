
testStart()
{
    assertEquals \
        "$(echo -e "${DSETUP_BLUE}Mensagem textual")" \
        "$(echo -e "$(startBlue)Mensagem textual")"

    assertEquals \
        "$(echo -e "${DSETUP_GREEN}Mensagem textual")" \
        "$(echo -e "$(startGreen)Mensagem textual")"

    assertEquals \
        "$(echo -e "${DSETUP_RED}Mensagem textual")" \
        "$(echo -e "$(startRed)Mensagem textual")"

    assertEquals \
        "$(echo -e "${DSETUP_YELLOW}Mensagem textual")" \
        "$(echo -e "$(startYellow)Mensagem textual")"
}

testEnd()
{
    assertEquals \
        "$(echo -e "${DSETUP_BLUE}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(startBlue)Mensagem textual$(endColor)")"

    assertEquals \
        "$(echo -e "${DSETUP_BLUE}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(startBlue)Mensagem textual$(endBlue)")"

    assertEquals \
        "$(echo -e "${DSETUP_GREEN}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(startGreen)Mensagem textual$(endGreen)")"

    assertEquals \
        "$(echo -e "${DSETUP_RED}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(startRed)Mensagem textual$(endRed)")"

    assertEquals \
        "$(echo -e "${DSETUP_YELLOW}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(startYellow)Mensagem textual$(endYellow)")"
}

testIn()
{
    assertEquals \
        "$(echo -e "${DSETUP_BLUE}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(inBlue Mensagem textual)")"

    assertEquals \
        "$(echo -e "${DSETUP_GREEN}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(inGreen Mensagem textual)")"

    assertEquals \
        "$(echo -e "${DSETUP_RED}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(inRed Mensagem textual)")"

    assertEquals \
        "$(echo -e "${DSETUP_YELLOW}Mensagem textual${DSETUP_NC}")" \
        "$(echo -e "$(inYellow Mensagem textual)")"
}

source $DSETUP_INIT
source $DSETUP_SHUNIT
