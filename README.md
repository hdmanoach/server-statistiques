# Server Stats Script

Script Bash interactif pour afficher des statistiques de performance système sur un serveur Linux.

## Objectif

Le script `server-stats.sh` permet de consulter rapidement des informations serveur utiles pour le monitoring de base:

- version du système d'exploitation
- date et heure
- version du noyau
- durée de fonctionnement
- charge moyenne
- nombre d'utilisateurs connectés
- tentatives de connexion infructueuses
- utilisation CPU
- utilisation mémoire
- utilisation disque
- top 5 processus CPU
- top 5 processus mémoire

## Prérequis

- Linux
- Bash
- commandes disponibles: `lsb_release`, `uname`, `date`, `uptime`, `who`, `grep`, `top`, `free`, `df`, `ps`, `awk`, `column`

## Installation

1. Rendre le script exécutable:

```bash
chmod +x server-stats.sh
```

2. Lancer le script:

```bash
./server-stats.sh
```

## Utilisation

Le script affiche un menu interactif. Entrez le numéro correspondant à l'information souhaitée:

1. Version du système d'exploitation  
2. Date et heure actuelles  
3. Version du noyau  
4. Durée de fonctionnement  
5. Charge moyenne  
6. Nombre d'utilisateurs connectés  
7. Tentatives de connexion infructueuses  
8. Utilisation totale du processeur  
9. Utilisation totale de la mémoire  
10. Utilisation totale du disque  
11. Top 5 processus CPU  
12. Top 5 processus mémoire  
13. Quitter

## Notes

- L'option `7` lit `/var/log/auth.log`. Selon la distribution et les permissions, il peut être nécessaire d'exécuter le script avec des droits élevés.
- Certains formats de sortie peuvent varier selon la distribution Linux.

## Fichier principal

- `server-stats.sh`
