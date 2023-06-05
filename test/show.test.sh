
testText()
{
    assertEquals "✖ ícone de erro" "$(showText error ícone de erro)"
    assertEquals "✔ ícone de ok" "$(showText ok ícone de ok)"
    assertEquals "● ícone de ponto" "$(showText dot ícone de ponto)"
    assertEquals "🖝 ícone de indicador" "$(showText hand ícone de indicador)"
    assertEquals "🖝 ícone de indicador" "$(showText hand ícone de indicador)"
    assertEquals "► ícone de ceta" "$(showText arrow ícone de ceta)"
    assertEquals "  espaço alinhado" "$(showText space espaço alinhado)"
    assertEquals "somente texto" "$(showText none somente texto)"
}

testMessages()
{   
    assertEquals "$(inRed ✖ mensagem textual)" "$(showError mensagem textual)"
    assertEquals "$(inBlue 🖝 mensagem textual)" "$(showInfo mensagem textual)"
    assertEquals "  mensagem textual" "$(showMuted mensagem textual)"
    assertEquals "$(inGreen ✔ mensagem textual)" "$(showSuccess mensagem textual)"
    assertEquals "$(inYellow ● mensagem textual)" "$(showWarning mensagem textual)"
    assertEquals "► mensagem textual" "$(showItem mensagem textual)"
}

testCheckbox()
{
    assertEquals 2 2
}

source $DSETUP_INIT
source $DSETUP_SHUNIT
