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

        <!-- Utilisation de distinct-values pour obtenir des notes uniques -->
        <xsl:for-each select="//Commentaire[Note = '0/5' or Note = '1/5' or Note = '2/5']">
          <!-- Récupère la note actuelle -->
          <xsl:variable name="currentNote" select="Note"/>
          
          <!-- Vérifie si la note est 0/5, 1/5 ou 2/5 -->
          <xsl:if test="$currentNote = '0/5' or $currentNote = '1/5' or $currentNote = '2/5'">
            <!-- Affiche un titre en fonction de la note -->
            <h3>Notes <xsl:value-of select="$currentNote"/></h3>

            <!-- Parcours tous les commentaires pour cette note -->
            <xsl:for-each select="//Commentaire[Note = $currentNote]">
              <div class="comment">
                <h2>Utilisateur: <xsl:value-of select="Utilisateur/Nom"/></h2>
                <a id="NomMenu">Note : </a><a> <xsl:value-of select="$currentNote"/></a>
                
                <!-- Utilisation de la clé pour récupérer le nom du menu -->
                <xsl:variable name="menuId" select="Commande/@idCommande"/>
                <xsl:variable name="menuName" select="key('menuKey', key('commandeKey', $menuId)/Menu/@idMenu)/Nom"/>
                <p><a id="NomMenu">Nom du Menu:</a><a><xsl:value-of select="$menuName"/></a> </p>
                <a id="NomMenu">Commentaire: </a><a> <xsl:value-of select="Texte"/></a>
              </div>
            </xsl:for-each>
          </xsl:if>
        </xsl:for-each>

      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
