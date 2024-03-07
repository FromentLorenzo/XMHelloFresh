<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Déclaration de la clé pour faire correspondre les ingrédients par leur ID -->
  <xsl:key name="ingredientKey" match="Ingredient" use="@id"/>

  <!-- Match the root element and start the transformation -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Recettes et Ingrédients</title>
        <link rel="stylesheet" type="text/css" href="style1.css"/>
      </head>
      <body>
        <h1>Recettes et Ingrédients</h1>
        <div class="recipe-container">
          <xsl:apply-templates select="//Recette"/>
        </div>
      </body>
    </html>
  </xsl:template>

  <!-- Match the Recette element and extract the Nom (Name) and Ingredients -->
  <xsl:template match="Recette">
    <div class="recipe recipe-item">
      <h2><xsl:value-of select="Nom"/></h2>
      <img src="{Image}" alt="Image de la recette"/>
      <ul>
        <xsl:apply-templates select="Ingredients/Ingredient"/>
      </ul>
    </div>
  </xsl:template>

  <!-- Match the Ingredient element and extract the Nom (Name) -->
  <xsl:template match="Ingredient">
    <xsl:variable name="ingredientId" select="@idIngredient"/>
    <!-- Utilisation de la clé pour obtenir le nom de l'ingrédient à partir de son ID -->
    <xsl:variable name="ingredientName" select="key('ingredientKey', $ingredientId)/Nom"/>
    <li><xsl:value-of select="$ingredientName"/></li>
  </xsl:template>

</xsl:stylesheet>
