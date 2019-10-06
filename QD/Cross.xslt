<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/" name="cross">
    <div style="display:block;" >
    <table cellpadding="2" cellspacing="2" style="border-spacing:8px !important;border-collapse:separate;border:none;
           display:table !important;">
      <tr>
        <td class="crossout"></td>
        <td class="crosscenter">
             <xsl:value-of select="//page/qd/screenlabels[@id='187']/@label"/><!--top-->
         </td>
        <td class="crossout"></td>
        <td class="crossout"></td>
      </tr>
      
      <tr>
        <td class="crossedge">
          <xsl:value-of select="//page/qd/screenlabels[@id='180']/@label"/><!--left-->
          </td>
        <td class="crosscenter cross30">
          <xsl:value-of select="//page/qd/screenlabels[@id='178']/@label"/><!--front-->
          </td>
        <td class="crossedge">
          <xsl:value-of select="//page/qd/screenlabels[@id='186']/@label"/><!--right-->
          </td>
        <td class="crosscenter cross30">
          <xsl:value-of select="//page/qd/screenlabels[@id='167']/@label"/><!--back-->
          </td>
      </tr>
      <tr>
        <td class="crossout"></td>
        <td class="crosscenter">
          <xsl:value-of select="//page/qd/screenlabels[@id='169']/@label"/><!--bottom-->
          </td>
        <td class="crossout"></td>
        <td class="crossout"></td>
      </tr>
    </table>
    </div>
  </xsl:template>
</xsl:stylesheet>
