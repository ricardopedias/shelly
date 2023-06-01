
if command -v cmake &> /dev/null; then
    showCheckbox yes "CMake builder"
    return
fi

showCheckbox no "CMake builder"
showMuted "Instalando..."
sudo dnf -y install cmake
showCheckbox yes "CMake builder"
