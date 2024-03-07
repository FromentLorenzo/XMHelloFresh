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
        <xsl:apply-templates select="//Commentaire"/>
      </body>
    </html>
  </xsl:template>

  <!-- Template for Commentaire elements -->
  <xsl:template match="Commentaire">
    <div class="comment">
      <h2>Utilisateur: <xsl:value-of select="Utilisateur/Nom"/></h2>
      <p>Note: <xsl:value-of select="Note"/></p>
      <p>Commande ID: <xsl:value-of select="Commande/@idCommande"/></p>
      <!-- Utilisation de la clé pour récupérer le nom du menu -->
      <xsl:variable name="menuId" select="Commande/@idCommande"/>
      <xsl:variable name="menuName" select="key('menuKey', key('commandeKey', $menuId)/Menu/@idMenu)/Nom"/>
      <p>Nom du Menu: <xsl:value-of select="$menuName"/></p>
      <p>Commentaire: <xsl:value-of select="Texte"/></p>
    </div>
  </xsl:template>

</xsl:stylesheet>
