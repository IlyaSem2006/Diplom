<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006"
               xmlns:o="urn:schemas-microsoft-com:office:office"
               xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
               xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
               xmlns:v="urn:schemas-microsoft-com:vml"
               xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
               xmlns:w10="urn:schemas-microsoft-com:office:word"
               xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
               xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
               xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
               xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
               xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
               xmlns:opentopic="http://www.idiominc.com/opentopic"
               xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
               xmlns:x="com.elovirta.ooxml"
               exclude-result-prefixes="x xs opentopic opentopic-index ot-placeholder"
               version="2.0">

  <!-- <xsl:variable name="tablelist" select="/bookmap/ot-placeholder:tablelist"/> -->

  <xsl:template match="ot-placeholder:tablelist">

    <xsl:variable name="map-parent">		
		<xsl:call-template name="get-map-parent">
			<xsl:with-param name="id" select="@id"/>
		</xsl:call-template>
    </xsl:variable>

    <xsl:variable name="map-toc">		
      <xsl:call-template name="get-map-toc">
        <xsl:with-param name="id" select="@id"/>
      </xsl:call-template>
    </xsl:variable>

    <xsl:variable name="lastTopic" select="preceding::*[contains(@class,' topic/topic ')][1]"/>
    <xsl:variable name="lastObj" select="preceding::*[. >> $lastTopic][1]"/>    
    <xsl:variable name="isNonStandObj" as="xs:boolean" select="exists($lastObj/ancestor-or-self::*[@orient eq 'land' or @pgwide = 1 or
      @expanse eq 'spread' or @expanse eq 'page' or @expanse eq 'column'])"/> 
 
    <xsl:apply-templates select="/" mode="tbl">
      <xsl:with-param name="map-parent" select="$map-parent"/>
      <xsl:with-param name="map-toc" select="$map-toc"/>
      <xsl:with-param name="isNonStandObj" select="$isNonStandObj"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="/" mode="tbl" name="toc">
    <xsl:param name="map-parent"/>			
    <xsl:param name="map-toc"/>	
    <xsl:param name="isNonStandObj"/>	
    <!-- <w:testVal w:name="prec" w:val="{$tablelist/preceding::*[. >> $lastTopic][1]/@xtrc}"/>		 -->
    <!-- <w:testVal w:name="isNonStandObj" w:val="{$isNonStandObj}"/>		 -->
    <xsl:if test="not($isNonStandObj)">
      <w:p>
        <w:pPr>
          <w:rPr>
            <w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
            <w:b/>
            <w:sz w:val="24"/>
            <w:szCs w:val="24"/>
          </w:rPr>
        </w:pPr>
        <w:r>
          <w:rPr>
            <w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
            <w:b/>
            <w:sz w:val="24"/>
            <w:szCs w:val="24"/>
          </w:rPr>
            <w:br w:type="page"/>
        </w:r>
      </w:p>
    </xsl:if>
    <xsl:comment>	
    toc=<xsl:value-of select="$map-toc"/>
    </xsl:comment>
    <w:p>
      <w:pPr>	  
		<w:pStyle w:val="{if($map-parent = 'frontmatter' or $map-parent = 'backmatter') then (if($map-toc = true()) then 'HeadingAppCln0' else 'HeadingAppCln1') else 'HeadingCln0'}"/>		
      </w:pPr>    
      <w:r>
        <w:lastRenderedPageBreak/>
        <w:t>Список таблиц</w:t>
      </w:r>
      <xsl:apply-templates select="." mode="toc-tbl-field"/>
      <w:r>
        <w:fldChar w:fldCharType="end"/>
      </w:r>
    </w:p>
    <!-- разрыв секции по окончании плейсхолдера -->
    <xsl:if test="not(exists(/bookmap/ot-placeholder:tablelist/following::*[contains(name(),'ot-placeholder')]))">
      <!-- <w:testVal w:name="following" w:val="{/bookmap/ot-placeholder:tablelist/following::*[1]/name()}"/> -->
			<xsl:copy-of select="$body-section"/>
		</xsl:if>
  </xsl:template>
  
  <xsl:template match="/" mode="toc-tbl-field">
    <w:r>
      <w:fldChar w:fldCharType="begin"/>
    </w:r>
    <w:r>
      <w:instrText>
        <xsl:attribute name="xml:space">preserve</xsl:attribute>
        <xsl:apply-templates select="." mode="toc-tbl-prefix"/> 
      </w:instrText>
    </w:r>
    <w:r>
      <w:fldChar w:fldCharType="separate"/>
    </w:r>
  </xsl:template>
  
  <xsl:template match="*" mode="toc-tbl-prefix">
    <xsl:variable name="tblTitle" as="xs:string">
      <xsl:call-template name="getVariable">
        <xsl:with-param name="id" select="'Table'"/>
      </xsl:call-template>
    </xsl:variable>    
    <xsl:value-of select="concat('TOC \h \z \c &quot;',$tblTitle,'&quot;')"/> <!--   -->
  </xsl:template>
</xsl:stylesheet>
