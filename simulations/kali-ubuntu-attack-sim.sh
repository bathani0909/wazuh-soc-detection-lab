#!/bin/bash

UBUNTU_TARGET="192.168.101.139"

echo "========================================="
echo " Kali -> Ubuntu Alert Generator"
echo "========================================="

show_menu() {
    echo ""
    echo "1) SSH brute-force style attempts"
    echo "2) Invalid user SSH attempts"
    echo "3) Port scan"
    echo "4) Aggressive recon scan"
    echo "5) Exit"
    echo ""
}

ssh_bruteforce() {
    echo "[*] Running repeated SSH attempts..."
    for i in {1..15}; do
        timeout 3 ssh fakeuser@$UBUNTU_TARGET "exit" 2>/dev/null
    done
    echo "[+] Done."
}

invalid_users() {
    USERS=("admin1" "backup" "oracle" "guest123" "finance" "tempuser")
    for user in "${USERS[@]}"; do
        echo "[*] Trying $user"
        timeout 3 ssh $user@$UBUNTU_TARGET "exit" 2>/dev/null
    done
    echo "[+] Done."
}

port_scan() {
    sudo nmap -sS -Pn -T4 $UBUNTU_TARGET
}

aggressive_scan() {
    sudo nmap -A -Pn $UBUNTU_TARGET
}

while true; do
    show_menu
    read -p "Enter choice: " choice

    case $choice in
        1) ssh_bruteforce ;;
        2) invalid_users ;;
        3) port_scan ;;
        4) aggressive_scan ;;
        5) break ;;
        *) echo "Invalid choice." ;;
    esac
done