<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <xsl:for-each select="//page/qd/cutsheet">
      <xsl:variable name="thisproduct" select="."/>
      <div class="wrapper">
        <!--
        <div style="margin-bottom:4px;color:#666666;font-family:sans-serif;font-size:90%;margin-left:180px;
            margin-top:-10px;">
          Cut Sheet
        </div>
        -->
        <table cellpadding="2" style="width:100%;border:0;border-collapse:collapse;">
          <tr>
            <td style="border-bottom:1px solid black;border-right:1px solid black;width:185px;">
              <img src="images/quickdesign-logo-small.png"/>
            </td>
            <td style="border-bottom:1px solid black;border-right:1px solid black;">
              <div class="cutsheetlarge">
                MODEL
                <div style="color:#ee5222;">
                  <xsl:value-of select="$thisproduct/@partno"/>
                </div>
              </div>
            </td>
            <td style="border-bottom:1px solid black;border-right:1px solid black;">
              <div class="cutsheetheader">
                <xsl:value-of select="$thisproduct/@productname"/>
              </div>

              <div class="cutsheetlarge" style="padding-top:4px;">
                SERIES  <xsl:value-of select="//page/qd/techdata[@product=$thisproduct/@product and @name='Series']/@usval"/>
                /
                CAPACITY: <span >
                  <xsl:value-of select="//page/qd/techdata[@product=$thisproduct/@product and @name='Capacity']/@usval"/>
                </span>
                /
                CAVITY: <span >
                  <xsl:value-of select="//page/qd/techdata[@product=$thisproduct/@product and @name='Cavity']/@usval"/>
                </span>
              </div>
            </td>
            <td style="padding-left:10px;border-bottom:1px solid black;margin:10px;">
              <div id="qrcodediv">
                <xsl:attribute name="id">qrcodediv<xsl:value-of select="$thisproduct/@id"/>
                </xsl:attribute>
              </div>
              <script type="text/javascript">
                var spath='<xsl:value-of select="$thisproduct/@webpath"/>';
                var sthisdiv = document.getElementById("qrcodediv<xsl:value-of select='$thisproduct/@id'/>");
                var qrcode = new QRCode(sthisdiv, {
                text: spath,
                width: 80,
                height: 80,
                colorDark : "#000000",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.H
                });

              </script>
            </td>
          </tr>
          <tr>
            <td colspan='3'></td>
            <td class='cutsheettext'>
              snhy.com/<span  style="color:#ee5222;">
                <xsl:value-of select="$thisproduct/@partno"/>
              </span>
            </td>
          </tr>
        </table>
        <table style="width:100%;margin-top:8px;">
          <tr>
            <td valign="top" style="width:3in;">
              <div style="text-align:center;">
                <img>
                  <xsl:attribute name="src">
                    <xsl:value-of select="$thisproduct/@imgpath"/>
                  </xsl:attribute>
                </img>
              </div>
              <div class="cutsheettext" style="text-align:center;padding-top:10px;">
                <xsl:value-of select="$thisproduct/@imglabel"/>
              </div>
              <xsl:if test="//page/qd/options[@modelid=$thisproduct/@modelid]">
                <div class="cutsheetlarge" style="text-align:left;margin-top:32px;
                      margin-bottom:8px;">
                  CONFIGURATION
                </div>
                <table cellpadding="2" style="width:100%;border-collapse:collapse;">
                  <xsl:for-each select="//page/qd/options[@product=$thisproduct/@product]">
                    <xsl:variable name="thisconfig" select="."/>
                    <tr>
                      <td class="cutsheettext" valign="top"
                            style="padding-botton:4px;border-bottom:1px solid #444444;">
                        <b>
                          <xsl:value-of select="$thisconfig/option[@selected]/@code"/>
                        </b>
                      </td>
                      <td valign="top" class="cutsheettext"
                          style="border-bottom:1px solid #444444;">
                        <xsl:value-of select="@optioncategory"/>
                      </td>
                      <td class="cutsheettext"
                          style="border-bottom:1px solid #444444;">
                        <xsl:value-of select="$thisconfig/option[@selected]/@optiontext"/>
                      </td>
                    </tr>
                  </xsl:for-each>

                </table>
              </xsl:if>
              <!--
              <hr/>
              <div class="cutsheetheader" style="text-align:left;">
                RELATED ACCESSORIES
              </div>
              <div class="cutsheettext">
                <xsl:for-each select="//page/qd/accessories[@product=$thisproduct/@product]">
                  <xsl:value-of select="@model"/> .
                </xsl:for-each>
              </div>
              <hr/>
              -->
            </td>
            <td valign="top" style="padding-left:10px;">
              <div style="text-align:center">
                <img style="max-width:550px">
                  <xsl:attribute name="src">
                    <xsl:value-of select="$thisproduct/@qtrpath"/>
                  </xsl:attribute>
                </img>
              </div>
              <div class="cutsheettext" style="padding-bottom:10px;padding-top:10px;">
                <xsl:value-of select="$thisproduct/@descrip"/>
              </div>

              <div class="cutsheetlarge" style="margin-top:8px;margin-bottom:8px;">
                TECHNICAL DATA
              </div>
              <div style="border-left:1px solid #444444;
                   border-right:1px solid #444444;
                   border-top:1px solid #444444;">
                <table cellpadding="2" style="width:100%;border-collapse:collapse;">
                  <xsl:for-each select="//page/qd/techdata[@product=$thisproduct/@product and @isinclude]">
                    <tr>
                      <td class="cutsheettext" nowrap="true" style="padding-right:10px;padding-left:5px;
                          border-bottom:1px solid #444444;">
                        <xsl:value-of select="@name"/>
                      </td>
                      <td class="cutsheettext" nowrap="true" style="padding-right:5px;padding-left:5px;
                          border-bottom:1px solid #444444; border-left:1px solid #444444;">
                        <xsl:value-of select="@usval"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <xsl:if test="//page/qd/notes[@product=$thisproduct/@product]">
          <hr/>
          <table>
            <tr>
              <td class="cutsheetlarge" valign="top" style="text-align:left;">
                NOTES
              </td>
              <td class="cutsheettext" valign="top">
                <xsl:for-each select="//page/qd/notes[@product=$thisproduct/@product]">
                  <div>
                    <xsl:value-of select="@descrip"/>
                  </div>
                </xsl:for-each>
              </td>
            </tr>
          </table>
        </xsl:if>
        <xsl:if test="//page/qd/options[@product=$thisproduct/@product]">
          <hr/>
          <table style="width:100%;">
            <tr>
              <td class="cutsheetlarge" style="width:230px;">CONFIGURATION OPTIONS</td>
              <td class="cutsheetlarge">
                Model code example:
                <xsl:value-of select="$thisproduct/@product"/>
              </td>
            </tr>
          </table>
          <table style="margin-top:12px;">
            <tr>
              <xsl:for-each select="//page/qd/options[@product=$thisproduct/@product]">
                <xsl:variable name="thisoption" select="."/>
                <td valign="top" style="padding-left:10px;width:300px;">
                  <div class="cutsheetheader" style="border-bottom:1px solid black;white-space: nowrap;
                   text-transform: uppercase;">
                    <xsl:value-of select="@optioncategory"/>
                  </div>
                  <table style="width:100%;">
                    <xsl:for-each select="$thisoption/option">
                      <tr>
                        <td valign="top" class="cutsheettextbold">
                          <xsl:if test="@selected">
                            <xsl:attribute name="style">color:#FFFFFF;background-color:#000000;</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="@code"/>
                        </td>
                        <td valign="top" class="cutsheettext">
                          <xsl:if test="@selected">
                            <xsl:attribute name="style">color:#FFFFFF;background-color:#000000;</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="@optiontext"/>
                        </td>
                      </tr>
                    </xsl:for-each>
                    <xsl:if test="$thisoption[@codepos=11]">
                      <tr>
                        <td class="cutsheettext" colspan="2" style="font-size:85%;padding-top:12px;">
                          Additional coil options are available.
                        </td>
                      </tr>
                    </xsl:if>
                  </table>
                </td>
              </xsl:for-each>
            </tr>
          </table>
        </xsl:if>
      </div>
      <div class="footer">
        <table style="width: 100%;">
          <tr>
            <td class="cutsheettext">
              Created on <xsl:value-of select="//page/qd/today"/>
            </td>
            <td class="cutsheettext">
              Copyright © 2019 Sun Hydraulics
            </td>
            <td class="cutsheettext">
              See www.sunhydraulics.com for detailed product information
            </td>
            <td class="cutsheettext">
              <xsl:value-of select="$thisproduct/@id"/> of <xsl:value-of select="//page/qd/numpages/@id"/>
            </td>
          </tr>
        </table>
      </div>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>