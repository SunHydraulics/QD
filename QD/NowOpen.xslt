<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template name="nowopentemplate">

    <div class="title">
      <xsl:if test="//page/qd[not (qsummary/@partno)]">
        <xsl:value-of select="//page/qd/screenlabels[@id='410']/@label"/>
        <!--Creating a new design -->

      </xsl:if>
      <xsl:if test="//page/qd/qsummary/@partno">
        <xsl:value-of select="//page/qd/screenlabels[@id='411']/@label"/>:
        <!--Now open-->
        <xsl:if test="//page/qd/qsummary/@qdpartno">
          <xsl:value-of select="//page/qd/qsummary/@qdpartno"/>
        </xsl:if>
        <xsl:if test="//page/qd/qsummary[not (@qdpartno)]">
          <xsl:value-of select="//page/qd/qsummary/@partno"/>
        </xsl:if>
        <div class="divmore">
          <a href="#" title="Display more filters">
            <xsl:attribute name="onclick">
              $("#divnowopen").toggle();
              return false;
            </xsl:attribute>
            See detail
          </a>
        </div>
      </xsl:if>
    </div>
    <div id="divnowopen">
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='415']/@label"/>:
        <!--Created by:-->
        <xsl:value-of select="//page/qd/qdsummary/@username"/>,
        <xsl:value-of select="//page/qd/qdsummary/@createdate"/>
        <xsl:if test="//page/qd/qdsummary/@email">
          <br/>
          <xsl:value-of select="//page/qd/qsummary/@email"/>
        </xsl:if>
      </div>
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='416']/@label"/>:
        <!--Company:-->
        <xsl:value-of select="//page/qd/qdsummary/@company"/>
      </div>
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='417']/@label"/>:
        <!--Company Type:-->
        <xsl:value-of select="//page/qd/qdsummary/@locationtype"/>
      </div>
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='88']/@label"/>:
        <!--Customer:-->:
        <xsl:value-of select="//page/qd/qdsummary/@customer"/>
      </div>
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='418']/@label"/>:
        <!--Version-->
        <xsl:value-of select="//page/qd/qdsummary/@rev"/>,
        <xsl:value-of select="//page/qd/qdsummary/@revdate"/>
      </div>
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='419']/@label"/>:
        <!--Status: -->
        <xsl:value-of select="//page/qd/qdsummary/@status"/>
      </div>


    </div>
    <xsl:if test="//page/qd/islocked">
      <div>
        <xsl:value-of select="//page/qd/screenlabels[@id='420']/@label"/>
        <!--This design is locked! -->
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>

