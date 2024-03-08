<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="commandeKey" match="Commande" use="@id"/>
    <xsl:key name="menuKey" match="Menu" use="@id"/>
    <xsl:key name="recetteKey" match="Recette" use="@id"/>
    <xsl:key name="utilisateurKey" match="Utilisateur" use="@id"/>
    <xsl:key name="livreurKey" match="Livreur" use="@id"/>

    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Détails des commandes</title>
                <link rel="stylesheet" type="text/css" href="style3.css"/>
            </head>
            <body>
                <h1>Détails des commandes</h1>
                <xsl:apply-templates select="//Commande"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template for Commande elements -->
    <xsl:template match="Commande">
        <div class="command">
            <div class="left-content">
                <h2>Commande ID: <xsl:value-of select="@id"/></h2>
                <!-- Utilisation de la clé pour récupérer le nom de l'utilisateur -->
                <xsl:variable name="utilisateurId" select="Utilisateur/@idUtilisateur"/>
                <xsl:variable name="utilisateurName" select="key('utilisateurKey', $utilisateurId)/Nom"/>
                <p style="margin-top: 30px;"><strong>Nom de l'Utilisateur: <xsl:value-of select="$utilisateurName"/></strong></p>
                <p>Date: <xsl:value-of select="Date"/></p>
                <p>Heure: <xsl:value-of select="Heure"/></p>
                <p>Adresse: <xsl:value-of select="Adresse"/></p>
                <p>Numéro de téléphone: <xsl:value-of select="Numéro_de_téléphone"/></p>
                <!-- Utilisation de la clé pour récupérer le nom du livreur -->
                <xsl:variable name="livreurId" select="Livreur/@idLivreur"/>
                <xsl:variable name="livreurName" select="key('livreurKey', $livreurId)/Nom"/>
                <p style="margin-top: 30px;"><strong>Nom du Livreur: <xsl:value-of select="$livreurName"/></strong></p>
                <p>Statut: <xsl:value-of select="Statut"/></p>
                <p>Prix: <xsl:value-of select="Prix"/></p>
            </div>
            <div class="right-content">
                <!-- Utilisation de la clé pour récupérer le nom du menu -->
                <xsl:variable name="menuId" select="Menu/@idMenu"/>
                <xsl:variable name="menuName" select="key('menuKey', $menuId)/Nom"/>
                <h3>Nom du Menu: <xsl:value-of select="$menuName"/></h3>
                <p>Contenu du Menu:</p>
                <ul>
                    <!-- Boucle sur les recettes du menu -->
                    <xsl:for-each select="key('menuKey', $menuId)/Recettes_Du_Menu/Recette_Du_Menu">
                        <xsl:variable name="recetteId" select="@idRecette"/>
                        <li>
                            <!-- Utilisation de la clé pour récupérer le nom de la recette -->
                            <xsl:value-of select="key('recetteKey', $recetteId)/Nom"/>
                        </li>
                    </xsl:for-each>
                </ul>
                <div class="image-container">
                    <!-- Boucle sur les recettes du menu -->
                    <xsl:for-each select="key('menuKey', $menuId)/Recettes_Du_Menu/Recette_Du_Menu">
                        <xsl:variable name="recetteId" select="@idRecette"/>
                        <!-- Afficher l'image de la recette -->
                        <img src="{key('recetteKey', $recetteId)/Image}" alt="Image de la recette"/>
                    </xsl:for-each>
                </div>
            </div>
            <div style="clear:both;"></div> <!-- Ajout pour assurer le bon affichage des éléments flottants -->
        </div>
    </xsl:template>


</xsl:stylesheet>