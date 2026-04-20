#!/bin/bash

# Função auxiliar para verificar se um comando existe no sistema
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Verificando o ambiente..."

# Verifica se o Python (python ou python3) está instalado
if command_exists python3 || command_exists python; then
    echo "✅ Python já foi detectado na máquina."
else
    echo "⚠️ Python não encontrado na máquina."
fi

# Verifica se o 'uv' já está instalado. Se não estiver, realiza a instalação standalone
if command_exists uv; then
    echo "✅ Utilitário 'uv' já está instalado."
else
    echo "⏳ O utilitário 'uv' não foi encontrado. Iniciando a instalação do 'uv'..."
    
    # Este comando baixa e executa o script de instalação oficial da Astral (criadora do uv).
    # Ele instala APENAS o executável do uv, sem depender de Python pré-existente.
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    echo "🎉 Instalação do 'uv' concluída com sucesso!"
    echo ""
    echo "⚠️ IMPORTANTE: O executável foi instalado no seu diretório de usuário."
    echo "Para poder usar o comando 'uv' imediatamente nesta aba do terminal, execute:"
    echo "source \$HOME/.local/bin/env"
    echo "Ou simplesmente feche e abra o terminal novamente."
fi
