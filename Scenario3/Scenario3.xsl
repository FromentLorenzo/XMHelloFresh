<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="commandeKey" match="Commande" use="@id"/>
    <xsl:key name="menuKey" match="Menu" use="@id"/>
    <xsl:key name="recetteKey" match="Recette" use="@id"/>
    <xsl:key name="utilisateurKey" match="Utilisateur" use="@id"/>
    <xsl:key name="livreurKey" match="Livreur" use="@id"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Détails des commandes</title>
                <link rel="stylesheet" type="text/css" href="style3.css"/>
            </head>
            <body>
                <h1>Détails des commandes par Livreur</h1>
                <xsl:apply-templates select="//Commande"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="Commande">
        <xsl:variable name="livreurId" select="Livreur/@idLivreur"/>
        <xsl:for-each select="//Commande[Livreur/@idLivreur = $livreurId]">
            <xsl:sort select="Livreur/@idLivreur"/>
            <xsl:if test="position() = 1">
                <h2>Livreur: <xsl:value-of select="key('livreurKey', $livreurId)/Nom"/></h2>
            </xsl:if>
            <xsl:if test="Utilisateur and Menu">
                <div class="command">
                    <div class="left-content">
                        <h3>Commande ID: <xsl:value-of select="@id"/></h3>
                        <xsl:variable name="utilisateurId" select="Utilisateur/@idUtilisateur"/>
                        <xsl:variable name="utilisateurName" select="key('utilisateurKey', $utilisateurId)/Nom"/>
                        <p><strong>Nom de l'Utilisateur: <xsl:value-of select="$utilisateurName"/></strong></p>
                        <p>Date: <xsl:value-of select="Date"/></p>
                        <p>Heure: <xsl:value-of select="Heure"/></p>
                        <p>Adresse: <xsl:value-of select="Adresse"/></p>
                        <p>Numéro de téléphone: <xsl:value-of select="Numéro_de_téléphone"/></p>
                        <p><strong>Statut: <xsl:value-of select="Statut"/></strong></p>
                        <p>Prix: <xsl:value-of select="Prix"/></p>
                    </div>
                    <div class="right-content">
                        <xsl:variable name="menuId" select="Menu/@idMenu"/>
                        <xsl:variable name="menuName" select="key('menuKey', $menuId)/Nom"/>
                        <h4>Nom du Menu: <xsl:value-of select="$menuName"/></h4>
                        <p>Contenu du Menu:</p>
                        <ul>
                            <xsl:for-each select="key('menuKey', $menuId)/Recettes_Du_Menu/Recette_Du_Menu">
                                <xsl:variable name="recetteId" select="@idRecette"/>
                                <li>
                                    <xsl:value-of select="key('recetteKey', $recetteId)/Nom"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                        <div class="image-container">
                            <xsl:for-each select="key('menuKey', $menuId)/Recettes_Du_Menu/Recette_Du_Menu">
                                <xsl:variable name="recetteId" select="@idRecette"/>
                                <img src="{key('recetteKey', $recetteId)/Image}" alt="Image de la recette"/>
                            </xsl:for-each>
                        </div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
