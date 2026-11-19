
# REPONSES - TP N°2 Linux & Scripting Bash

## Exercice 2.1
chmod 644 donne les permissions :
- Propriétaire : lecture et écriture.
- Groupe : lecture.
- Autres : lecture.

Le propriétaire ne peut pas exécuter le fichier.

## Exercice 2.2
Les guillemets autour de "$UTILISATION" permettent de protéger
la variable et d'éviter les problèmes liés aux espaces ou
aux variables vides.

## Exercice 2.3
Sans set -Eeuo pipefail, le script peut continuer après une
erreur et produire un résultat incorrect.

## Exercice 2.4
Cron nécessite des chemins absolus parce que son environnement
d'exécution est différent de celui du terminal interactif.

## Exercice 2.5
Un vrai pipeline CI/CD doit intégrer le build, les tests,
l'analyse de qualité et le déploiement.

Les erreurs possibles doivent être détectées avec des codes
de retour explicites pour chaque étape.
