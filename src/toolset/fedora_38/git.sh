
if command -v git &> /dev/null; then
    showCheckbox yes "Git"
else
    showCheckbox no "Git"
    showMuted "Instalando..."
    sudo dnf -y install git
    showCheckbox yes "Git"
fi

CURRENT_GIT_EMAIL=$(git config --global user.email)
GIT_RECONFIG="none"

if [[ "$CURRENT_GIT_EMAIL" != "" ]]; then
    showCheckbox yes "Usuário do Git"
    showInfo "Já existe uma configuração para $CURRENT_GIT_EMAIL"

    read -p "🖝 Deseja mudar essa configuração? [Sn]" GIT_RECONFIG

    if [[ "$GIT_RECONFIG" == "n" ]]; then
        return
    fi
fi

if [[ "$GIT_RECONFIG" == "none" ]]; then
    showCheckbox no "Usuário do Git"
fi

read -p "   🖝 Forneça o email para commits do Git: " GIT_EMAIL
read -p "   🖝 Forneça o nome do usuário para commits do Git: " GIT_USERNAME

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_USERNAME"

showCheckbox yes "Usuário do Git"
