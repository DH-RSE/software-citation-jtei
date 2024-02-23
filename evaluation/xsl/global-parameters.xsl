<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="2.0">
    
    
    <!-- software types -->
    <xsl:variable name="SOFTWARE-MENTION-TYPES" select="document('../../taxonomy/citation-taxonomy.xml')//*:taxonomy/*:category/@xml:id" as="xs:string+"/>
    <!-- soft.bib, soft.bib.ref, soft.name, soft.agent, soft.url, soft.pid, soft.ver -->
    
    
    <!-- directories with TEI files -->
    <xsl:variable name="COLLECTION-DIRS" as="xs:string+" select="(  
        '../../data/JTEI/10_2016-19',
        '../../data/JTEI/13_2020-22',
        '../../data/JTEI/7_2014',
        '../../data/JTEI/rolling_2019',
        '../../data/JTEI/rolling_2023',
        '../../data/JTEI/11_2019-20',
        '../../data/JTEI/12_2019-20',
        '../../data/JTEI/14_2021-23',
        '../../data/JTEI/8_2014-15',
        '../../data/JTEI/rolling_2021',
        '../../data/JTEI/16_2023_spa',
        '../../data/JTEI/9_2016-17',
        '../../data/JTEI/rolling_2022'
        )"/>
    
    <!-- newline character -->
    <xsl:variable name="NEWLINE"><xsl:text>
</xsl:text></xsl:variable>
    
    <!-- character to be used as CSV separator -->
    <xsl:variable name="CSV-SEP" select="','" as="xs:string"/>
    
</xsl:stylesheet>