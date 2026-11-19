
#!/bin/bash

set -Eeuo pipefail

DOSSIER=${1:-data}
BACKUP_DIR="backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

if [ ! -d "$DOSSIER" ]; then
    echo "Erreur : le dossier $DOSSIER n'existe pas." >&2
    exit 1
fi

mkdir -p "$BACKUP_DIR"

ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"

echo "Création de la sauvegarde..."

tar -czf "$ARCHIVE" -C "$(dirname "$DOSSIER")" "$(basename "$DOSSIER")"

echo "Sauvegarde créée : $ARCHIVE"

echo "Suppression des sauvegardes de plus de 7 jours..."

find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +7 -print -delete

echo "Sauvegarde terminée avec succès."

exit 0
