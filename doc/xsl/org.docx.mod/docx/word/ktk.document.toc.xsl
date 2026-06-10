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

  <xsl:param name="document.toc.level" as="xs:integer"/>
	
  <xsl:variable name="tocMaximumLevel" select="9" as="xs:integer"/>

  <xsl:template match="ot-placeholder:toc">
    <xsl:variable name="map-parent">		
		<xsl:call-template name="get-map-parent">
			<xsl:with-param name="id" select="@id"/>
		</xsl:call-template>
	</xsl:variable>
    <xsl:apply-templates select="/" mode="toc">
		<xsl:with-param name="map-parent" select="$map-parent"/>
	</xsl:apply-templates>
  </xsl:template>

  <xsl:template match="/" mode="toc" name="toc">
	<xsl:param name="map-parent"/>	
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
    <xsl:comment>TOC</xsl:comment>
    <w:p>
      <w:pPr>
        <w:pStyle w:val="{if($map-parent = 'frontmatter' or $map-parent = 'backmatter') then 'TOCHeading' else 'HeadingCln0'}"/>
      </w:pPr>
      <w:r>
        <w:lastRenderedPageBreak/>
        <w:t>
          <xsl:call-template name="getVariable">
            <xsl:with-param name="id" select="'Table of Contents'"/>
          </xsl:call-template>
        </w:t>
      </w:r>
      <xsl:apply-templates select="." mode="toc-field"/>
    </w:p>
    <xsl:apply-templates select="*[contains(@class, ' map/map ')]/*[contains(@class, ' topic/topic ')]" mode="x:toc"/>
    <!-- End TOC field -->
    <w:p>
	  <w:pPr>
		<w:spacing w:line="0"/>
	  </w:pPr>
      <w:r>
        <w:fldChar w:fldCharType="end"/>
      </w:r>
      <!--w:r>
        <w:br w:type="page"/>
      </w:r-->
		<!-- <w:r><w:t>===================================================================</w:t></w:r> -->
		</w:p>
		<!-- <xsl:apply-templates select="/bookmap" mode="term1"/> принудительный вызов "Терминов и определений" и "Обозначений и сокращений" (было актуально до 01.12.2021)-->
		<!-- SKDITA-177 begin -->
		<!-- <xsl:if test="count(descendant-or-self::*[contains(@toc-only,'true')]) gt 0"> -->
		<xsl:if test="count(/bookmap/opentopic:map/backmatter/*[contains(@class,' toc-only/topichead ')]) gt 0">
			<!-- <xsl:for-each select="descendant-or-self::*[contains(@toc-only,'true')]/*[contains(@class,' topic/title ')]"> -->
			<xsl:for-each select="/bookmap/opentopic:map/backmatter/*[contains(@class,' toc-only/topichead ')]">
			<!-- /*[contains(@class, ' map/topicmeta ')]/*[contains(@class,' topic/navtitle ')]"> -->
			<w:p>
				<!-- <w:pPr>
					<w:spacing w:before="120"/>
				</w:pPr> -->
				<w:r>
					<w:t>						
						<xsl:apply-templates select="(*[contains(@class,' topic/navtitle ')],.)[1]"/>						
					</w:t>
				</w:r>
			</w:p>
			</xsl:for-each>
		</xsl:if>
		<!-- SKDITA-177 end -->
	</xsl:template>
	<xsl:template match="/" mode="toc-field">
		<w:r>
			<w:fldChar w:fldCharType="begin"/>
		</w:r>
		<w:r>
			<w:instrText>
				<xsl:attribute name="xml:space">preserve</xsl:attribute>
				<xsl:apply-templates select="." mode="toc-prefix"/>
			</w:instrText>
		</w:r>
		<w:r>
			<w:fldChar w:fldCharType="separate"/>
		</w:r>
	</xsl:template>
	<xsl:template match="*" mode="toc-prefix">
		<!-- TOC \o "1-3" \h \z \t "HeadingAppCln0;1"  -->
		<!-- TOC \o "1-4" \h \z \u \t "HeadingApp1;1;HeadingApp2;2;HeadingApp3 ;3;HeadingAppCln0 ;1;"-->
		<xsl:choose>
			<xsl:when test="exists(/bookmap//*[contains(@domains,'(ditaTopic)') and contains(@class,' concept/concept ')])">
				<!-- если в документе присутствуют топики типа композит, изменяем команду управления полем оглавления -->
				<xsl:value-of select="concat('TOC \o &quot;1-',($document.toc.level - 1),'&quot; \h \z \t &quot;Заголовок 3;3;HeadingApp3;3&quot; ')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('TOC \o &quot;1-',$document.toc.level,'&quot; \h \z \t &quot;HeadingAppCln0;1&quot; ')"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- <xsl:variable name="toc.increment-base" select="422" as="xs:integer"/> -->
	<xsl:variable name="toc.increment-base" select="284" as="xs:integer"/>
	<!-- ССылки -->
	<xsl:template match="*[contains(@class, ' topic/topic ')]" mode="x:toc">
		<xsl:param name="depth" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])" as="xs:integer"/>
		<xsl:param name="prefix" as="node()*"/>
		<xsl:variable name="level_concept" select="count(ancestor::*[contains(@class,' concept/concept ')])"/>
		<xsl:variable name="isCompositeTopic" as="xs:boolean" select="self::*[contains(@domains,'(ditaTopic)')] and self::*[contains(@class,' concept/concept ')]"/>
		<xsl:variable name="target" select="concat($bookmark-prefix.toc, x:generate-id(.))" as="xs:string"/>
		<xsl:variable name="style-numbered" as="xs:boolean" select="exists($styles/w:styles/w:style[@w:styleId = concat('Heading', $depth)]/w:pPr/w:numPr or $styles/w:styles/w:style[@w:styleId = concat('HeadingApp', $depth)]/w:pPr/w:numPr or $styles/w:styles/w:style[@w:styleId = 'HeadingAppCln0']/w:pPr/w:numPr  )"/>
		<xsl:if test="not($isCompositeTopic and ($level_concept gt 1 or $depth gt 2))">
			<!-- формирование оглавления "по умолчанию" - выводятся все необходимые разделы, за исключением пунктов/подпунктов -->
			<w:p>
				<w:pPr>
					<w:pStyle w:val="TOC{$depth}"/>
					<xsl:if test="*[contains(@class, ' topic/topic ')]">
						<w:keepNext/>
					</xsl:if>
					<w:tabs>
						<xsl:choose>
							<xsl:when test="($generate-header-number and exists(@x:header-number)) or $style-numbered">
								<w:tab w:val="left" w:pos="{$toc.increment-base * $depth}"/>
								<w:tab w:val="right" w:leader="dot" w:pos="{$body-width}"/>
							</xsl:when>
							<xsl:otherwise>
								<w:tab w:val="right" w:leader="dot" w:pos="{$body-width}"/>
							</xsl:otherwise>
						</xsl:choose>
					</w:tabs>
					<w:rPr>
						<w:noProof/>
					</w:rPr>
				</w:pPr>
				<xsl:copy-of select="$prefix"/>
				<xsl:choose>
					<xsl:when test="($generate-header-number and exists(@x:header-number)) or $style-numbered">
						<w:r>
							<w:t>
								<xsl:value-of select="@x:header-number"/>
							</w:t>
						</w:r>
						<w:r>
							<w:tab/>
						</w:r>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="$depth gt 1">
			  </xsl:if>
			</xsl:otherwise>
		  </xsl:choose>
		  <w:r>
			<w:t>
				<xsl:choose>
					<xsl:when test="exists(*[contains(@class, ' topic/title ')]/node())">
						<xsl:apply-templates select="*[contains(@class, ' topic/title ')]/node()"/>
					</xsl:when>
					<xsl:otherwise>
						&#xA0;
					</xsl:otherwise>					
				</xsl:choose>			  
			</w:t>
		  </w:r>
		  <w:r>
			<w:tab/>
		  </w:r>
		  <w:r>
			<w:fldChar w:fldCharType="begin" w:dirty="true"/>
		  </w:r>
		  <w:r>
			<w:instrText xml:space="preserve"> PAGEREF <xsl:value-of select="$target"/> \h </w:instrText>
		  </w:r>
		  <w:r>
			<w:fldChar w:fldCharType="separate"/>
		  </w:r>
		  <w:r>
			<w:t>0</w:t>
		  </w:r>
		  <w:r>
			<w:fldChar w:fldCharType="end"/>
		  </w:r>
		</w:p>
		</xsl:if>
		<xsl:if test="$depth lt $tocMaximumLevel">
		  <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]" mode="x:toc">
			<xsl:with-param name="depth" select="$depth + 1"/>
		  </xsl:apply-templates>
		</xsl:if>	
  </xsl:template>
  <xsl:template match="*[contains(@class, ' glossentry/glossentry ')]" mode="x:toc" priority="1000"/>
</xsl:stylesheet>
