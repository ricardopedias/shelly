
if [[ -f "/etc/yum.repos.d/google-chrome.repo" ]]; then
    showCheckbox yes "Google Chrome"
    return
fi

showCheckbox no "Google Chrome"
showMuted "Instalando..."

showInfo "Configurando repositório do Google..."
sudo dnf config-manager --set-enabled google-chrome
showSuccess "Repositório do Google configurado"

showInfo "Instalando Google Chrome..."
sudo dnf -y install google-chrome-stable
showSuccess "Google Chrome instalado"

showCheckbox yes "Google Chrome"
