<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--
  Модифицированый XSLT-шаблон для верхнего колонтитула DOCX.
  ids.header1.xsl, v20260529
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:x="com.elovirta.ooxml" xmlns:foo="http://never.mind.com/"  xmlns:opentopic="http://www.idiominc.com/opentopic" version="2.0" exclude-result-prefixes="x xs">
	<xsl:import href="ktk.document.xsl"/>
	<xsl:param name="args" select="false()" as="xs:boolean"/>
	<xsl:param name="document.restrict.mark" as="xs:string?"/>
	<!-- <xsl:variable name="doc" select="document(concat($template.dir, 'word/header2.xml'))" as="document-node()?"/> -->
	<xsl:template match="/">
	<w:hdr xmlns:wpc="http://schemas.microsoft.com/office/word/2010/wordprocessingCanvas" 
	xmlns:cx="http://schemas.microsoft.com/office/drawing/2014/chartex" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing" xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing" xmlns:w10="urn:schemas-microsoft-com:office:word" xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main" xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml" xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml" xmlns:w16se="http://schemas.microsoft.com/office/word/2015/wordml/symex" xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup" xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk" xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml" xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape" mc:Ignorable="w14 w15 w16se wp14">
	<!--w:p>
		<w:pPr>
			<w:pStyle w:val="PageNumber"/>
			<w:jc w:val="right"/>
		</w:pPr>
		<w:r>
			<w:rPr>
				<w:color w:val="000000" w:themeColor="text1"/>
			</w:rPr>
		</w:r>
	</w:p>
	<w:p>
		<w:pPr>
			<w:pStyle w:val="PageNumber"/>
			<w:jc w:val="right"/>
		</w:pPr>
	</w:p-->
	</w:hdr>
	</xsl:template>
		
</xsl:stylesheet>
