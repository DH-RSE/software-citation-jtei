<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:local="local"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <xsl:variable name="jtei-collection" select="collection('../../data/JTEI?recurse=yes&amp;select=*.xml')"/>
    
    <!-- which software is mentioned in the jTEI articles and how often? -->
    <xsl:template match="/">
        <!--<xsl:call-template name="individual-citations"/>-->
        <xsl:call-template name="per-article"/>
    </xsl:template>
    
    <xsl:function name="local:count-citations-per-article" as="xs:integer+">
        <xsl:for-each select="$jtei-collection//TEI">
            <xsl:value-of select="count(distinct-values(.//ptr[@type='software']/@target[matches(.,'#[a-z]+')]))"/>
        </xsl:for-each>
    </xsl:function>
    
    <xsl:template name="per-article">
        <xsl:variable name="total-article-count" select="count($jtei-collection//TEI)"/>
        <xsl:variable name="total-citations-per-article-count" select="sum(local:count-citations-per-article())"/>
        <list n="{$total-citations-per-article-count}">
            <xsl:for-each-group select="$jtei-collection//ptr[@type='software'][matches(@target,'#[a-z]+')]" group-by="@target">
                <xsl:sort select="count($jtei-collection//TEI[.//ptr[@type='software'][@target=current-grouping-key()]])" order="descending"/>
                <xsl:variable name="article-count" select="count($jtei-collection//TEI[.//ptr[@type='software'][@target=current-grouping-key()]])"/>
                <item><xsl:value-of select="current-grouping-key()"/>: <xsl:value-of select="$article-count"/> (<xsl:value-of select="$article-count div $total-citations-per-article-count * 100"/> %)</item>
            </xsl:for-each-group>
        </list>
    </xsl:template>
    
    <xsl:template name="individual-citations">
        <xsl:variable name="total-count" select="count($jtei-collection//ptr[@type='software'][matches(@target,'#[a-z]+')])"/>
        <list n="{$total-count}">
            <xsl:for-each-group select="$jtei-collection//ptr[@type='software'][matches(@target,'#[a-z]+')]" group-by="@target">
                <xsl:sort select="count(current-group())" order="descending"/>
                <xsl:variable name="group-count" select="count(current-group())"/>
                <item><xsl:value-of select="current-grouping-key()"/>: <xsl:value-of select="$group-count"/> (<xsl:value-of select="$group-count div $total-count * 100"/> %)</item>
            </xsl:for-each-group>
        </list>
    </xsl:template>
    
</xsl:stylesheet>