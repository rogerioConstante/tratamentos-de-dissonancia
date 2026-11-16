#!/bin/bash
# ---------------------------------------------------------------
# parar-servidor.sh
# Para o servidor Python que estiver rodando na porta informada
# (padrão: 8080). Dá para usar por duplo clique ou pelo terminal.
# A aba do navegador não é fechada: o Firefox não permite fechar uma
# aba por script, mas ela deixa de funcionar ao recarregar.
# ---------------------------------------------------------------

PORTA="${1:-8080}"

if pkill -f "^([^ ]*/)?python3? -m http\.server ${PORTA}( |\$)"; then
    echo "Servidor da porta ${PORTA} parado."
else
    echo "Não havia servidor rodando na porta ${PORTA}."
fi
