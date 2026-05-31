<?xml version="1.0" encoding="UTF-8"?>
<!--
  Модифицированный общий XSL-шаблон, путь до которого нужно прописать в билд-файле сборки перед вызовом dita-ot:
    <property name="document.xsl" location="${basedir}/xsl/org.rcrekb.docx.mod/docx/word/kzn.document.xsl"/>
  Необходим для импорта своих XSl-файлов, для которых в плагине org.rcrekb.docx не предусмотрено ANT-property, например, как для document.topic.xsl.
  ids.document.xsl, v20260529
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               version="2.0">
  <!-- Импортируем XSL-файл из плагина -->
  <xsl:import href="plugin:org.rcrekb.docx:docx/word/document.xsl"/>
  <!-- Импортируем свой XSL-файл со своим template -->
  <xsl:import href="ktk.document.title.xsl"/>
</xsl:stylesheet>
