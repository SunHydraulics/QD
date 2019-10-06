<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <header class="site--header container">
      <input type="hidden" id="languageid" name="languageid">
        <xsl:attribute name="value">
          <xsl:value-of select="//page/qd/languageid"/>
        </xsl:attribute>
      </input>
			<input type="hidden" id="qid" name="qid"/>
			<input type="hidden" id="qtran" name="qtran"/>
			<input type="hidden" id="atran" name="atran"/>
      <div id="screenmessage" class="speechbubble nodisplay"/>
      <div class="logo-wrapper">
        <a href="default.aspx">
          <img src="images/QuickDesign-Logo.svg" alt="" class="logo"
               onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
        </a>
      </div>
			<xsl:if test="//page/qd/errormessage">
				<div id="errormessage" class="notecard">
					<xsl:value-of select="//page/qd/errormessage"/>
				</div>
			</xsl:if>
      <div class="page-header pad">
        <h1 class="title">
          Help Admin
        </h1>

				<div style="background-color:#eeeeee;font-size:85%;padding:8px;float:right;margin-top:30px;">
										Languages
										<select id="lstlanguages" name="lstlanguages" style="width:180px;">
											  <xsl:attribute name="onchange">
                          submitit()
                          return false                         
                        </xsl:attribute>
											<option> English only</option>
											<xsl:for-each select ="//page/qd/languages">
												<option>
													
													<xsl:attribute name="value"><xsl:value-of select="@id"/></xsl:attribute>
													<xsl:if test="@selected">
														<xsl:attribute name="selected">true</xsl:attribute>												
													</xsl:if>
													
													<xsl:value-of select="@name"/>
												</option>
											</xsl:for-each>
										</select>	
								</div></div>

    </header>
    <div class="site--wrapper">
      <div class="container bg--white content--wrapper pad noborder">
        <h2>Show only</h2>
        <div>
        <xsl:for-each select="//page/qd/attr">
          
          <input class="userbox" type="checkbox">
            <xsl:attribute name="name">chkso</xsl:attribute>
            <xsl:if test="@selected">
            <xsl:attribute name="checked">true</xsl:attribute>
            </xsl:if>
            <xsl:attribute name="value"><xsl:value-of select="@id"/></xsl:attribute>
            <xsl:attribute name="onclick">

              submitit();
            </xsl:attribute>
          
          </input>
           <labelfor class="labelfor"><xsl:value-of select="@name"/></labelfor>

          <br/>
        </xsl:for-each>
        </div>
          
       <table class="tablehelpadmin">          
        <xsl:for-each select="//page/qd/qdfaqs">
          
            <tr>
              <td>
                <xsl:value-of select="@sequenceorder"/>

                   <a class="helpanchor"><xsl:attribute name="id">alink<xsl:value-of select="@id"/></xsl:attribute></a>
              </td>
              <td>
                
                <div class="faqq">

                  <xsl:value-of select="@q" disable-output-escaping="yes"/>
                  <span>
                    <a class="ahelpedit" href="#">
                      <xsl:attribute name="id">aedit<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onclick">
                          loadXMLDoc("helpedit", this);
                          $(".faqdiv").show();
                          $('.popup-overlay').addClass('active');
                          return false
                          
                        </xsl:attribute>
                        Edit             
                    </a>

                </span>
                </div>
                <div class="faqa">
									
                  <xsl:value-of select="@a" disable-output-escaping="yes"/>
                </div>
								 <xsl:if test="//page/qd/languages/@selected">
									 
									 <div style="padding:8px;background-color:#eeeeee;">
										 <xsl:value-of select="//page/qd/languages[@selected]/@name"/>
										<div class="faqq">
										<textarea 
												style="overflow:auto;"><xsl:attribute 
												name="id">tranid<xsl:value-of select="@qtranid"/>
											</xsl:attribute><xsl:value-of select="@qtrans" disable-output-escaping="yes"/></textarea>
									</div>
									<div class="faqa">
										<textarea 
												style="overflow:auto;height:100px;"><xsl:attribute 
												name="id">tranid<xsl:value-of select="@atranid"/>
											</xsl:attribute><xsl:value-of select="@atrans" disable-output-escaping="yes"/></textarea>
							
									</div>	
									    <a class="ahelpedit" href="#">
                      <xsl:attribute name="id">aedit<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onclick">
													$("#qid").val('<xsl:value-of select="@id"/>');
													sthisq = $("#tranid<xsl:value-of select='@qtranid'/>").val();
													sthisa = $("#tranid<xsl:value-of select='@atranid'/>").val();
													$("#qtran").val(sthisq);
													$("#atran").val(sthisa);
                          submitit();
                          return false;
                        </xsl:attribute>
                        Save translation             
                    </a>
								</div>
								</xsl:if>

              </td>
            
            </tr>
        </xsl:for-each>
       </table>

        <div class="popup faqdiv">
          <div>
          <input type="button" class="button bg--darker-grey smallbutton" value="Close">
          <xsl:attribute name="onclick">
            $('.popup').hide();
            $('.popup-overlay').removeClass('active');
          </xsl:attribute>        
          </input>
          <input type="button" class="button bg--darker-grey smallbutton" value="Save">
          <xsl:attribute name="onclick">
            var aval=$("#txtid").val();
            aval="alink"+aval;
            submititanchor(aval);
          </xsl:attribute>        
          </input>
          </div>
					<hr/>
          <input type="hidden" id="txtid"></input>
          <div id="divhelpedit"> 

        </div> 
        </div>
      </div>
    </div>
    <div class="popup-overlay"></div>

    <br/>
    <br/>
  </xsl:template>
</xsl:stylesheet>
