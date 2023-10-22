#!/bin/bash

# Fonction pour récupérer les ventes de chaque carte graphique
get_sales() {
    local cards=("rtx3060" "rtx3070" "rtx3080" "rtx3090" "rx6700")
    for card in "${cards[@]}"; do
        local url="http://0.0.0.0:5000/$card"
        local response=$(curl -s "$url")
        echo "$response" >> sales.txt
    done
}

# Supprimer le fichier sales.txt s'il existe déjà
[ -f sales.txt ] && rm sales.txt

# Récupérer les ventes de chaque carte graphique et écrire les informations dans sales.txt
echo "$(date)" >> sales.txt
get_sales
echo >> sales.txt
