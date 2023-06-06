
if [[ ! -f "$HOME/.ssh/id_ed25519.pub" ]]; then
    showCheckbox no "SSH Key"
    read -p "   🖝 Forneça seu email para gerar a chave SSH: " EMAIL
    sudo dnf -y install openssh-clients
    ssh-keygen -t ed25519 -C "$EMAIL"
fi

showCheckbox yes "SSH Key"

KEY_CONTENT=$(cat $HOME/.ssh/id_ed25519.pub)

showWarning "Copie a linha abaixo e use em https://github.com/settings/keys"
showMuted $KEY_CONTENT
