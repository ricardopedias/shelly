
# 
# Compiladores de executáveis Linux
# 

if command -v g++ &> /dev/null; then
    showCheckbox yes "Compilador GCC"
else
    showCheckbox no "Compilador GCC"
    showMuted "Instalando..."
    sudo dnf -y install gcc-c++
    showCheckbox yes "Compilador GCC"
fi

if command -v clang++ &> /dev/null; then
    showCheckbox yes "Compilador Clang"
else
    showCheckbox no "Compilador Clang"
    showMuted "Instalando..."
    sudo dnf -y install clang
    showCheckbox yes "Compilador Clang"
fi

# 
# Compiladores de executáveis Windows
# 

if command -v x86_64-w64-mingw32-g++ &> /dev/null; then
    showCheckbox yes "Compilador Mingw GCC"
else
    showCheckbox no "Compilador Mingw GCC"
    showMuted "Instalando..."
    sudo dnf -y install mingw64-gcc-c++
    showCheckbox yes "Compilador Mingw GCC"
fi
