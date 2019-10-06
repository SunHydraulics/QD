<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <div class="container bg--white pad content--wrapper pad">
      <section class="block bottom-space grid">
        <div class="notifications-wrapper">
          <xsl:for-each select="//page/qd/usermessages">
            <a class="notification alert pad-half" title="Go">
              <xsl:if test="@linkhref">
                <xsl:attribute name="href">
                  <xsl:value-of select="@linkhref"/>
                </xsl:attribute>
              </xsl:if>
              <xsl:attribute name="title">
                <xsl:value-of select="@linklabel"/>
              </xsl:attribute>
              <xsl:attribute name="onclick">
                <xsl:value-of select="@linkclick" disable-output-escaping="yes"/>
              </xsl:attribute>

              <xsl:value-of select="@smessage" disable-output-escaping="yes"/>
              <xsl:if test="@linkhref">
                <span class="arrow">
                  <xsl:value-of select="@linklabel"/> &#10141;
                </span>
              </xsl:if>
            </a>
          </xsl:for-each>
        </div>
      </section>

    </div>
  </xsl:template>
</xsl:stylesheet>
