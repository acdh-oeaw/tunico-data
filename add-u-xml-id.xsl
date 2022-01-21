<?xml version="1.0" encoding="UTF-8"?><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.tei-c.org/ns/1.0" version="3.0" exclude-result-prefixes="#all">
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="t:u[not(@xml:id)]">
        <u xml:id="{substring-before(./t:w[1]/@xml:id, 'w')}">
           <xsl:apply-templates select="@*"/>
           <xsl:apply-templates/>            
        </u>
    </xsl:template>
    
    <xsl:template match="@*|node()|text()|processing-instruction()|comment()">
        <xsl:copy>            
            <xsl:apply-templates select="@*|node()|text()|processing-instruction()|comment()"/>
        </xsl:copy>
    </xsl:template>
</xsl:stylesheet>