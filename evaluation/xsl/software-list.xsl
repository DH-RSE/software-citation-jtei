<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:variable name="jtei-collection" select="collection('../../data/JTEI?recurse=yes&amp;select=*.xml')"/>
    
    <!-- which software is mentioned in the jTEI articles and how often? -->
    <xsl:template match="/">
        <list>
        <xsl:for-each-group select="$jtei-collection//ptr[@type='software']" group-by="@target">
            <xsl:sort select="count(current-group())"/>
            <item><xsl:value-of select="current-grouping-key()"/>: <xsl:value-of select="count(current-group())"/></item>
        </xsl:for-each-group>
        </list>
    </xsl:template>
    
</xsl:stylesheet>