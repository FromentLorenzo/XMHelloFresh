<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <NewXMHelloFresh>
            <xsl:apply-templates select="XMHelloFresh/Livreurs"/>
            <xsl:apply-templates select="XMHelloFresh/Commandes"/>
            <xsl:apply-templates select="XMHelloFresh/Utilisateurs"/>
        </NewXMHelloFresh>
    </xsl:template>

    <xsl:template match="Livreurs">
        <Livreurs>
            <xsl:apply-templates select="Livreur"/>
        </Livreurs>
    </xsl:template>

    <xsl:template match="Livreur">
        <Livreur id="{@id}">
            <Nom>
                <xsl:value-of select="Nom"/>
            </Nom>
            <Prénom>
                <xsl:value-of select="Prénom"/>
            </Prénom>
            <Numéro_de_téléphone>
                <xsl:value-of select="Numéro_de_téléphone"/>
            </Numéro_de_téléphone>
            <Moyen_de_transport>
                <xsl:value-of select="Moyen_de_transport"/>
            </Moyen_de_transport>
            <Commandes>
                <xsl:apply-templates select="../../Commandes/Commande[Livreur/@idLivreur = current()/@id]/@id"/>
            </Commandes>
        </Livreur>
    </xsl:template>

    <xsl:template match="Commandes">
        <Commandes>
            <xsl:apply-templates select="Commande"/>
        </Commandes>
    </xsl:template>

    <xsl:template match="Commande">
        <Commande id="{@id}">
            <Utilisateur>
                <xsl:copy-of select="Utilisateur"/>
            </Utilisateur>
            <xsl:copy-of select="Date"/>
            <xsl:copy-of select="Heure"/>
            <xsl:copy-of select="Adresse"/>
            <xsl:copy-of select="Numéro_de_téléphone"/>
            <xsl:copy-of select="Statut"/>
            <xsl:copy-of select="Prix"/>
            <Menu>
                <xsl:value-of select="Menu.idMenu"/>
            </Menu>
        </Commande>
    </xsl:template>

    <xsl:template match="Utilisateurs">
        <Utilisateurs>
            <xsl:apply-templates select="Utilisateur"/>
        </Utilisateurs>
    </xsl:template>

    <xsl:template match="Utilisateur">
        <Utilisateur>
            <Nom>
                <xsl:value-of select="Nom"/>
            </Nom>
            <Prénom>
                <xsl:value-of select="Prénom"/>
            </Prénom>
            <Adresse>
                <xsl:value-of select="Adresse"/>
            </Adresse>
            <Numéro_de_téléphone>
                <xsl:value-of select="Numéro_de_téléphone"/>
            </Numéro_de_téléphone>
        </Utilisateur>
    </xsl:template>

    <xsl:template match="Menus">
        <Menus>
            <xsl:apply-templates select="Menu"/>
        </Menus>
    </xsl:template>

    <xsl:template match="Menu">
        <Menu>
            <Nom>
                <xsl:value-of select="Nom"/>
            </Nom>
        </Menu>
    </xsl:template>

</xsl:stylesheet>
