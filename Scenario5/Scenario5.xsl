<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Définir la transformation -->
    <xsl:template match="/">
        <!-- Début du JSON -->
        <xsl:text>{"recettes": [</xsl:text>
        <!-- Appliquer les templates pour chaque recette -->
        <xsl:apply-templates select="XMHelloFresh/Recettes/Recette"/>
        <!-- Ajouter une virgule pour séparer les recettes des menus -->
        <xsl:text>, </xsl:text>
        <!-- Début des menus -->
        <xsl:text>"menus": [</xsl:text>
        <!-- Appliquer les templates pour chaque menu -->
        <xsl:apply-templates select="XMHelloFresh/Menus/Menu"/>
        <!-- Fin du JSON -->
        <xsl:text>]}</xsl:text>
    </xsl:template>

    <!-- Template pour chaque recette -->
    <xsl:template match="Recette">
        <!-- Début d'une recette -->
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Nombre_de_personnes": </xsl:text>
        <xsl:value-of select="Nombre_de_personnes"/>
        <xsl:text>, "Ingredients": [</xsl:text>
        <!-- Appliquer les templates pour chaque ingrédient de la recette -->
        <xsl:apply-templates select="Ingredients/Ingredient"/>
        <!-- Fin de la liste des ingrédients -->
        <xsl:text>], "EtapesDeRecette": [</xsl:text>
        <!-- Appliquer les templates pour chaque étape de la recette -->
        <xsl:apply-templates select="EtapesDeRecette/Etape"/>
        <!-- Fin de la liste des étapes -->
        <xsl:text>], "Image": "</xsl:text>
        <xsl:value-of select="Image"/>
        <xsl:text>"}</xsl:text>
        <!-- Ajouter une virgule pour séparer les recettes -->
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    <!-- Template pour chaque ingrédient -->
    <xsl:template match="Ingredient">
        <!-- Début d'un ingrédient -->
        <xsl:text>{"idIngredient": </xsl:text>
        <xsl:value-of select="@idIngredient"/>
        <!-- Ajouter le nom, la quantité et l'unité de l'ingrédient -->
        <xsl:text>, "Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Quantité": </xsl:text>
        <xsl:value-of select="Quantité"/>
        <xsl:text>, "Unité": "</xsl:text>
        <xsl:value-of select="Unité"/>
        <xsl:text>"}</xsl:text>
        <!-- Ajouter une virgule pour séparer les ingrédients -->
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    <!-- Template pour chaque étape de recette -->
    <xsl:template match="Etape">
        <!-- Début d'une étape -->
        <xsl:text>"</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>"</xsl:text>
        <!-- Ajouter une virgule pour séparer les étapes -->
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    <!-- Template pour chaque menu -->
    <xsl:template match="Menu">
        <!-- Début d'un menu -->
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>", "Prix": </xsl:text>
        <xsl:value-of select="Prix"/>
        <xsl:text>, "Recettes_Du_Menu": [</xsl:text>
        <!-- Appliquer les templates pour chaque recette du menu -->
        <xsl:apply-templates select="Recettes_Du_Menu/Recette_Du_Menu"/>
        <!-- Fin de la liste des recettes -->
        <xsl:text>]}</xsl:text>
        <!-- Ajouter une virgule pour séparer les menus -->
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    <!-- Template pour chaque recette du menu -->
    <xsl:template match="Recette_Du_Menu">
        <!-- Début d'une recette du menu -->
        <xsl:text>{"Nom": "</xsl:text>
        <xsl:value-of select="Nom"/>
        <xsl:text>"}</xsl:text>
        <!-- Ajouter une virgule pour séparer les recettes du menu -->
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>
</xsl:stylesheet>
