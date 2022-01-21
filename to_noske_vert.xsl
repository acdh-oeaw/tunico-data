<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns:cr="http://aac.ac.at/content_repository"
    exclude-result-prefixes="#all">
    
    <xsl:output indent="no" omit-xml-declaration="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:variable name="posToAbbrev" select="map{
        'verb': 'V',
        'noun': 'N',
        'pronominalSuffix': 'PS',
        'definiteArticle': 'DA',
        'preposition': 'PR',
        'conjunction': 'C',
        'adverb': 'ADV',
        'responseParticle': 'RPA',
        'particle': 'PA',
        'personalPronoun': 'PPR',
        'interjection': 'INTJ',
        'interrogative': 'INTR',
        'adjective': 'ADJ',
        'activeParticiple': 'AP',
        'indefinite': 'IND',
        'demonstrativePronoun': 'DPR',
        'toponym': 'TOP',
        'numeral': 'NUM',
        'participle': 'P',
        'pluralNoun': 'PLN',
        'relativePronoun': 'RPR',
        'collectiveNoun': 'CN',
        'passiveParticiple': 'PP',
        'ordinal': 'ORD',
        'pronoun': 'PRON',
        'elative': 'ELA',
        'pluralDemonstrative': 'PLD',
        'vocativeParticle': 'VPAR',
        'dualNoun': 'DN',
        'properNoun': 'PROPN'
        }"/>
    
    <xsl:template match="/">
        <doc id="{//t:body/@cr:resource-pid}"><xsl:text xml:space="preserve">
</xsl:text> <xsl:apply-templates select="//t:body"/>
        </doc>
    </xsl:template>
    
    <xsl:template match="t:u">
        <u who="{substring(@who, 3)}" id="{@xml:id}"><xsl:text xml:space="preserve">
</xsl:text><xsl:apply-templates/>
        </u><xsl:text xml:space="preserve">
u__&#x9;
</xsl:text>
    </xsl:template>
    
    <xsl:template match="t:w">
        <xsl:value-of select="."/><xsl:text>&#x9;</xsl:text><xsl:value-of select="@xml:id"/><xsl:text>&#x9;</xsl:text><xsl:value-of select="@lemma"/><xsl:text>&#x9;</xsl:text><xsl:value-of select="string-join(tokenize(@type)!$posToAbbrev(.), '|')"/>|<xsl:value-of select="concat(string-join(tokenize(@type)!$posToAbbrev(.), '|'), normalize-space(@subtype))"/><xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>
    
    <xsl:template match="t:pc">
        <g/><xsl:text xml:space="preserve">
</xsl:text><xsl:value-of select="."/>__<xsl:text>&#x9;</xsl:text><xsl:value-of select="@xml:id"/><xsl:text xml:space="preserve">
</xsl:text>
    </xsl:template>
    
    <xsl:template match="t:pc[@type='ignoreInSearchIndex']"/>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>