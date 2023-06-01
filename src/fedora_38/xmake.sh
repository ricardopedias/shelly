
if command -v xmake &> /dev/null; then
    showCheckbox yes "XMake builder"
    return
fi

showCheckbox no "XMake builder"
showMuted "Instalando..."
sudo dnf -y install readline-devel ccache bzip2
sudo dnf -y groupinstall 'Development Tools'
wget https://xmake.io/shget.text -O - | bash
showCheckbox yes "XMake builder"
