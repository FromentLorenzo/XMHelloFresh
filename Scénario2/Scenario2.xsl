<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:key name="commandeKey" match="Commande" use="@id"/>
  <xsl:key name="menuKey" match="Menu" use="@id"/>

  <!-- Main template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Commentaires</title>
        <link rel="stylesheet" type="text/css" href="style2.css"/>
        <!-- Ajoutez d'autres éléments de style ou de script si nécessaire -->
      </head>
      <body>
        <h1>Commentaires</h1>
        <h3>Notes 0⭐</h3>
        <!-- Boucle pour les commentaires avec 0 étoile -->
        <xsl:for-each select="//Commentaire[Note = 0]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>
        <h3>Notes 1⭐</h3>
        <!-- Boucle pour les commentaires avec 1 étoile -->
        <xsl:for-each select="//Commentaire[Note = 1]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>
        <h3>Notes 2⭐</h3>
        <!-- Boucle pour les commentaires avec 2 étoiles -->
        <xsl:for-each select="//Commentaire[Note = 2]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>

        <h3>Notes 3⭐</h3>
        <!-- Boucle pour les commentaires avec 2 étoiles -->
        <xsl:for-each select="//Commentaire[Note = 3]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>

        <h3>Notes 4⭐</h3>
        <!-- Boucle pour les commentaires avec 2 étoiles -->
        <xsl:for-each select="//Commentaire[Note = 4]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>

        <h3>Notes 5⭐</h3>
        <!-- Boucle pour les commentaires avec 2 étoiles -->
        <xsl:for-each select="//Commentaire[Note = 5]">
          
          <xsl:apply-templates select=".">
            <xsl:sort select="Note"/>
          </xsl:apply-templates>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

  <!-- Template pour l'affichage de chaque commentaire -->
  <xsl:template match="Commentaire">
    <div class="comment">
      <h2>Utilisateur: <xsl:value-of select="Utilisateur/Nom"/></h2>
      <a id="NomMenu">Note : </a><a><xsl:value-of select="Note"/></a>

      <!-- Utilisation de la clé pour récupérer le nom du menu -->
      <xsl:variable name="menuId" select="Commande/@idCommande"/>
      <xsl:variable name="menuName" select="key('menuKey', key('commandeKey', $menuId)/Menu/@idMenu)/Nom"/>
      <p><a id="NomMenu">Nom du Menu:</a><a><xsl:value-of select="$menuName"/></a> </p>
      <a id="NomMenu">Commentaire: </a><a><xsl:value-of select="Texte"/></a>
    </div>
  </xsl:template>

</xsl:stylesheet>
