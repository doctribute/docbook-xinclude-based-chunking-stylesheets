<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:param name="generate.toc" xml:space="preserve">
      article toc
      book toc
      chapter toc
      section toc
   </xsl:param>

   <xsl:param name="generate.section.toc.level" select="10"/>

   <xsl:template name="component.toc">
      <xsl:param name="toc-context" select="."/>
      <xsl:param name="toc.title.p" select="true()"/>

      <xsl:if test="processing-instruction('toc') and section">
         <xsl:call-template name="toc.local"/>
      </xsl:if>
   </xsl:template>

   <xsl:template name="section.toc">
      <xsl:param name="toc-context" select="."/>
      <xsl:param name="toc.title.p" select="true()"/>

      <xsl:if test="processing-instruction('toc') and section">
         <xsl:call-template name="toc.local"/>
      </xsl:if>
   </xsl:template>

   <xsl:template name="toc.local">
      <div>
         <h3>
            <xsl:call-template name="gentext">
               <xsl:with-param name="key" select="'TableofContents'"/>
            </xsl:call-template>
         </h3>
         <ul>
            <xsl:for-each select="section">
               <li>
                  <a>
                     <xsl:attribute name="href">
                        <xsl:call-template name="href.target"/>
                     </xsl:attribute>
                     <xsl:apply-templates select="." mode="titleabbrev.markup"/>
                  </a>
               </li>
            </xsl:for-each>
         </ul>
      </div>
   </xsl:template>

</xsl:stylesheet>
