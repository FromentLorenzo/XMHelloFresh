<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  
  <xsl:key name="ingredientKey" match="Ingredient" use="@id"/>

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

  <xsl:template match="Recette">
    <div class="recipe recipe-item">
      <h2><xsl:value-of select="Nom"/></h2>
      <img src="{Image}" alt="Image de la recette"/>
      <ul>
        <xsl:apply-templates select="Ingredients/Ingredient"/>
      </ul>
    </div>
  </xsl:template>

  <xsl:template match="Ingredient">
    <xsl:variable name="ingredientId" select="@idIngredient"/>
    <xsl:variable name="ingredientName" select="key('ingredientKey', $ingredientId)/Nom"/>
    <li><xsl:value-of select="$ingredientName"/></li>
  </xsl:template>

</xsl:stylesheet>
