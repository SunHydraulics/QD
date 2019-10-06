<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <header class="site--header container">
      <div id="screenmessage" class="speechbubble nodisplay"/>
      <div class="logo-wrapper">
        <a href="default.aspx">
          <img src="images/QuickDesign-Logo.svg" alt="" class="logo"
               onerror="this.src=images/QuickDesign-Logo.png;this.onerror=null;"/>
        </a>
      </div>

      <div class="page-header pad">
        <h1 class="title">
          QuickDesign Order Form
        </h1>
      </div>
    </header>
    <div class="site--wrapper">
      <div class="container bg--white content--wrapper pad noborder">

      <xsl:if test="//page/qd/errormessage">
        <div id="errormessage">
          <xsl:value-of select="//page/qd/errormessage"/>
        </div>
      </xsl:if>
      <xsl:if test="//page/qd[not (errormessage)]">
        <input type="hidden" id="issubmitorder" name="issubmitorder" value="0"/>
        <input type="hidden" id="issubmitpromote" name="issubmitpromote" value="0"/>
        <input type="hidden" id="ispbxfile" name="ispbxfile">
          <xsl:attribute name="value">
            <xsl:value-of select="//page/qd/pbxfile"/>
          </xsl:attribute>
        </input>
        <div style="width:7.1in">
          <div>
            <xsl:value-of select="//page/qd/datenow/@datenow"/>
          </div>
          <!--Current-->

          <div>
            <b>Order This QuickDesign Version</b>
          </div>
          <div>
            P/N: <xsl:value-of select="//page/qd/partno"/>-QD<xsl:value-of select="//page/qd/rev"/>

            (<xsl:value-of select="//page/qd/partno"/>, Version <xsl:value-of select="//page/qd/rev"/>)
          </div>

          <script language="javascript">
            <xsl:comment>
              function showorderform(){
              document.getElementById("divorderform").style.display="none";
              document.getElementById("divordercancel").style.display="";
              if (document.getElementById("chkanalysis").checked &amp;&amp;
              document.getElementById("chkverifylocation").checked){
              document.getElementById("divorderform").style.display="";
              document.getElementById("divordercancel").style.display="none";
              }
              }
            </xsl:comment>
          </script>

          <!-->Analysis report present</!-->
          <div class="pbxcomment">
            <xsl:if test="//page/qd[not (analysisreports)]">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            This version of the design has one or more analysis reports that may
            contain information relevant to manufacturing. Please review before ordering:<br/>
            <xsl:for-each select="//page/qd/analysisreports">
              <a class="abuttonul" style="padding-left:15px;">
                <xsl:attribute name="href">
                  <xsl:value-of select="@thisurl"/>
                </xsl:attribute>
                <xsl:value-of select="@display"/>
              </a>

              <br/>
            </xsl:for-each>
            <br/>
            <input id="chkanalysis" type="checkbox">
              <xsl:if test="//page/qd[not (analysisreports)]">
                <xsl:attribute name="checked">true</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onclick">javascript:showorderform();</xsl:attribute>
            </input> <span style="font-size:85%;">Check here to indicate that you have reviewed the report(s).</span>
          </div>
          <!-->Not a distributor</!-->
          <div class="pbxcomment">
            <xsl:if test="//page/qd[not (verifylocation)]">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            The company associated with this design is not a distributor or Sun company:<br/>
            <xsl:for-each select="//page/qd/verifylocation">
              <xsl:value-of select="@name"/>
              <br/>
              <i>
                (<xsl:value-of select="@locationtype"/>)
              </i>
              <br/>
            </xsl:for-each>
            <br/>
            <input id="chkverifylocation" type="checkbox">
              <xsl:if test="//page/qd[not (verifylocation)]">
                <xsl:attribute name="checked">true</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onclick">javascript:showorderform();</xsl:attribute>
            </input> <span style="font-size:85%;">Check here to acknowledge.</span>
          </div>

          <div id="divordercancel">
            <xsl:if test="//page/qd[not(analysisreports) and not(verifylocation)]">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            <input type="button" class="buttonnormal" value="Cancel">
              <xsl:attribute name="onclick">
                var nwin = window.open('<xsl:value-of select="//page/qd/nav/@href"/>',
                '_self', '')
                nwin.focus();
              </xsl:attribute>
            </input>
          </div>
          <!--> the order form</!-->
          <div id="divorderform">
            <xsl:if test="//page/qd[analysisreports or verifylocation]">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>

            <div id="divpbxcomment" class="pbxcomment">
              <xsl:value-of select="//page/qd/pagemessage"/>
              <div style="font-size:x-small;display:none;">
                Note: Standard body stamping
                will be used on this design unless
                <a class="abuttonul">
                  <xsl:attribute name="href">
                    <xsl:value-of select="//page/qd/bodystamp/@href"/>
                  </xsl:attribute>
                  custom stamping
                </a> is configured.
              </div>
            </div>

            <div>
              <table>
                <tr>
                  <td>Order Qty*</td>
                  <td >
                    <xsl:if test="//page/qd/mayorder">
                      <input id="qty" name="qty" maxlength="5">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@orderqty"/>
                        </xsl:attribute>
                      </input>
                    </xsl:if>
                    <xsl:if test="//page/qd[not (mayorder)]">
                      <xsl:value-of select="//page/qd/quoteinfo/@orderqty"/>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td>Requested Delivery*</td>
                  <td >
                    <xsl:if test="//page/qd/mayorder">
											<!--
                      <select id="reqweeks" name="reqweeks">
                        <xsl:attribute name="onchange">
                          var n=this.value
                          <xsl:for-each select="//page/qd/nweeks">
                            if(n=='<xsl:value-of select="@num"/>'){
                            document.getElementById("deldate").innerText='weeks from today ('+'<xsl:value-of select="@deldate"/>'+')';
														document.getElementById("datepicker").value='<xsl:value-of select="@deldate"/>'
													}
												</xsl:for-each>
                        </xsl:attribute>
                        <xsl:for-each select="//page/qd/nweeks">
                          <option>
                            <xsl:if test="@selected">
                              <xsl:attribute name="selected">
                                true
                              </xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="value">
                              <xsl:value-of select="@num"/>
                            </xsl:attribute>
                            <xsl:value-of select="@num"/>
                          </option>
                        </xsl:for-each>
                      </select>

                      <span id="deldate">
                        weeks from today (<xsl:value-of select="//page/qd/nweeks[@selected='1']/@deldate"/>)
                      </span>
											-->
												<input type="text" id="datepicker" name="data_deldate">
													<xsl:attribute name="value"><xsl:value-of select="//page/qd/nweeks[@selected='1']/@deldate"/></xsl:attribute>
												</input>

                    </xsl:if>

                    <xsl:if test="//page/qd[not (mayorder)]">
                      <xsl:value-of select="//page/qd/quoteinfo/@reqshipdate"/>
                    </xsl:if>
										 <xsl:if test="//page/qd/flex">
											 <br/>
											 <br/>
											 <!--
											 <div class="homepagemessage">
                      <xsl:value-of select="//page/qd/flex"/>
											 </div>
											 -->
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td>PO Number</td>
                  <td >
                    <xsl:if test="//page/qd/mayorder">
                      <input id="ponumber" name="ponumber" style="width:160px;" maxlength="30">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@ponumber"/>
                        </xsl:attribute>
                      </input>
                    </xsl:if>
                    <xsl:if test="//page/qd[not (mayorder)]">
                      <xsl:value-of select="//page/qd/quoteinfo/@ponumber"/>
                    </xsl:if>
                  </td>
                </tr>
                <tr>
                  <td>Make in*</td>
                  <td >
                    <xsl:if test="//page/qd/mayorder">
                      <select id="makein" name="makein">
                        <xsl:for-each select="//page/qd/makein">
                          <option>
                            <xsl:if test="@selected">
                              <xsl:attribute name="selected">
                                true
                              </xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="value"><xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:value-of select="@name"/>
                          </option>
                        </xsl:for-each>
                      </select>
                    </xsl:if>
                    <xsl:if test="//page/qd[not (mayorder)]">
                      <xsl:value-of select="//page/qd/makein[@selected='1']/@name"/>
                    </xsl:if>

                  </td>
                </tr>
								<tr>
									<td>Create ZBody?</td>
									<td >
										<xsl:if test="//page/qd/mayorder">
											<select id="iszbody" name="iszbody" style="width:100px;">
												<option value="0">No</option>
												<option value="1">Yes</option>
											</select>
										</xsl:if>
										<xsl:if test="//page/qd[not (mayorder)]">
											No
										</xsl:if>

									</td>
								</tr>
              </table>
              <hr/>
              <input type="button" class="button bg--darker-grey smallbutton">
                <xsl:attribute name="value">
                  <xsl:value-of select="//page/qd/nav/@title"/>
                </xsl:attribute>
                <xsl:attribute name="onclick">
                  <xsl:if test="//page/qd/nav/@rollbackoncancel">
                    if(confirm('This will roll back the order information. Continue?')==false){
                    return 0;
                    }
                  </xsl:if>
                  var nwin = window.open('<xsl:value-of select="//page/qd/nav/@href"/>',
                  '_self', '')
                  nwin.focus();
                </xsl:attribute>
              </input>

              <xsl:if test="//page/qd/mayorder">
                <input type="button" class="button bg--darker-grey smallbutton" value="Next">
                  <xsl:attribute name="onclick">

										// if(document.getElementById("qty").value=="" || document.getElementById("reqweeks").value==""){
										// alert("Enter an order qty and requested delivery time");
										// return 0;
										// }

										if(document.getElementById("datepicker").value==""){
										alert("Enter a requested delivery time");
										return 0;
										}

										if(isNaN(document.getElementById("qty").value)==true){
										alert("Enter a numeric order qty");
										return 0;
										}
										if(document.getElementById("qty").value*1 &lt; 1){
										alert("Wouldn't you like at least one?");
										return 0;
										}

										//if(isNaN(document.getElementById("reqweeks").value)==true){
										//alert("Enter the requested delivery time in number of weeks from today");
										//return 0;

										//}

										//var d2weeks= new Date('<xsl:value-of select="//page/qd/nweeks[@selected=1]/@deldate"/>');
										//var dtoday=new Date();
										//var seldate= new Date($('#datepicker').val());
										//if (seldate &lt; dtoday) {
										//alert("Enter a valid delivery date");
										//return 0;
										//}

										if(confirm("Have you confirmed that the requested version, the order qty and the delivery time are correct?  Pressing OK will send this version to Production and no futher design updates will be possible. Press OK to continue or Cancel to edit the information.")==false){
										return 0;
										}
										document.getElementById("divpleasewait").style.display="block";

										document.getElementById("issubmitorder").value="1";
										document.forms[0].submit();
									</xsl:attribute>
                </input>
              </xsl:if>
              <xsl:if test="//page/qd/maypromote">
                <input type="button" class="buttonnormal" value="Next">
                  <xsl:attribute name="onclick">
                    document.getElementById("divpleasewait").style.display="block";

                    document.getElementById("issubmitpromote").value="1";
                    document.forms[0].submit();
                  </xsl:attribute>
                </input>
              </xsl:if>


              <div id="divpleasewait" class="errormessage" style="display:none">
                Please wait...<img src="images/spinning.gif"/>
              </div>

            </div>
          </div>
        </div>

      </xsl:if>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
