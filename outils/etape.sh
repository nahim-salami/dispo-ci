#!/usr/bin/env bash
# Exécute une étape sans rien afficher de son détail dans le journal public :
# toute la sortie va dans $JOURNAL, chiffré à la fin du travail.
#   outils/etape.sh "Nom de l'étape" commande arguments…
set -uo pipefail
nom="$1"
shift
debut=$(date +%s)
printf '\n===== %s =====\n' "$nom" >> "$JOURNAL"
if "$@" >> "$JOURNAL" 2>&1; then
  echo "✓ $nom ($(( $(date +%s) - debut )) s)"
else
  echo "✗ $nom"
  exit 1
fi
