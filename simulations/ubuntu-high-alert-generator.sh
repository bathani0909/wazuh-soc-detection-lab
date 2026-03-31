#!/bin/bash

echo "========================================="
echo " Ubuntu High/Critical Alert Generator"
echo "========================================="

show_menu() {
    echo ""
    echo "1) Generate suspicious sudo attempts"
    echo "2) Modify sensitive monitored file (Critical)"
    echo "3) Create suspicious process marker"
    echo "4) Exit"
    echo ""
}

sudo_attempts() {
    echo "[*] Generating suspicious sudo attempts..."
    for i in {1..5}; do
        sudo -k
        echo "wrongpassword" | sudo -S whoami >/dev/null 2>&1
    done
    echo "[+] Done. Check Wazuh for privilege escalation / sudo alerts."
}

modify_sensitive_file() {
    echo "[*] Modifying monitored sensitive file..."
    echo "Unauthorized change at $(date)" | sudo tee -a /opt/wazuh-watch/critical_file.txt >/dev/null
    echo "[+] Done. This should trigger a CRITICAL FIM alert."
}

suspicious_process_marker() {
    echo "[*] Creating suspicious process marker..."
    logger "Suspicious process execution simulation: nc -lvnp 4444"
    echo "[+] Marker written to syslog."
}

while true; do
    show_menu
    read -p "Enter choice: " choice

    case $choice in
        1) sudo_attempts ;;
        2) modify_sensitive_file ;;
        3) suspicious_process_marker ;;
        4) echo "Exiting."; break ;;
        *) echo "Invalid choice." ;;
    esac
done