gco() {
    # Vérifier si on est dans un dépôt Git
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        echo "Erreur : ce n'est pas un dépôt Git."
        return 1
    fi

    # Vérifier si un message est fourni
    if [ -z "$*" ]; then
        echo "Usage : gco <message>"
        echo "Exemple : gco correction du bug de login"
        echo "Le commit sera formaté automatiquement : [branche] message"
        return 1
    fi

    # Récupérer le nom de la branche
    branch=$(git branch --show-current)

    # Formater le message
    message="[$branch] $*"

    # Faire le commit
    git commit -m "$message"
}
