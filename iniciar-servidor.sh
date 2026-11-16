#!/bin/bash
# ---------------------------------------------------------------
# iniciar-servidor.sh
# Sobe um servidor Python (http.server) na pasta onde este script
# está e abre a página do projeto no navegador padrão. Se o servidor
# já estiver rodando, apenas abre a página.
#
# Uso: dê duplo clique no arquivo ou rode ./iniciar-servidor.sh
# Opcional: passar outra porta como argumento (padrão: 8080),
#            ex.: ./iniciar-servidor.sh 8080
# ---------------------------------------------------------------

cd "$(dirname "$(readlink -f "$0")")" || exit 1

PORTA="${1:-8080}"
LOG="/tmp/servidor-local-${PORTA}.log"

# Descobre qual página abrir: index.html tem preferência; senão, a versão
# mais recente entre os .html/.htm da pasta (ordenação por número de versão)
PAGINA=""
if [ ! -f "index.html" ]; then
    PAGINA="$(find . -maxdepth 1 -type f \( -iname '*.html' -o -iname '*.htm' \) -printf '%f\n' 2>/dev/null | sort -V | tail -n1)"
    if [ -z "$PAGINA" ]; then
        echo "Nenhum arquivo .html encontrado em $(pwd)."
        exit 1
    fi
fi
URL="http://localhost:${PORTA}/${PAGINA// /%20}"   # espaços viram %20 na URL

SERVIDOR_PID="$(pgrep -f "^([^ ]*/)?python3? -m http\.server ${PORTA}( |\$)" | head -n1)"

if [ -n "$SERVIDOR_PID" ]; then
    # Já há um servidor nessa porta: reaproveita, desde que sirva esta pasta
    PASTA_SERVIDOR="$(readlink "/proc/${SERVIDOR_PID}/cwd")"
    if [ "$PASTA_SERVIDOR" != "$(pwd -P)" ]; then
        echo "A porta ${PORTA} já serve outra pasta: ${PASTA_SERVIDOR}"
        echo "Pare esse servidor (./parar-servidor.sh ${PORTA}) ou use outra porta."
        exit 1
    fi
    MENSAGEM="Servidor já estava rodando"
else
    # Inicia o servidor em segundo plano (fica vivo mesmo após fechar o terminal)
    nohup python3 -m http.server "${PORTA}" </dev/null >"$LOG" 2>&1 &
    SERVIDOR_PID=$!
    disown
    MENSAGEM="Servidor local iniciado"

    # Espera o servidor aceitar conexões (até ~10 segundos)
    PRONTO=""
    for _ in $(seq 1 20); do
        if ! kill -0 "$SERVIDOR_PID" 2>/dev/null; then
            echo "O servidor não iniciou (a porta ${PORTA} pode estar em uso por outro programa)."
            cat "$LOG"
            exit 1
        fi
        if command -v curl >/dev/null 2>&1; then
            curl -sf -o /dev/null "http://127.0.0.1:${PORTA}/" && { PRONTO=1; break; }
        fi
        sleep 0.5
    done
    if [ -z "$PRONTO" ] && command -v curl >/dev/null 2>&1; then
        echo "O servidor não respondeu a tempo. Veja o log: ${LOG}"
        exit 1
    fi
fi

# Abre o navegador padrão (em sessão própria, para o script não ficar
# preso e o navegador não fechar junto com o terminal)
if command -v xdg-open >/dev/null 2>&1; then
    setsid -f xdg-open "$URL" >/dev/null 2>&1
else
    echo "Abra manualmente no navegador: $URL"
fi

# Notificação no desktop (se disponível)
if command -v notify-send >/dev/null 2>&1; then
    notify-send "$MENSAGEM" "Abrindo $URL (PID ${SERVIDOR_PID})" 2>/dev/null
fi

echo "${MENSAGEM}: $URL (PID ${SERVIDOR_PID}, log em ${LOG})"
echo "Para parar: ./parar-servidor.sh ${PORTA}"
