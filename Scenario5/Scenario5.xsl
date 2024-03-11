<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <xsl:text>{"recettes": [</xsl:text>
        <xsl:apply-templates select="XMHelloFresh/Recettes/Recette"/>
        <xsl:text>], "menus": [</xsl:text>
        <xsl:apply-templates select="XMHelloFresh/Menus/Menu"/>
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <xsl:template match="Recette">
        <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Nombre_de_personnes": </xsl:text>
        <xsl:value-of select="Nombre_de_personnes"/>
        <xsl:text>, "Ingredients": [</xsl:text>
        <xsl:apply-templates select="Ingredients/Ingredient"/>
        <xsl:text>], "EtapesDeRecette": [</xsl:text>
        <xsl:apply-templates select="EtapesDeRecette/Etape"/>
        <xsl:text>], "Image": "</xsl:text>
        <xsl:value-of select="Image"/>
        <xsl:text>"}</xsl:text>
    </xsl:template>

    <xsl:template match="Ingredient">
        <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>{"idIngredient": "</xsl:text>
        <xsl:value-of select="@idIngredient"/>
        <xsl:text>", "Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Quantité": "</xsl:text>
        <xsl:value-of select="Quantité"/>
        <xsl:text>", "Unité": "</xsl:text>
        <xsl:value-of select="Unité"/>
        <xsl:text>"}</xsl:text>
    </xsl:template>

    <xsl:template match="Etape">
        <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="Menu">
        <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Prix": </xsl:text>
        <xsl:value-of select="Prix"/>
        <xsl:text>, "Recettes_Du_Menu": [</xsl:text>
        <xsl:apply-templates select="Recettes_Du_Menu/Recette_Du_Menu"/>
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <xsl:template match="Recette_Du_Menu">
        <xsl:if test="position() &gt; 1">,</xsl:if>
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>"}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
