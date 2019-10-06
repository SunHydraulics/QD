<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <xsl:for-each select="//page/qd/hiddenvariables">
      <input type="hidden">
        <xsl:attribute name="id"><xsl:value-of select="@idname"/></xsl:attribute>
        <xsl:attribute name="name"><xsl:value-of select="@idname"/></xsl:attribute>
        <xsl:attribute name="value"><xsl:value-of select="@svalue"/></xsl:attribute>
      </input>
    </xsl:for-each>
      <header class="site--header container">
        <div class="logo-wrapper">
        <a href="login.aspx">
          <img src="images/QuickDesign-Logo.svg" alt="" class="logo"
               onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
        </a>
        <div class="right tx--right">
          <xsl:if test="//page/qd[showflags and (action='0' or action='1')]">
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
                    <li>
                      <xsl:value-of select="@alt"/>
                    </li>

                  </ul>
                </xsl:for-each>

                <div class="langoptions">
                  <ul>
                    <a id="langanchor"/>
                    <xsl:for-each select="//page/qd/langflags[not (@selected)]">
                      <li>
                        <xsl:attribute name="id">
                          langflag<xsl:value-of select="@languageid"/>
                        </xsl:attribute>
                        <xsl:attribute name="onclick">
                          document.getElementById("languageid").value='<xsl:value-of select="@languageid"/>';
                          submitit();
                          return false;
                        </xsl:attribute>
                        <xsl:value-of select="@alt"/>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>



            </div>
          </xsl:if>
          <!--
          <div class="languages">
            <xsl:if test="//page/qd[showflags and (action='0' or action='1')]">
              <xsl:for-each select="//page/qd/langflags">
                <a href="#">
                  <xsl:attribute name="id">langflag<xsl:value-of select="@languageid"/>
                  </xsl:attribute>
                  <xsl:attribute name="onclick">
                    document.getElementById("languageid").value='<xsl:value-of select="@languageid"/>';
                    submitit();
                    return false;
                  </xsl:attribute>
                  <img>
                    <xsl:attribute name="src">
                      images/<xsl:value-of select="@imagename"/>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                      <xsl:value-of select="@alt"/>
                    </xsl:attribute>

                  </img>
                </a>


              </xsl:for-each>
            </xsl:if>
          </div>
          -->
        </div>
          
        </div>
        <div class="page-header pad">
          <h1 class="title">
            <xsl:value-of select="//page/qd/screenlabels[@id='694']/@label"/>
            <!--Register to use Sun QuickDesign-->
            </h1>
        </div>
      </header>
      <div class="site--wrapper">
        <div class="container bg--white pad content--wrapper">
          <div class="grayitalic">
             QuickDesign registration is intended only for Sun customers. Sun authorized Distributors
             and Integrators should contact <a href="mailto:SunQuickDesign@sunhydraulics.com">Sun</a> to request an account.
           </div>
         <a id="formtop"/>
         <div id="divpage1" class="container small pad bg--light-grey">
           <xsl:if test="//page/qd[action='2' or action='3']">
             <script language="javascript">$("#divpage1").addClass("nodisplay")   </script>
          </xsl:if>

           <xsl:if test="//page/qd/showlatinkeyboard">
             <div class="notepad">
               <xsl:value-of select="//page/qd/screenlabels[@id='484']/@label"/>
               <!--Use English/Latin keyboard -->
             </div>
           </xsl:if>
           <div class="grid">
              <xsl:for-each select="//page/qd/screencols">
                <div class="col-1-2">
                  <h2>
                    <xsl:value-of select="//page/qd/screen[@col=current()/@col and @stype='break']/@label"/>
                  </h2>
                  <xsl:for-each select="//page/qd/screen[@col=current()/@col and @stype != 'break']">
                    <xsl:if test="@idname='shipaddr1'">
                      <div class="row">
                        <input type="checkbox" id="shipsameas" name="shipsameas" class="autowidth">
                          <xsl:if test="//page/qd[not(showship)]">
                            <xsl:attribute name="checked">true</xsl:attribute>
                          </xsl:if>
                          <xsl:attribute name="onclick">
                            $("#divshiptonote").hide();
                            if(this.checked){
                            <xsl:for-each select="//page/qd/screen[@rsection='ship']">
                              sidname='<xsl:value-of select="@idname"/>';
                              cobj='crow'+sidname;
                              document.getElementById(cobj).style.display='none';
                              //document.getElementById("divshiptonote").style.display='none';
                              if(sidname != "shipcountryid"){
                              document.getElementById(sidname).value='';
                              }
                              if(sidname == "shipcountryid"){
                              document.getElementById(sidname).value='461';
                              }
                            </xsl:for-each>                    }
                            else {
                            <xsl:for-each select="//page/qd/screen[@rsection='ship']">
                              sidname='<xsl:value-of select="@idname"/>';
                              cobj='crow'+sidname;
                              document.getElementById(cobj).style.display='block';
                            </xsl:for-each>
                            }
                          </xsl:attribute>

                        </input>
                        <label class="nobreak"><xsl:value-of select="//page/qd/screenlabels[@id='64']/@label"/>
                        <!--Ship-to address is the same as the company address--></label>
                        
                      </div>
                    </xsl:if>
                    
                    
                    <div class="row">
                      <xsl:attribute name="id">crow<xsl:value-of select="@idname"/></xsl:attribute>
                      <xsl:if test="@rsection='ship' and //page/qd[not (showship)]">
                        <xsl:attribute name="style">display:none;</xsl:attribute>
                      </xsl:if>
                      <label for="firstName">
                        <xsl:attribute name="for">
                          <xsl:value-of select="@idname"/>
                        </xsl:attribute>
                        <xsl:value-of select="@label"/>
                      </label>
                      <xsl:if test="@serrmess">
                        <div class="missinginfo">
                          <xsl:value-of select="@serrmess" disable-output-escaping="yes"/>
                        </div>
                      </xsl:if>
                      <xsl:if test="@stype='none'">                    
                        <input type="text">
                          <xsl:attribute name="id"><xsl:value-of select="@idname"/></xsl:attribute>
                          <xsl:attribute name="name">
                            <xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <xsl:attribute name="maxlength">
                            <xsl:value-of select="@maxlen"/>
                          </xsl:attribute>
                          <xsl:attribute name="value">
                            <xsl:value-of select="@svalue"/>
                          </xsl:attribute>
                        </input>
                      </xsl:if>
                      <xsl:if test="@stype='statelist' or @stype='shipstatelist'">
                        <select>
                          <xsl:attribute name="id"><xsl:value-of select="@idname"/></xsl:attribute>
                          <xsl:attribute name="name">
                            <xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <option/>
                          <xsl:if test="@stype='statelist'">
                            <xsl:for-each select="//page/qd/states[@shiplist='0' and @countryid=//page/qd/selectedcountries/@countryid]">
                              <option>
                                <xsl:if test="@selected">
                                  <xsl:attribute name="selected">true</xsl:attribute>
                                </xsl:if>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:value-of select="@name"/>
                              </option>
                            </xsl:for-each>
                          </xsl:if>
                          <xsl:if test="@stype='shipstatelist'">
                            <xsl:for-each select="//page/qd/states[@shiplist='1' and @countryid=//page/qd/selectedcountries/@shipcountryid]">
                              <option>
                                <xsl:if test="@selected">
                                  <xsl:attribute name="selected">true</xsl:attribute>
                                </xsl:if>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:value-of select="@name"/>
                              </option>
                            </xsl:for-each>
                          </xsl:if>
                        </select>
                      </xsl:if>
                      <xsl:if test="@stype='countrylist' or @stype='shipcountrylist'">
                        <select>
                          <xsl:attribute name="id"><xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <xsl:attribute name="name"><xsl:value-of select="@idname"/>
                          </xsl:attribute>

                          <xsl:attribute name="onchange">
                            ncountryid=this.value;
                            sthisobj=document.getElementById("stateid");
                            <xsl:if test="@stype='shipcountrylist'">
                              sthisobj=document.getElementById("shipstateid");
                            </xsl:if>
                            getstates(sthisobj, ncountryid)
                          </xsl:attribute>
                          <option/>
                          <xsl:if test="@stype='countrylist'">
                            <xsl:for-each select="//page/qd/countries[@shiplist='0']">
                              <option>
                                <xsl:if test="@selected">
                                  <xsl:attribute name="selected">true</xsl:attribute>
                                </xsl:if>

                                <xsl:attribute name="value">
                                  <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:value-of select="@name"/>
                              </option>
                            </xsl:for-each>
                          </xsl:if>
                          <xsl:if test="@stype='shipcountrylist'">
                            <xsl:for-each select="//page/qd/countries[@shiplist='1']">
                              <option>
                                <xsl:if test="@selected">
                                  <xsl:attribute name="selected">true</xsl:attribute>
                                </xsl:if>

                                <xsl:attribute name="value">
                                  <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:value-of select="@name"/>
                              </option>
                            </xsl:for-each>
                          </xsl:if>
                        </select>
                      </xsl:if>
                      <xsl:if test="@stype='marketlist'">
                        <select>
                          <xsl:attribute name="id"><xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <xsl:attribute name="name">
                            <xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <xsl:attribute name="title">
                            <xsl:value-of select="//page/qd/screenlabels[@id='75']/@label"/> <!--title="For internal use. If neither option completely describes your business, just select Industrial"/>-->
                          </xsl:attribute>
                          <xsl:for-each select="//page/qd/marketcodes">
                            <option>
                              <xsl:if test="@selected">
                                <xsl:attribute name="selected">true</xsl:attribute>
                              </xsl:if>

                              <xsl:attribute name="value">
                                <xsl:value-of select="@code"/>
                              </xsl:attribute>
                              <xsl:value-of select="@name"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </xsl:if>
                      <xsl:if test="@stype='distlist'">
                        <select>
                          <xsl:attribute name="id"><xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <xsl:attribute name="name">
                            <xsl:value-of select="@idname"/>
                          </xsl:attribute>
                          <option/>
                          <xsl:for-each select="//page/qd/distlist">
                            <option>
                              <xsl:if test="@selected">
                                <xsl:attribute name="selected">true</xsl:attribute>
                              </xsl:if>

                              <xsl:attribute name="value">
                                <xsl:value-of select="@id"/>
                              </xsl:attribute>
                              <xsl:value-of select="@name"/>, <xsl:value-of select="@city"/>
                            </option>
                          </xsl:for-each>
                        </select>
                      </xsl:if>
                    </div>
                  </xsl:for-each>
                </div>
              </xsl:for-each>
            </div>                 
          </div>

          <div id="divpage2" class="container bg--white pad content--wrapper">
            <xsl:if test="//page/qd[action='0' or action='1' or action='3']">
              <script language="javascript">$("#divpage2").addClass("nodisplay")</script>
            </xsl:if>
            <div class="grid">
              <table class="tableregister">
                <xsl:if test="//page/qd/qdlitedist">
                  <tr>
                    <td>
                      <label><xsl:value-of select="//page/qd/screenlabels[@id='61']/@label"/></label>
                      <!--Registering Now-->
                    </td>
                    <td>
                      <b>
                        <xsl:value-of select="//page/qd/yourinfo/@yourname"/>
                      </b>
                      <br/>
                      <xsl:value-of select="//page/qd/yourinfo/@company"/>
                      <br/>
                      <xsl:value-of select="//page/qd/yourinfo/@addr1"/>
                      <br/>
                      <xsl:if test="//page/qd/yourinfo/@addr2">
                        <xsl:value-of select="//page/qd/yourinfo/@addr2"/>
                        <br/>
                      </xsl:if>
                      <xsl:value-of select="//page/qd/yourinfo/@city"/>
                      
                      <xsl:if test="//page/qd/yourinfo/@state">
                        <xsl:value-of select="//page/qd/yourinfo/@state"/>,
                      </xsl:if>
                      <xsl:value-of select="//page/qd/yourinfo/@country"/>
                      
                      <xsl:value-of select="//page/qd/yourinfo/@zip"/>
                      <xsl:if test="//page/qd/yourinfo/@shipaddr1">
                        <br/>
                        <i>
                          <xsl:value-of select="//page/qd/screenlabels[@id='73']/@label"/>
                          <!--Ship to:-->
                        </i>
                        <br/>
                        <xsl:value-of select="//page/qd/yourinfo/@shipaddr1"/>
                        <br/>
                        <xsl:if test="//page/qd/yourinfo/@shipaddr2">
                          <xsl:value-of select="//page/qd/yourinfo/@shipaddr2"/>
                          <br/>
                        </xsl:if>
                        <xsl:value-of select="//page/qd/yourinfo/@shipcity"/>
                        
                        <xsl:if test="//page/qd/yourinfo/@shipstate">
                          <xsl:value-of select="//page/qd/yourinfo/@shipstate"/>,
                        </xsl:if>
                        <xsl:value-of select="//page/qd/yourinfo/@shipcountry"/>
                        
                        <xsl:value-of select="//page/qd/yourinfo/@shipzip"/>
                      </xsl:if>
                    </td>
                  </tr>
                  <tr>
                    <td width="20%" nowrap="true">
                      <label><xsl:value-of select="//page/qd/screenlabels[@id='67']/@label"/></label>
                      <!--Your Sun Distributor-->
                    </td>
                    <td valign="top" >
                      <b>
                        <xsl:value-of select="//page/qd/qdlitedist/@name"/>
                      </b>
                      <br/>
                      <xsl:value-of select="//page/qd/qdlitedist/@addr1"/>
                      <br/>
                      <xsl:if test="//page/qd/qdlitedist/@addr2">
                        <xsl:value-of select="//page/qd/qdlitedist/@addr2"/>
                        <br/>
                      </xsl:if>
                      <xsl:value-of select="//page/qd/qdlitedist/@city"/>
                      
                      <xsl:if test="//page/qd/qdlitedist/@state">
                        <xsl:value-of select="//page/qd/qdlitedist/@state"/>,
                      </xsl:if>
                      <xsl:value-of select="//page/qd/qdlitedist/@country"/>
                      
                      <xsl:value-of select="//page/qd/qdlitedist/@zip"/>

                    </td>
                  </tr>
                </xsl:if>
              </table>
              <div class="row">
                <label for="qdpw1">
                  <xsl:attribute name="for">
                    <xsl:value-of select="@qdpw1"/>
                  </xsl:attribute>
                  <xsl:value-of select="//page/qd/screenlabels[@id='58']/@label"/>
                  <!--Password-->
                </label>
                <input type="password" id="qdpw1" name="qdpw1" maxlength="20">
                  <xsl:attribute name="title">
                    <xsl:value-of select="//page/qd/pwdmessage/@stext"/>
                  </xsl:attribute>
                  <xsl:attribute name="onfocus">
                    this.select();
                  </xsl:attribute>
                </input>
              </div>
              <div class="row">
                <label for="confirmqdpw">
                  <xsl:attribute name="for">
                    <xsl:value-of select="@confirmqdpw"/>
                  </xsl:attribute>
                  <xsl:value-of select="//page/qd/screenlabels[@id='53']/@label"/>
                  <!--Confirm Password-->
                </label>
                <input type="password" id="confirmqdpw" name="confirmqdpw" maxlength="20">
                  <xsl:attribute name="title">
                    <xsl:value-of select="//page/qd/pwdmessage/@stext"/>
                  </xsl:attribute>
                  <xsl:attribute name="onfocus">
                    this.select();
                  </xsl:attribute>
                </input>
              </div>
              <div class="row">
                <label>
                  <xsl:value-of select="//page/qd/screenlabels[@id='70']/@label"/>
                  <!--Terms and agreement-->
                </label>
                    <div class="registertandc">
										
											<xsl:for-each select="//page/qd/qdtermsandcond">
												<xsl:value-of select="@displaytext" disable-output-escaping="yes"/>
												<hr/>
											</xsl:for-each>
                      <!--
											<xsl:value-of select="//page/qd/qdliteagreement/@english" disable-output-escaping="yes"/>
											-->
                    </div>
                    <br/>
                    <input class="autowidth" type="checkbox" id="chkagree" name="chkagree">
                    </input>
                   <label class="nobreak">
                     <xsl:value-of select="//page/qd/screenlabels[@id='65']/@label"/>
										 <!--Yes, I fully agree with the terms and conditions listed above.-->
                   </label>
									<div>
										<br/>
                      <input class="autowidth" type="checkbox" id="chksendmail" name="chksendmail" checked="true">
                      </input>
											<label class="nobreak">
												<xsl:value-of select="//page/qd/screenlabels[@id='485']/@label"/>
												<!-- Yes, I'd like to receive email updates from Sun. -->
											</label>									
									</div>
                    

                   <div style="vertical-align:top;">
 											
											<!--
                      <div class="registeremailupdates">
                        <xsl:value-of select="//page/qd/sunemail/@stext"/>
                      </div>
											-->
                    </div>
              </div>

            </div>


          </div>            
          <div class="container small pad bg--light-grey">
              <div class="tx--center pad-top">                
                <xsl:if test="//page/qd[action='0' or action='1' or action='2']">
                        <xsl:if test="//page/qd/backaction">
                          <input class="button bg--orange smallbutton" type="button" id="cmdback"  name="cmdback" >
                            <xsl:attribute name="value">
                              <xsl:value-of select="//page/qd/screenlabels[@id='59']/@label"/>
                            </xsl:attribute>
                            <xsl:attribute name="onclick">
                              backbutton('<xsl:value-of select="//page/qd/backaction"/>');
                             </xsl:attribute>
                          </input>
                        </xsl:if>
                        <input class="button bg--orange smallbutton" type="button" id="cmdnext"  name="cmdnext">
                          <xsl:attribute name="value">
                            <xsl:value-of select="//page/qd/screenlabels[@id='57']/@label"/>
                          </xsl:attribute>
                          <xsl:attribute name="onclick">
                            validatetextboxes();
                            nnextaction='<xsl:value-of select="//page/qd/action"/>';
                            nstopnext='<xsl:value-of select="//page/qd/stopnext"/>';
                            sresolvemsg = '<xsl:value-of select="//page/qd/pleaseresolvemessage/@label"/>';
                            spwddontmatch = '<xsl:value-of select="//page/qd/pwddontmatchmessage/@label"/>';
                            spwdmessage='<xsl:value-of select="//page/qd/pwdmessage/@label"/>';
                            if (nstopnext == "1") {
                              alert(sresolvemsg)
                              return false;
                            }
                            if (nnextaction == "0" || nnextaction == "") { nnextaction = "1"; }
                              if (nnextaction == "2") {
                              spw1 = document.getElementById("qdpw1").value
                              if (checkstrong(spw1) == false) {
                                alert(spwdmessage);
                                return false
                              }
                              if (spw1 == document.getElementById("confirmqdpw").value) {
                               npw = document.getElementById("qdpw1").value
                              }
                              else {
                                alert(spwddontmatch);
                                return false;
                              }
                              if (document.getElementById("chkagree").checked == false) {
                                sthismess = '<xsl:value-of select="//page/qd/termsmessage/@label"/>';
                                alert(sthismess);
                                return false;
                              }
                              document.getElementById("qdpw1").value = ""
                              document.getElementById("confirmqdpw").value = ""
                              document.getElementById("qdpw").value = sha1Hash(spw1);
                              nnextaction = "3";
                              
                              <xsl:if test="//page/qd/usinggoogletags">
                                try{
                                    dataLayer.push({
                                    event: 'customEvent',
                                    context: 'quick-design-register-complete'
                                  });
                                  }
                                catch(err){
                                  alert("Problem with the Google Tag push. Please contact Sun.");
                                  return false;
                                }
                              </xsl:if>
                            }
                            document.getElementById("action").value = nnextaction;
                            submitit();
                          </xsl:attribute>
                        </input>
                </xsl:if>
                 
              </div>
             <!--  <a href="/privacy-policy.php" class="privacy">Privacy Policy</a>-->

          </div>

          <hr/>
          <xsl:if test="//page/qd[action='0' or action='1']">
            <xsl:value-of select="//page/qd/screenlabels[@id='66']/@label"/>
            <!--your company will be matched...-->
            <xsl:if
               test="//page/qd/distmatchname">
              , <xsl:value-of select="//page/qd/distmatchname/@name"/>
            </xsl:if>
            <xsl:if test="//page/qd[not (distmatchname)]">
              <a class="abutton" title="Distributor assignment">
                <xsl:attribute name="onclick">
                  $("#divshiptonote").show();
                </xsl:attribute>
                -- <xsl:value-of select="//page/qd/screenlabels[@id='63']/@label"/><!--See more-->
                <img src="images/redarrowdown.gif">
                </img>
              </a>
            </xsl:if>
            <div class="nodisplay" id="divshiptonote">
              <xsl:value-of select="//page/qd/screenlabels[@id='55']/@label"/>
              <!--
          In this process, your company will be matched with a Sun distributor in <br/>
					your area. If your ship-to address differs from your company's address, <br/>
					we will match you with the Sun distributor responsible for your ship-to area.
          -->
            </div>
            <br/>
          </xsl:if>

          <xsl:if test="//page/qd[action='3']">
            <table width="400px">
              <tr>
                <td align="left" valign="top" colspan="2">
                  <div>
                    <xsl:value-of select="//page/qd/screenlabels[@id='74']/@label"/>
                  </div>
                  <br/>
                  <input class="buttonnormal" type="button" id="cmdnext"  name="cmdnext" value="Close">
                    <xsl:attribute name="onclick">self.close()</xsl:attribute>

                  </input>
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="//page/errmess">
            <div class="errormessage">
              <xsl:value-of select="//page/errmess"/>
            </div>
          </xsl:if>
          <div id="screenmessage" class="nodisplay">
          </div>
          <br/>

          <div >
            <xsl:value-of select="//page/qd/contactstr/@sstr" disable-output-escaping="yes"/>
            <div style="font-size:85%;">
              <a href="mailto:SunQuickDesign@sunhydraulics.com">Sun US</a> --
              <a href="mailto:SunQuickDesign@sunuk.com">Sun UK</a> --
              <a href="mailto:SunQuickDesign@sunhydraulik.de">Sun GmbH</a>
            </div>
          </div>
          <script language="javascript">
            <xsl:comment>
              function uli(){
              document.forms[0].submit();
              }
              function getstates(sobj, ncountryid){
              sobj.options.length=0;
              sobj.options[0] = new Option('','');
              nint=1;
              <xsl:for-each select="//page/qd/states[@shiplist='0']">
                if(ncountryid=='<xsl:value-of select="@countryid"/>'){
                sobj.options[nint] = new Option('<xsl:value-of select="@name"/>','<xsl:value-of select="@id"/>');
                nint++
                }
              </xsl:for-each>
              }
            </xsl:comment>
          </script>

        </div>
      </div>
      <!-- page-wrapper -->


    </xsl:template>
</xsl:stylesheet>
