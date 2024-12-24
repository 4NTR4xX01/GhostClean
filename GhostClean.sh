#!/bin/bash

# Archivo temporal para comandos ejecutados
LOG_FILE="/tmp/pentest_commands.log"

# Banner de la herramienta
banner() {
    clear
    echo -e "\033[0;31m
 ██████╗ ██╗  ██╗ ██████╗ ███████╗████████╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗
██╔════╝ ██║  ██║██╔═══██╗██╔════╝╚══██╔══╝██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║
██║  ███╗███████║██║   ██║███████╗   ██║   ██║     ██║     █████╗  ███████║██╔██╗ ██║
██║   ██║██╔══██║██║   ██║╚════██║   ██║   ██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║
╚██████╔╝██║  ██║╚██████╔╝███████║   ██║   ╚██████╗███████╗███████╗██║  ██║██║ ╚████║
 ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝
                                                    By: 4NTR4xX
\033[0m"
}


capture_commands() {
    touch "$LOG_FILE"
    chmod 600 "$LOG_FILE"
    PROMPT_COMMAND='echo -e "$(date +"%Y-%m-%d %H:%M:%S") \033[1;31m[Command]\033[0m $(history 1 | sed "s/^ *[0-9]* *//")" >> "$LOG_FILE"'
}


monitor_logs() {
    local dirs_to_watch=("/var/log/" "/tmp/" "$HOME/")
    echo "[+] Monitoreando directorios para generación de logs..."
    inotifywait -m -r "${dirs_to_watch[@]}" --format '%w%f' -e create 2>/dev/null |
    while read -r file; do
        echo -e "$(date +"%Y-%m-%d %H:%M:%S") \033[1;31m[Log]\033[0m Log detectado: $file"
        echo "$(date +"%Y-%m-%d %H:%M:%S") [+] Log detectado: $file" >> "$LOG_FILE"
    done &
}


secure_delete() {
    echo "[+] Eliminando registros de manera segura..."
    shred -u -n 5 "$LOG_FILE" 2>/dev/null
    find /var/log/ /tmp/ "$HOME/" -type f -name "*.log" -exec shred -u {} \; 2>/dev/null
    echo "[+] Limpieza completada."
}


cleanup() {
    echo -e "\033[1;33m[!] Interrupción detectada. Limpiando registros...\033[0m"
    secure_delete
    exit 0
}
trap cleanup SIGINT SIGTERM


main() {
    banner
    echo "[+] Iniciando Monitoreo..."
    capture_commands
    monitor_logs &

   
    tail -f "$LOG_FILE" &
    
    
    while true; do
        sleep 1
    done
}

# Verificación de dependencias
dependencies=("shred" "inotifywait")
for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        echo -e "\033[1;31m[!] Dependencia faltante: $dep. Instálala antes de continuar.\033[0m"
        exit 1
    fi
done

main
