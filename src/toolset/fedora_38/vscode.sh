
if [[ -f "/etc/yum.repos.d/vscode.repo" ]]; then
    showCheckbox yes "Visual Studio Code"
    return
fi

showCheckbox no "Visual Studio Code"
showMuted "Instalando..."

showInfo "Configurando repositório da Microsoft..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
showSuccess "Repositório da Microsoft configurado"

showInfo "Instalando Visual Studio Code..."
dnf check-update
sudo dnf -y install code
showSuccess "Visual Studio Code instalado"

showInfo "Instalando extensões para C e C++..."
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cmake-tools
code --install-extension eamodio.gitlens
showSuccess "Extensões para C e C++ instaladas"

showInfo "Instalando fonte Fira Code para ligaduras..."
sudo dnf -y install fira-code-fonts
showSuccess "Fonte Fira Code instalada"

showCheckbox yes "Visual Studio Code"
