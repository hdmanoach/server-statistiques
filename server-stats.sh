#!/bin/bash
menu() {
    echo "Menu"
    echo "1) la version du système d'exploitation"
    echo "2) la date et l'heure actuelles"
    echo "3) la version du noyau"
    echo "4) la durée de fonctionnement"
    echo "5) la charge moyenne"
    echo "6) le nombre d'utilisateurs connectés"
    echo "7) les tentatives de connexion infructueuses"
    echo "8) Utilisation totale du processeur"
    echo "9) Utilisation totale de la memoire"
    echo "10) Utilisation totale du disque"
    echo "11) Les 5 processus les plus gourmands en ressources CPU"
    echo "12) Les 5 processus les plus gourmands en mémoire"
    echo "13) Quitter"
}
version_syst() {
    echo "=== Version du système d'exploitation ==="
    lsb_release -a
}
version_noyau() {
    echo "=== Version du noyau ==="
    uname -r
}
date_heure() {
    echo "=== Date et heure actuelles ==="
    date
}

duree_fonctionnement() {
    echo "=== Duree de fonctionnement ==="
    uptime
}
charge_moyenne() {
    echo "=== Charge moyenne ==="
    uptime | awk '{print $8}'
}

users_connectes() {
    echo "=== Nombre d'utilisateurs connectés ==="
    who | wc -l
}

tentatives_connexion_infructueuses() {
    echo "=== Tentatives de connexion infructueuses ==="
    grep "Failed password" /var/log/auth.log | wc -l
}

utilisation_totale_processeur() {
    echo "=== Utilisation totale du processeur ==="
    top -b -n1 | grep "Cpu(s)" | awk '{print $2}'
}

utilisation_totale_memoire() {
    echo "=== Utilisation totale de la memoire ==="
    free -m | grep Mem | awk '{print $3}'
}

utilisation_totale_disque() {
    echo "=== Utilisation totale du disque ==="
    df -h | awk '$NF=="/"{printf "Disque Utilisé: %s, Disque Libre: %s, %s\n", $3, $4, $5}'
}

processus_plus_gourmands_cpu() {
    echo "=== 5 processus les plus gourmands en ressources CPU ==="
    ps -eo user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command --sort=-%cpu | head -n 6 | column -t
}


processus_plus_gourmands_memoire() {
    echo "=== 5 processus les plus gourmands en mémoire ==="
    ps aux --sort=-%mem | head -n 6
}

while true; do
    menu
    read -p "Votre choix: " choix
    case $choix in
    1) version_syst ;;
    2) date_heure ;;
    3) version_noyau ;;
    4) duree_fonctionnement ;;
    5) charge_moyenne ;;
    6) users_connectes ;;
    7) tentatives_connexion_infructueuses ;;
    8) utilisation_totale_processeur ;;
    9) utilisation_totale_memoire ;;
    10) utilisation_totale_disque ;;
    11) processus_plus_gourmands_cpu ;;
    12) processus_plus_gourmands_memoire ;;
    13) exit ;;
    *) echo "Choix invalide" ;;
    esac

    echo "================================"
done