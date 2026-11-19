
#!/bin/bash

set -Eeuo pipefail

REPO_URL=${1:-}
DEST=${2:-ci-workspace}
LOG_FILE="ci.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

if [ -z "$REPO_URL" ]; then
    log "ERREUR : URL du dépôt manquante."
    exit 1
fi

log "Démarrage du pipeline CI/CD"

# Etape 1 : Clone ou mise à jour
if [ -d "$DEST/.git" ]; then
    log "Mise à jour du dépôt..."
    git -C "$DEST" pull --ff-only
else
    log "Clonage du dépôt..."
    git clone "$REPO_URL" "$DEST"
fi

# Etape 2 : Tests
run_tests() {
    log "Exécution des tests Bash..."

    local failed=0

    for fichier in "$DEST"/*.sh; do
        [ -f "$fichier" ] || continue

        if bash -n "$fichier"; then
            log "Syntaxe correcte : $fichier"
        else
            log "ERREUR : $fichier"
            failed=1
        fi
    done

    return "$failed"
}

if run_tests; then
    log "Pipeline terminé avec succès."
    exit 0
else
    log "Pipeline échoué : erreurs détectées."
    exit 1
fi
