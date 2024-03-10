# XMHelloFresh
Pour voir les scénarios, une manière simple est de double cliquer sur le fichier run qui va lancer un serveur en local et vous ouvrir le localhost.
Ensuite il suffit de se rendre dans le dossier du scénario souhaité et de cliquer sur le xml



# Consignes

Modélisation d'une base de données XML pour le système d'information d'une entreprise de "boîtes à recettes" (cook/recipe boxes).  Vous pouvez trouver des descriptions de telles sociétés sur leurs sites web (e.g. HelloFresh),  également à partir de la revue du journal BBC Good Food.

Vous devez envisager la gestion des recettes et des menus proposés, des ingrédients, mais aussi des commandes, des commentaires des clients, des livreurs... La description des recettes et des ingrédients doit intégrer différents aspects : par exemple gastronomie, santé, budget, etc.

Écrivez un schéma XML qui formalise votre modèle.
Écrivez un document XML valide par rapport à ce modèle de document, contenant un extrait représentatif des données.
Imaginez 3 scénarios nécessitant la visualisation d'une partie de ces données XML dans le format textuel de votre choix (e.g. HTML), et écrivez 3 feuilles de style XSLT pour cela (le traitement passe par l'utilisation de templates XSL dans votre feuille de style). Pour une sortie HTML au moins prévoyez une feuille de style CSS et insérez l'instruction de traitement automatiquement via la feuille de style XSLT.
Imaginez un 4ème scénario nécessitant l'exploitation d'une partie de ces données XML selon une nouvelle structuration en XML et écrivez une feuille de style pour générer automatiquement cette nouvelle base de données XML. Produisez le schéma XML de vos données de sortie.
Imaginez un 5ème scénario nécessitant l'exploitation d'une partie de ces données XML selon une nouvelle structuration et dans le format JSON et écrivez une feuille de style pour générer automatiquement cette base de données JSON. Produisez le schéma JSON de vos données de sortie.
Imaginez un 5ème scénario nécessitant l'exploitation d'une partie de ces données XML que vous implémenterez dans un programme Java ou Python.
Rédigez un court rapport (4 pages max) décrivant vos choix de modélisation et les avantages et inconvénients de votre modélisation, ainsi que vos scénarios et leur implémentation.
Préparez une présentation powerpoint de votre projet de 10 mn. 
Vous serez évalué en fonction de la qualité et richesse de votre schéma de données (généricité du modèle et finesse des contraintes), de la qualité des scénarios imaginés et de la qualité de vos feuilles de style (ne vous limitez pas à des choses trop simples, préférez un style de programmation XSLT fonctionnel et qui exploite XPath).

Déposez un zip contenant :

Votre rapport au format pdf
Votre présentation powerpoint au format pdf
Votre fichier XML
Votre fichier XML Schema
Vos fichiers XSLT
Votre code source Java ou Python
Les fichiers output produits
