<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <div class="container">
      <a href="#" style="">
        <xsl:attribute name="onclick">
          window.close();
          return false;
        </xsl:attribute>
        Close
      </a>
    </div>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="reporthead">
          SunDesign Justification: <xsl:value-of select="//page/qd/parts/@partno"/>
        </div>
        <xsl:if test="//page[qd/errormessage or errormessage]">
          <div id="errormessage">
            <xsl:value-of select="//page/qd/errormessage"/>
            <xsl:value-of select="//page/errormessage"/>
          </div>
        </xsl:if>
        <xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">
            <div class="commenttext">
              Select the reasons why this design is a good candidate for SunDesign instead of QuickDesign.
             
            </div><br/>
          <section class="bg--light-grey pad block bottom-space grid lightborder ">

            <div class="commenttext">
              <xsl:for-each select="//page/qd/reasons">
                <div style="height:30px;">
                <input type="checkbox" style="width:40px">
                  <xsl:if test="@selected">
                    <xsl:attribute name="checked"></xsl:attribute>

                  </xsl:if>
                  <xsl:attribute name="id">sd<xsl:value-of select="@attrid"/>_<xsl:value-of select="@partid"/></xsl:attribute>
                  <xsl:attribute name="name">sd<xsl:value-of select="@attrid"/>_<xsl:value-of select="@partid"/></xsl:attribute>
                  <xsl:attribute name="onclick">
                    $(this).val(this.checked ? "TRUE" : "FALSE");
                    <xsl:if test="@mayhavenotes">
                      $("#notesdiv").show();
                      $(this).prop( "checked", true );
                      $(this).prop( "disabled", true );
                    </xsl:if>
                    <xsl:if test="not(@mayhavenotes)">
                      loadXMLDoc("qd_sdjustify", this);
                    </xsl:if>
                    
                  </xsl:attribute>
                </input>
                <xsl:value-of select="@name"/>
                  <xsl:if test="@username">
                    <span style="float:right;font-size:80%;color:#666666;">
                      - <xsl:value-of select="@username"/>
                    </span>
                  </xsl:if>
                  <xsl:if test="@mayhavenotes">
                    <div id="notesdiv" style="width:700px;margin-left:30px;margin-top:8px;">
                       <xsl:if test="not(@shownotes)">
                        <xsl:attribute name="style">width:500px;margin-left:30px;margin-top:8px;display:none</xsl:attribute>
                      </xsl:if>
                      <input style="width:100%;font-size:85%;"><xsl:attribute name="id">sdnotes<xsl:value-of 
                        select="@partid"/></xsl:attribute>
                        <xsl:attribute name="value">
                          <xsl:value-of select="@notes"/>
                        </xsl:attribute>
                        </input>
                      <!--
                      <textarea><xsl:attribute name="id">sdnotes<xsl:value-of 
                        select="@partid"/></xsl:attribute><xsl:value-of 
                          select="@notes"/></textarea>
                       -->
                      <br/>
                      <a href="#">
                        <xsl:attribute name="id">sd<xsl:value-of select="@attrid"/>_<xsl:value-of select="@partid"/></xsl:attribute>
                        <xsl:attribute name="onclick">
                          //stext=document.getElementById('sdnotes<xsl:value-of select="@partid"/>').innerHTML;
                          loadXMLDoc("qd_sdjustifynotes", $("#sdnotes<xsl:value-of select="@partid"/>"));
                          //loadXMLDoc("qd_sdjustifynotes", stext);
                          location.reload();
                          return false;
                        </xsl:attribute>
                        Save note</a>  
                      <a href="#" style="padding-left:30px;">
                        <xsl:attribute name="onclick">
                          location.reload();
                          return false;
                        </xsl:attribute>
                        Cancel
                      </a>
                    </div>
                  </xsl:if> 
                  
               </div>
                
              </xsl:for-each>
            </div>

          </section>

        </xsl:if>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
