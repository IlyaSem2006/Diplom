<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:ve="http://schemas.openxmlformats.org/markup-compatibility/2006"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
	xmlns:m="http://schemas.openxmlformats.org/officeDocument/2006/math"
	xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
	xmlns:wp="http://schemas.openxmlformats.org/drawingml/2006/wordprocessingDrawing"
	xmlns:w10="urn:schemas-microsoft-com:office:word"
	xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"
	xmlns:wp14="http://schemas.microsoft.com/office/word/2010/wordprocessingDrawing"
	xmlns:w14="http://schemas.microsoft.com/office/word/2010/wordml"
	xmlns:w15="http://schemas.microsoft.com/office/word/2012/wordml"
	xmlns:wpg="http://schemas.microsoft.com/office/word/2010/wordprocessingGroup"
	xmlns:wpi="http://schemas.microsoft.com/office/word/2010/wordprocessingInk"
	xmlns:wne="http://schemas.microsoft.com/office/word/2006/wordml"
	xmlns:wps="http://schemas.microsoft.com/office/word/2010/wordprocessingShape"
	mc:Ignorable="w14 w15 wp14" xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main"
	xmlns:pic="http://schemas.openxmlformats.org/drawingml/2006/picture"
	xmlns:a14="http://schemas.microsoft.com/office/drawing/2010/main"
	xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
	xmlns:opentopic="http://www.idiominc.com/opentopic"
	xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
	xmlns:x="com.elovirta.ooxml"
	exclude-result-prefixes="x xs opentopic opentopic-index ot-placeholder" version="2.0">
	<xsl:template name="title-page">
		<xsl:apply-templates select="/bookmap/opentopic:map/booktitle/mainbooktitle" mode="myTitle"/>
	</xsl:template>
	<xsl:template match="/bookmap/opentopic:map/booktitle/mainbooktitle" mode="myTitle">
		<!-- Полное наименование организации -->
		<xsl:choose>
			<xsl:when test="count(*[contains(@id, 'orgNameFullTL')]) gt 0">
				<w:p>
					<w:pPr>
						<w:pStyle w:val="Titylist12"/>
						<w:spacing w:line="240"/>
					</w:pPr>
					<xsl:for-each select="*[contains(@id, 'orgNameFullTL')]">
						<w:r>
							<w:rPr>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="."/>
							</w:t>
						</w:r>
						<w:br/>
					</xsl:for-each>
				</w:p>
			</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="*[contains(@id, 'orgRezolyucTLTL') or contains(@id, 'orgRezolyucTLTR')]">
				<!-- Штампы верхние -->
				<w:tbl>
					<w:tblPr>
						<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
						<w:tblInd w:w="0" w:type="dxa"/>
						<w:tblLayout w:type="fixed"/>
						<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
							w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
						<w:tblCellMar>
							<w:left w:w="0" w:type="dxa"/>
							<w:right w:w="0" w:type="dxa"/>
						</w:tblCellMar>
						<!--w:tblBorders>
							<w:top w:val="single" w:sz="4" w:space="0" w:color="auto"/>
							<w:start w:val="single" w:sz="4" w:space="0" w:color="auto"/>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
							<w:end w:val="single" w:sz="4" w:space="0" w:color="auto"/>
							<w:insideH w:val="single" w:sz="4" w:space="0" w:color="auto"/>
							<w:insideV w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tblBorders-->
					</w:tblPr>
					<w:tblGrid>
						<w:gridCol w:w="4252"/>
						<w:gridCol w:w="850"/>
						<w:gridCol w:w="4252"/>
					</w:tblGrid>
					<w:tr>
						<!-- TL Head -->
						<xsl:variable name="TLHead" as="xs:string?">
							<xsl:choose>
								<!-- ищем id текущего местоположения и используем содержимое, соотвествующее этому id, на не предназначенному для этой роли keyref-у!!! -->
								<xsl:when test="*[contains(@id, 'orgRezolyucTLTL')]">
									<xsl:value-of select="*[contains(@id, 'orgRezolyucTLTL')]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<!--w:spacing w:after="240"/-->
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TLHead"/>
									</w:t>
								</w:r>
							</w:p>
						</w:tc>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="850" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:r>
									<w:t/>
								</w:r>
							</w:p>
						</w:tc>
						<!-- TR Head -->
						<xsl:variable name="TRHead" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgRezolyucTLTR')]">
									<xsl:value-of select="*[contains(@id, 'orgRezolyucTLTR')]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>

						</xsl:variable>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<w:jc w:val="right"/>
									<!--w:spacing w:after="240"/-->
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TRHead"/>
									</w:t>
								</w:r>
							</w:p>
						</w:tc>
					</w:tr>
					<w:tr>
						<!-- TL -->
						<!-- должность -->
						<xsl:variable name="TLDolzh" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgDolzhnostTLTL')]">
									<xsl:value-of select="*[contains(@id, 'orgDolzhnostTLTL')]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!-- TR -->
						<!-- должность -->
						<xsl:variable name="TRDolzh" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgDolzhnostTLTR')]">
									<xsl:value-of select="*[contains(@id, 'orgDolzhnostTLTR')][1]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!-- выделяем отдельную строку для вывода должностей -->
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<w:jc w:val="left"/>
									<w:spacing w:after="120"/>
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TLDolzh"/>
									</w:t>
								</w:r>
							</w:p>
						</w:tc>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="850" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:rPr>
									<w:sz w:val="24"/>
									<w:szCs w:val="24"/>
								</w:rPr>
								<w:r>
									<w:t/>
								</w:r>
							</w:p>
						</w:tc>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<w:jc w:val="right"/>
									<!--w:spacing w:after="120"/-->
								</w:pPr>
								<xsl:for-each select="*[contains(@id, 'orgDolzhnostTLTR')]">
									<w:r>
										<w:rPr>
											<w:noProof/>
											<w:sz w:val="24"/>
											<w:szCs w:val="24"/>
										</w:rPr>
										<w:t>
											<xsl:value-of select="."/>
										</w:t>
									</w:r>
									<w:br/>
								</xsl:for-each>

								<!--w:r>
									<w:t>
										<xsl:value-of select="$TRDolzh"/>
									</w:t>
								</w:r-->
							</w:p>
						</w:tc>
					</w:tr>
					<w:tr>
						<!-- TL -->
						<!-- ФИО -->
						<xsl:variable name="TLFIO" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgFIOTLTL')]">
									<xsl:value-of select="*[contains(@id, 'orgFIOTLTL')]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!-- дата -->
						<xsl:variable name="TLDate" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgDataTLTL')]">
									<xsl:value-of select="*[contains(@id, 'orgDataTLTL')]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<w:jc w:val="left"/>
									<w:spacing w:after="120"/>
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TLFIO"/>
									</w:t>
								</w:r>
							</w:p>
							<w:p>
								<w:pPr>
									<w:jc w:val="left"/>
									<w:spacing w:after="120"/>
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TLDate"/>
									</w:t>
								</w:r>

							</w:p>
						</w:tc>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="850" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:rPr>
									<w:sz w:val="24"/>
									<w:szCs w:val="24"/>
								</w:rPr>
								<w:r>
									<w:t/>
								</w:r>
							</w:p>
						</w:tc>
						<!-- TR -->
						<!-- ФИО -->
						<xsl:variable name="TRFIO" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgFIOTLTR')]">
									<xsl:value-of select="*[contains(@id, 'orgFIOTLTR')][1]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<!-- дата -->
						<xsl:variable name="TRDate" as="xs:string?">
							<xsl:choose>
								<xsl:when test="*[contains(@id, 'orgDataTLTR')]">
									<xsl:value-of select="*[contains(@id, 'orgDataTLTR')][1]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="'&#xA0;'"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:variable>
						<w:tc>
							<w:tcPr>
								<w:tcW w:w="4252" w:type="dxa"/>
							</w:tcPr>
							<w:p>
								<w:pPr>
									<w:jc w:val="right"/>
									<w:spacing w:after="120"/>
								</w:pPr>
								<w:r w:rsidRPr="00F91BCB">
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TRFIO"/>
									</w:t>
								</w:r>
							</w:p>
							<w:p>
								<w:pPr>
									<w:jc w:val="right"/>
									<w:spacing w:after="120"/>
								</w:pPr>
								<w:r>
									<w:rPr>
										<w:noProof/>
										<w:sz w:val="24"/>
										<w:szCs w:val="24"/>
									</w:rPr>
									<w:t>
										<xsl:value-of select="$TRDate"/>
									</w:t>
								</w:r>
							</w:p>
						</w:tc>
					</w:tr>
				</w:tbl>
			</xsl:when>
			<xsl:otherwise>
				<w:p>
					<w:pPr>
						<w:rPr>
							<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
								w:cs="Times New Roman"/>
							<w:sz w:val="24"/>
							<w:szCs w:val="24"/>
						</w:rPr>
					</w:pPr>
					<w:r>
						<w:rPr>
							<w:b/>
							<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
								w:cs="Times New Roman"/>
							<w:sz w:val="24"/>
							<w:szCs w:val="24"/>
							<!-- <w:lang w:val="ru-RU"/> -->
						</w:rPr>
						<w:t>
							<xsl:value-of select="*[contains(@id, 'orgRezolyucUtvTL')]/node()"/>
						</w:t>
					</w:r>
				</w:p>
				<!-- обозначение листа утверждения   документа - ЛУ 4-->
				<w:p>
					<w:pPr>
						<w:spacing w:after="2280"/>
						<w:rPr>
							<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
								w:cs="Times New Roman"/>
							<w:sz w:val="24"/>
							<w:szCs w:val="24"/>
						</w:rPr>
					</w:pPr>
					<w:r>
						<w:rPr>
							<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
								w:cs="Times New Roman"/>
							<w:sz w:val="24"/>
							<w:szCs w:val="24"/>
							<!-- <w:lang w:val="ru-RU"/> -->
						</w:rPr>
						<w:t>
							<xsl:value-of select="*[contains(@id, 'prodNumUtvTL')]"/>
						</w:t>
					</w:r>
				</w:p>
			</xsl:otherwise>
		</xsl:choose>


		<!-- далее отступ 4 0 мм , что дает  2268 единиц ворда  или 114 pt-->
		<!-- Полное наименования  может быть больше 1 строчки , далее будет вставлены параграфы если строчка была 1-->

		<xsl:variable name="prodSystemName" select="'prodSystemNameTitulTL'"/>
		<xsl:choose>
			<xsl:when
				test="count(/bookmap/opentopic:map/booktitle/mainbooktitle/ph[contains(@id, $prodSystemName)]/keyword) gt 0">
				<xsl:for-each
					select="/bookmap/opentopic:map/booktitle/mainbooktitle/ph[contains(@id, $prodSystemName)]/keyword">
					<w:p>
						<w:pPr>
							<!--w:pStyle w:val="Titylist14"/-->
							<!-- <w:ind w:left="{$title-indents-twips}" w:right="{$title-indents-twips}"/> -->
							<w:ind w:left="0" w:right="0"/>
							<w:spacing w:before="{if (position() = 1) then 480 else 0}"
								w:after="{if (position() = last()) then 120 else 0}"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t xml:space="preserve"><xsl:value-of select="."/></w:t>
						</w:r>
					</w:p>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<w:p>
					<w:pPr>
						<w:ind w:left="0" w:right="0"/>
					</w:pPr>
					<w:r>
						<w:rPr>
							<w:sz w:val="24"/>
							<w:szCs w:val="24"/>
						</w:rPr>
						<w:t>
							<xsl:value-of select="*[contains(@id, $prodSystemName)]"/>
						</w:t>
					</w:r>
				</w:p>
			</xsl:otherwise>
		</xsl:choose>

		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1800" w:type="dxa"/>
				<w:gridCol w:w="7704" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Специальность&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
							<w:i/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:i/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodStudentSpecialityTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>

		<w:p/>
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1000" w:type="dxa"/>
				<w:gridCol w:w="8504" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Группа&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:i/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodStudentGroupTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
		
		<!-- Наименование документа -->
		<w:p/>
		<w:p>
			<w:pPr>
				<w:pStyle w:val="DocDesc"/>
				<!--w:pStyle w:val="Titylist12"/-->
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
						w:cs="Times New Roman"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
					<w:b/>
				</w:rPr>
				<w:t>
					<xsl:value-of select="*[contains(@id, 'prodTypeTL')]"/>
				</w:t>
			</w:r>
		</w:p>

		<!-- номер документа -->
		<w:p>
			<w:pPr>
				<w:pStyle w:val="DocNum"/>				
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
					<w:sz w:val="24"/>
					<w:szCs w:val="24"/>
					<!-- <w:lang w:val="ru-RU"/> -->
				</w:rPr>
				<w:t>
					<xsl:value-of select="*[contains(@id, 'prodNumDocTL')]"/>
				</w:t>
			</w:r>
		</w:p>

		<!-- Уровень образования -->
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="2380" w:type="dxa"/>
				<w:gridCol w:w="7124" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Уровень образования&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:i/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodEduLevel')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
		<w:p/>
		
		<!-- Вид ВКР -->
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1134" w:type="dxa"/>
				<w:gridCol w:w="8370" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Вид ВКР&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
								<w:i/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodTypeOfWorkTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
		<w:p/>
		
		<!-- Тема -->
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="709" w:type="dxa"/>
				<w:gridCol w:w="8795" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Тема&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
								<w:i/>
								<w:b/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodThemeTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>

		<!-- Нормоконтролер -->
		<w:p/>
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1984" w:type="dxa"/>
				<w:gridCol w:w="7520" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Нормоконтролер&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
								<w:i/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodApproverTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>
			
		<!-- Руководитель -->
		<w:p/>
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1559" w:type="dxa"/>
				<w:gridCol w:w="7945" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Руководитель&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
								<w:i/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodSupervisorTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>

		<!-- Студент -->
		<w:p/>
		<w:tbl>
			<w:tblPr>
				<w:tblW w:w="{$tblWidth}" w:type="dxa"/>
				<w:tblInd w:w="0" w:type="dxa"/>
				<w:tblLayout w:type="fixed"/>
				<w:tblLook w:val="00A0" w:firstRow="1" w:lastRow="0" w:firstColumn="1"
					w:lastColumn="0" w:noHBand="0" w:noVBand="0"/>
				<w:tblCellMar>
					<w:left w:w="0" w:type="dxa"/>
					<w:right w:w="0" w:type="dxa"/>
				</w:tblCellMar>
			</w:tblPr>
			<w:tblGrid>
				<w:gridCol w:w="1134" w:type="dxa"/>
				<w:gridCol w:w="8370" w:type="dxa"/>
			</w:tblGrid>
			<w:tr>
				<w:tc>
					<w:p>
						<w:pPr>
							<w:jc w:val="left"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
							</w:rPr>
							<w:t>
								<xsl:value-of select="'Студент&#160;'"/>
							</w:t>
						</w:r>
					</w:p>
				</w:tc>
				<w:tc>
					<w:tcPr>
						<w:tcBorders>
							<w:bottom w:val="single" w:sz="4" w:space="0" w:color="auto"/>
						</w:tcBorders>
					</w:tcPr>
					<w:p>
						<w:pPr>
							<w:jc w:val="center"/>
						</w:pPr>
						<w:r>
							<w:rPr>
								<w:noProof/>
								<w:sz w:val="24"/>
								<w:szCs w:val="24"/>
								<w:i/>
							</w:rPr>
							<w:t><xsl:value-of select="keyword[contains(@id, 'prodStudentFIOTL')]"/></w:t>
						</w:r>
					</w:p>
				</w:tc>
			</w:tr>
		</w:tbl>

		<w:p>
			<w:pPr>
				<w:pStyle w:val="Invisible"/>
				<w:rPr>
					<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
						w:cs="Times New Roman"/>
					<!-- <w:lang w:val="ru-RU"/> -->
				</w:rPr>
			</w:pPr>
			<w:r>
				<w:rPr>
					<w:rFonts w:ascii="Times New Roman" w:hAnsi="Times New Roman"
						w:cs="Times New Roman"/>
					<!-- <w:b/> -->
					<w:lang w:val="ru-RU" w:eastAsia="ru-RU"/>
				</w:rPr>
				<mc:AlternateContent>
					<mc:Choice Requires="wps">
						<w:drawing>
							<wp:anchor distT="0" distB="0" distL="114300" distR="114300"
								simplePos="0" relativeHeight="251657216" behindDoc="0" locked="0"
								layoutInCell="1" allowOverlap="1">
								<wp:simplePos x="0" y="0"/>
								<wp:positionH relativeFrom="page">
									<wp:align>center</wp:align>
								</wp:positionH>
								<wp:positionV relativeFrom="page">
									<wp:posOffset>9849601</wp:posOffset>
								</wp:positionV>
								<wp:extent cx="1669415" cy="290195"/>
								<wp:effectExtent l="0" t="0" r="6350" b="0"/>
								<wp:wrapNone/>
								<wp:docPr id="22" name="Надпись 22"/>
								<wp:cNvGraphicFramePr/>
								<a:graphic
									xmlns:a="http://schemas.openxmlformats.org/drawingml/2006/main">
									<a:graphicData
										uri="http://schemas.microsoft.com/office/word/2010/wordprocessingShape">
										<wps:wsp>
											<wps:cNvSpPr txBox="1"/>
											<wps:spPr>
												<a:xfrm>
												<a:off x="0" y="0"/>
												<a:ext cx="1669415" cy="290195"/>
												</a:xfrm>
												<a:prstGeom prst="rect">
												<a:avLst/>
												</a:prstGeom>
												<a:solidFill>
												<a:schemeClr val="lt1"/>
												</a:solidFill>
												<a:ln w="6350">
												<a:noFill/>
												</a:ln>
												<a:effectLst/>
											</wps:spPr>
											<wps:style>
												<a:lnRef idx="0">
												<a:schemeClr val="accent1"/>
												</a:lnRef>
												<a:fillRef idx="0">
												<a:schemeClr val="accent1"/>
												</a:fillRef>
												<a:effectRef idx="0">
												<a:schemeClr val="accent1"/>
												</a:effectRef>
												<a:fontRef idx="minor">
												<a:schemeClr val="dk1"/>
												</a:fontRef>
											</wps:style>
											<wps:txbx>
												<w:txbxContent>
												<w:p w:rsidR="00D855A6" w:rsidRDefault="00D855A6"
												w:rsidP="00D855A6">
												<w:pPr>
												<w:jc w:val="center"/>
												</w:pPr>
												<w:r>
												<w:rPr>
												<w:rFonts w:ascii="Times New Roman"
												w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
												<!-- <w:b/> -->
												<!-- <w:lang w:val="ru-RU"/> -->
												<w:sz w:val="24"/>
												<w:szCs w:val="24"/>
												</w:rPr>
												<w:t>
												<xsl:value-of select="*[contains(@id, 'yearTL')]"
												/>
												</w:t>
												</w:r>
												</w:p>
												</w:txbxContent>
											</wps:txbx>
											<wps:bodyPr rot="0" spcFirstLastPara="0"
												vertOverflow="overflow" horzOverflow="overflow"
												vert="horz" wrap="square" lIns="91440" tIns="45720"
												rIns="91440" bIns="45720" numCol="1" spcCol="0"
												rtlCol="0" fromWordArt="0" anchor="t" anchorCtr="0"
												forceAA="0" compatLnSpc="1">
												<a:prstTxWarp prst="textNoShape">
												<a:avLst/>
												</a:prstTxWarp>
												<a:noAutofit/>
											</wps:bodyPr>
										</wps:wsp>
									</a:graphicData>
								</a:graphic>
								<wp14:sizeRelV relativeFrom="margin">
									<wp14:pctHeight>0</wp14:pctHeight>
								</wp14:sizeRelV>
							</wp:anchor>
						</w:drawing>
					</mc:Choice>
					<mc:Fallback>
						<w:pict>
							<v:shapetype id="_x0000_t202" coordsize="21600,21600" o:spt="202"
								path="m,l,21600r21600,l21600,xe">
								<v:stroke joinstyle="miter"/>
								<v:path gradientshapeok="t" o:connecttype="rect"/>
							</v:shapetype>
							<v:shape id="Надпись 22" o:spid="_x0000_s1026" type="#_x0000_t202"
								style="position:absolute;left:0;text-align:left;margin-left:177.4pt;margin-top:740.7pt;width:131.45pt;height:22.85pt;z-index:251657216;visibility:visible;mso-wrap-style:square;mso-height-percent:0;mso-wrap-distance-left:9pt;mso-wrap-distance-top:0;mso-wrap-distance-right:9pt;mso-wrap-distance-bottom:0;mso-position-horizontal:absolute;mso-position-horizontal-relative:text;mso-position-vertical:absolute;mso-position-vertical-relative:page;mso-height-percent:0;mso-height-relative:margin;v-text-anchor:top"
								o:gfxdata="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&#xA;"
								fillcolor="white [3201]" stroked="f" strokeweight=".5pt">
								<v:textbox>
									<w:txbxContent>
										<w:p w:rsidR="00D855A6" w:rsidRDefault="00D855A6"
											w:rsidP="00D855A6">
											<w:pPr>
												<w:jc w:val="center"/>
											</w:pPr>
											<w:r>
												<w:rPr>
												<w:rFonts w:ascii="Times New Roman"
												w:hAnsi="Times New Roman" w:cs="Times New Roman"/>
												<!-- <w:b/> -->
												<!-- <w:lang w:val="ru-RU"/> -->
												<w:sz w:val="24"/>
												<w:szCs w:val="24"/>
												</w:rPr>
												<w:t>
												<xsl:value-of select="*[contains(@id, 'yearTL')]"
												/>
												</w:t>
											</w:r>
										</w:p>
									</w:txbxContent>
								</v:textbox>
								<w10:wrap anchory="page"/>
							</v:shape>
						</w:pict>
					</mc:Fallback>
				</mc:AlternateContent>
			</w:r>
		</w:p>
	</xsl:template>
</xsl:stylesheet>
