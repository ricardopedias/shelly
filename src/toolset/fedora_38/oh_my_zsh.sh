
if [[ -f "$HOME/.zshrc" ]]; then
    showCheckbox yes "Oh My Zsh"
    return
fi

showCheckbox no "Oh My Zsh"
showMuted "Instalando..."

showInfo "Preparando repositório do Oh My Zsh..."
dnf check-update
sudo dnf -y install zsh util-linux-user
chsh -s $(which zsh)
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
showSuccess "Oh My Zsh instalado"

showInfo "Instalando plugins..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
cat <<EOF >> ~/.zshrc
ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
EOF
showSuccess "Plugins instalados"

source ~/.zshrc

showCheckbox yes "Oh My Zsh"
