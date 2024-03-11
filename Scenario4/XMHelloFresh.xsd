<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Recettes">
        <Recettes>
            <xsl:apply-templates select="Recette"/>
        </Recettes>
    </xsl:template>

    <xsl:template match="Recette">
        <Recette>
            <xsl:copy-of select="@*|Nom|Nombre_de_personnes|Image"/>
            <Ingredients>
                <xsl:apply-templates select="Ingredients/Ingredient"/>
            </Ingredients>
            <EtapesDeRecette>
                <xsl:apply-templates select="EtapesDeRecette"/>
            </EtapesDeRecette>
            <Commentaires>
                <xsl:apply-templates select="/XMHelloFresh/Commentaires/Commentaire[Commande/Menu/Recettes_Du_Menu/Recette_Du_Menu/@idRecette = current()/@id]"/>
            </Commentaires>
        </Recette>
    </xsl:template>

    <xsl:template match="Ingredient">
        <Ingredient>
            <xsl:copy-of select="@*|Nom|Quantité|Unité"/>
        </Ingredient>
    </xsl:template>

</xsl:stylesheet>
