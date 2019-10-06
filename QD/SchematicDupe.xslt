<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="reporthead">
          <xsl:value-of select="//page/qd/screenlabels[@id=703]/@label"/> 
          <!--Copy a Schematic and use it with this Project: -->
          <span style="padding-left:4px;"><xsl:value-of select="//page/qd/thispartno/@fullpartno"/></span>
        </div>
       <xsl:if test="//page[qd/errormessage or errormessage]">
          <div id="errormessage">
            <xsl:value-of select="//page/qd/errormessage"/>
            <xsl:value-of select="//page/errormessage"/>
          </div>
        </xsl:if>
        <xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">
          <section class="bg--light-grey pad block bottom-space grid lightborder">
            <div class="commenttext">
              <span style="padding-left:28px;">
                <xsl:value-of select="//page/qd/screenlabels[@id=705]/@label"/>
                <!--Enter the project to copy from-->
              </span> 
              <div class="divusersearch">
                <xsl:value-of select="//page/qd/screenlabels[@id=707]/@label"/>
                <!--P/N--> <input name="data_pn" id="data_pn" maxlength="30">
                  <xsl:attribute name="onchange">
                    var str='<xsl:value-of select="//page/qd/thispartno/@fullpartno"/>';
                    str = str.replace(/-/g,"");
                    str = str.replace(/ /g,"");
                    sthisval = this.value;
                    sthisval = sthisval.replace(/-/g,"");
                    sthisval = sthisval.replace(/ /g,"");
                    var n = str.search(sthisval);
                    if (n &gt; -1){
                      var smess='<xsl:value-of select="//page/qd/screenlabels[@id=708]/@label"/>';
                      //'Select a different project'
                      alert(smess);
                      return;
                    }
                    loadXMLDoc("qd_findschematic", this);
                  </xsl:attribute>
                </input>

                <input type="button" value=">" style="width: 20px;
                  color: white;
                  background-color:#4F4F4F;
                  font-weight: bold;
                  margin-left: 2px;
                  padding-left: 5px; 
                  margin-right: 3px;"/>
                <xsl:value-of select="//page/qd/screenlabels[@id=418]/@label"/>
                <!--Revision/Version -->
                <div id="divrevlist" style="display:inline;"></div>
                <input id="viewschematic" class="button bg--darker-grey" type="button"
                       style="width:200px;float:right;display:none;"> <!--view schematic-->
                  <xsl:attribute name="value">
                    <xsl:value-of select="//page/qd/screenlabels[@id=710]/@label"/>                   
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                    var surl='<xsl:value-of select="//page/qd/schematiclink/@surl"/>';
                    surl += $("#revlist").val();
                    surl += '-FC20C';
                    //alert(surl)
                    var nwin = window.open(surl,
                    'schematic', 'menubar=0,toolbar=0,scrollbars=1,height=880,width=840,left=30,top=30,resizable=yes')
                    nwin.focus();
                  </xsl:attribute>
                </input>
              </div>
            </div>
            </section>
            <section id="divcopyto" class="bg--light-grey pad block bottom-space grid lightborder nodisplay">
              <div class="commenttext">
                <xsl:value-of select="//page/qd/screenlabels[@id=704]/@label"/>
                <!--Copy the listed schematic to the current project:--> <xsl:value-of select="//page/qd/thispartno/@fullpartno"/>?
                <input id="copyschematic" class="button bg--darker-grey" type="button"
                       style="width:200px;float:right;">
                 <xsl:attribute name="value">
                    <xsl:value-of select="//page/qd/screenlabels[@id=702]/@label"/>                   
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                    var smess='<xsl:value-of select="//page/qd/screenlabels[@id=701]/@label"/>';
                    // sure you want to continue?
                    if(confirm(smess)==false){return false};
                    var surl='<xsl:value-of select="//page/qd/schematiclink/@qdsurl"/>';
                    surl += "&amp;copyfrom="+$("#revlist").val();
                    //alert(surl)
                    var nwin = window.open(surl,
                    'schematic', 'menubar=0,toolbar=0,scrollbars=1,height=880,width=840,left=30,top=30,resizable=yes')
                    nwin.focus();
                  </xsl:attribute>
                </input>                
              </div>
              

              <div class="grayitalic">
                <br/>
                <xsl:if test="//page/qd/thispartno/@willoverwrite">
                  <xsl:value-of select="//page/qd/screenlabels[@id=706]/@label"/>
                </xsl:if>
                <xsl:value-of select="//page/qd/screenlabels[@id=709]/@label"/>
                <!--
                Note: This process will <xsl:if test="//page/qd/thispartno/@willoverwrite">
                  overwrite the existing schematic and </xsl:if>open the copied schematic in a new window.
                You can close the new schematic window to continue working in your original session.
                -->
              </div>
          </section>
        </xsl:if>
      </div>
      <div class="container" style="text-align:center;padding-top:12px;">
        <a href="#" style="">
          <xsl:attribute name="onclick">
            window.close();
            return false;
          </xsl:attribute>
          Close
        </a>
      </div>
    </div>

  </xsl:template>
</xsl:stylesheet>
