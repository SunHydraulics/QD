<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <header class="site--header container">
      <div class="logo-wrapper">
        <a href="default.aspx?page=home">
          <img src="images/QuickDesign-Logo.svg" alt="" class="logo" 
               onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
        </a>
        <input type="hidden" id="data_languagechoice"></input>
        <div class="right tx--right">
          <div class="divlanglist">
            <script>
              <xsl:comment>
                $(".divlanglist")
                .mouseleave(function() {
                  $(".langoptions").hide();  
                  }
                )
           </xsl:comment>
            </script>
            <div>
              <xsl:for-each select="//page/qd/langflags[@selected]">
                <ul class="langselected">
                  <xsl:attribute name="onclick">
                    $(".tx--right").css("z-index","500")
                    $(".langoptions").toggle();
                    if ($('.langoptions').is(':visible')){
                      $("#langanchor").focus();
                    }

                  </xsl:attribute>
                  <li><xsl:value-of select="@alt"/>  </li>
                  
                </ul>
              </xsl:for-each>

            <div class="langoptions">
            <ul>
              <a id="langanchor"/>
              <xsl:for-each select="//page/qd/langflags[not (@selected)]">
                  <li>
                    <xsl:attribute name="id">langflag<xsl:value-of select="@languageid"/></xsl:attribute>
                    <xsl:attribute name="onclick">
                      loadXMLDoc("qd_language", this);
                      submitit();
                    </xsl:attribute>
                        <xsl:value-of select="@alt"/>
                  </li>               
              </xsl:for-each>            
            </ul> 
            </div>
            </div>



          </div>
<!--
          <div class="languages" style="display:none;">
            <xsl:if test="//page/qd/langflags">
              <xsl:for-each select="//page/qd/langflags">
                <a href="#">
                  <xsl:attribute name="id">langflag<xsl:value-of select="@languageid"/></xsl:attribute>
                  <xsl:attribute name="onclick">
                     loadXMLDoc("qd_language", this);
                     submitit();
                  </xsl:attribute>                 
                  <img>
                    <xsl:attribute name="src">images/<xsl:value-of select="@imagename"/></xsl:attribute> 
                    <xsl:attribute name="title"><xsl:value-of select="@alt"/></xsl:attribute>

                  </img>
                </a>


              </xsl:for-each>
            </xsl:if>
          </div>
-->
        </div>
      </div>

      <nav class="site--nav">
        <div class="links">
          <xsl:for-each select="//page/qd/headeritems">
            <a>
              <xsl:if test="@selected">
                <xsl:attribute name="selected">true</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="href">
                <xsl:value-of select="@surl"/>
              </xsl:attribute>
              <xsl:value-of select="@label"/>
            </a>
          </xsl:for-each>
        </div>

        <xsl:if test="//page/qd[not (adminlevel=1)]">
        <a href="default.aspx?logout=1" class="button bg--darker-grey small user-status">
          <xsl:value-of select="//page/qd/screenlabels[@id=594]/@label"/>
          <!--Sign Out--> 
          <span class="user divnowrap">
            <xsl:value-of select="//page/qd/screenlabels[@id=595]/@label"/>:
            <!--Logged in as--> <b>
              <xsl:value-of select="//page/qd/me/@name"/>
            </b>
          </span>
        </a>          
        </xsl:if>
        <xsl:if test="//page/qd[adminlevel=1]">
          <span class="sunuser">
            <xsl:value-of select="//page/qd/screenlabels[@id=596]/@label"/>:
            <!--Now online--> <b><xsl:value-of select="//page/qd/me/@name"/></b>
            <xsl:if test="//page/qd/adminurl">
              <br/>
                <a class="tx--orange underline">
                  <xsl:attribute name="href">
                    <xsl:value-of select="//page/qd/adminurl/@qdclassic"/>
                  </xsl:attribute>QD Classic
                </a>
            </xsl:if>
          </span>

        </xsl:if>
        <xsl:if test="//page/qd/custemail">
          <span class="custemail">
              <xsl:value-of select="//page/qd/custemail/@custemail" disable-output-escaping="yes"/>
          </span>       
        </xsl:if>
      </nav>
      <div class="page-header pad">
        <h1 class="title" id="masterheader">
          <xsl:value-of select="//page/qd/header"/><xsl:if
          test="//page/qd/qdsummary/@displaypartno">:
          <xsl:value-of select="//page/qd/qdsummary/@displaypartno"/></xsl:if>
        </h1>
        <xsl:if test="//page/qd/qdsummary">
          <div class="qdsummary">
            <a id="qdshowdetail" href="#">
            Detail [ + ]
            </a>
          </div>
          <div class="qddetail">
            <div class="close">x</div>
            <br/>
            <h2 class="block-title">
              <xsl:value-of select="//page/qd/qdsummary/@displaypartno"/>
            </h2>
            <table>
            <tr>
              <td>
              <xsl:value-of select="//page/qd/screenlabels[@id='415']/@label"/>:</td>
              <!--Created by:-->
              <td><xsl:value-of select="//page/qd/qdsummary/@username"/>,
              
                <xsl:value-of select="//page/qd/qdsummary/@createdate"/>
								<xsl:if test="//page/qd/qdsummary/@email">
									<br/>
									<span class="grayitalic"><xsl:value-of select="//page/qd/qdsummary/@email"/></span>
								</xsl:if>
              </td> 
            </tr>
              <tr>
                <td><xsl:value-of select="//page/qd/screenlabels[@id='416']/@label"/>:</td>
                <!--Company:-->
                <td>
                  <xsl:value-of select="//page/qd/qdsummary/@company"/> (
                  <xsl:value-of select="//page/qd/qdsummary/@code"/>)
                </td>
              </tr>
              <tr>
                <td><xsl:value-of select="//page/qd/screenlabels[@id='417']/@label"/>:</td>
            <!--Company Type:-->
              <td><xsl:value-of select="//page/qd/qdsummary/@locationtype"/>
              </td>
            </tr>

              <tr>
                <td><xsl:value-of select="//page/qd/screenlabels[@id='88']/@label"/>:</td>
              <!--Customer:-->
              <td><xsl:value-of select="//page/qd/qdsummary/@customer"/>
              </td>
              </tr>
              <xsl:if test="//page/qd/qdsummary/@showrev">
              <tr>
                <td><xsl:value-of select="//page/qd/screenlabels[@id='418']/@label"/>:</td>
              <!--Version-->
              <td><xsl:value-of select="//page/qd/qdsummary/@rev"/>,
              <xsl:value-of select="//page/qd/qdsummary/@revdate"/>
              </td>
            </tr>
              </xsl:if>
          <tr>
            <td><xsl:value-of select="//page/qd/screenlabels[@id='419']/@label"/>:</td>
              <!--Status: -->
              <td><xsl:value-of select="//page/qd/qdsummary/@status"/>
              
              </td>
            </tr>
            </table>
          </div>
        </xsl:if>
      </div>
    </header>
    <div class="backdrop"/>
  </xsl:template>
</xsl:stylesheet>
