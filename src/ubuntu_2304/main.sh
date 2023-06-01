
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# OPÇÕES:
# As opções são declaradas no arquivo script/setup.sh
# 
# OPTION_ALL yes|no
# OPTION_SYSTEM none|fedora|ubuntu|windows|macos
# OPTION_RELEASE <versão do sistema>
# OPTION_CHROME yes|no
# OPTION_COMPILERS yes|no
# OPTION_CMAKE yes|no
# OPTION_GIT yes|no
# OPTION_SSH yes|no
# OPTION_VSCODE yes|no
# OPTION_XMAKE yes|no
# OPTION_ZSH yes|no

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_CHROME" == "yes" ]]; then
    source "$SCRIPT_DIR/google_chrome.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_COMPILERS" == "yes" ]]; then
    source "$SCRIPT_DIR/compilers.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_VSCODE" == "yes" ]]; then
    source "$SCRIPT_DIR/vscode.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_ZSH" == "yes" ]]; then
    source "$SCRIPT_DIR/oh_my_zsh.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_CMAKE" == "yes" ]]; then
    source "$SCRIPT_DIR/cmake.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_XMAKE" == "yes" ]]; then
    source "$SCRIPT_DIR/xmake.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_SSH" == "yes" ]]; then
    source "$SCRIPT_DIR/ssh.sh"
fi

if [[ "$OPTION_ALL" == "yes" ]] || [[ "$OPTION_GIT" == "yes" ]]; then
    source "$SCRIPT_DIR/git.sh"
fi
