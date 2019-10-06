<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    <input type="hidden" id="data_action" name="data_action"/>
    <div class="container bg--white pad content--wrapper">
      <xsl:if test="//page/qd[not (errormessage)]">
        <div>
          <section class="bg--light-grey pad block bottom-space grid lightborder">
            <h3 class="block-title">
              <xsl:value-of select="//page/qd/screenlabels[@id=613]/@label"/>,
              <!--Project Summary--> <xsl:value-of select="//page/qd/datenow/@datenow"/>
              <span style="padding-left:50px;">
                <img src="images/print.gif" style="cursor:pointer" title="Format this page for printing">
                  <xsl:attribute name="onclick">
                    $('.site--nav').toggle();
                    $('.languages').toggle();
                    $('.qdsummary').toggle();
                    $('#adminsection').toggle();
                    $(this).hide();
                    alert("Send to print, then refresh the page.")
                    window.print();
                  </xsl:attribute>
                </img>
              </span>
            </h3>


            <div>
              <table class="tablesummary">
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@distributorlabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@distributor"/>
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@salespersonlabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@salesperson"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@distrefnolabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@distrefno"/>
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=159]/@label"/>:
                    <!--Market-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@market"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@customerlabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@customer"/>

                  </td>
                  <xsl:if test="//page/qd[not (isqdlite)]">
                    <td>
                      <xsl:value-of select="//page/qd/screenlabels[@id=158]/@label"/>:
                      <!--Est Annual Usage-->
                    </td>
                    <td>
                      <xsl:value-of select="//page/qd/qsummary/@estannualusage"/>

                    </td>
                  </xsl:if>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=160]/@label"/>:
                    <!--Material-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@material"/>



                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=151]/@label"/>:
                    <!--Design Restrictions-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@designrestrict"/>
                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@partnolabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@partno"/>

                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=166]/@label"/>:
                    <!--Total Connections-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@connections"/>


                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=614]/@label"/>:
                    <!--QuickDesign P/N-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@qdpartno"/>

                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@custpartnolabel"/>:
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@custpartno"/>

                  </td>
                </tr>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/qsummary/@distcommentslabel"/>:
                  </td>
                  <td colspan="3" >
                    <xsl:value-of select="//page/qd/qsummary/@distcomments"/>
                  </td>
                </tr>
                <xsl:if test="//page/qd[not (isqdlite)]">
                  <tr>
                    <td>
                      <xsl:value-of select="//page/qd/screenlabels[@id=164]/@label"/>:
                      <!--Sun Comments-->
                    </td>
                    <td colspan="3">
                      <xsl:value-of select="//page/qd/qsummary/@suncomments"/>
                    </td>
                  </tr>
                </xsl:if>
              </table>
            </div>
          </section>
          <section class="bg--light-grey pad block bottom-space grid lightborder">
            <h3 class="block-title">
            <xsl:value-of select="//page/qd/screenlabels[@id=200]/@label"/>
            <!--Configuration-->
          </h3>
          <xsl:if test="//page/qd/usermessages">
            <span class="grayitalic">
              <xsl:value-of select="//page/qd/usermessages/@smessage"/>
            </span>
          </xsl:if>
            <xsl:if test="//page/qd[not (hideconfig)]">
              <table class="tableitemsummary">
                <thead>
                  <tr>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id=615]/@label"/>
                      <!--Description-->
                    </th>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id=222]/@label"/>
                      <!--Item-->
                    </th>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id=616]/@label"/>
                      <!--Cavity-->
                    </th>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id=617]/@label"/>
                      <!--Qty-->
                    </th>
                  </tr>
                </thead>
                <xsl:for-each select="//page/qd/items">
                  <tr>
                    <td>
                      <xsl:if test="@ispilotfor">
                        (<xsl:value-of select="//page/qd/screenlabels[@id=618]/@label"/>)
                        <!--Pilot-->
                      </xsl:if>
                      <xsl:value-of select="@feature"/>
                    </td>
                    <td>
                      <xsl:value-of select="@display"/>
                    </td>
                    <td>
                      <xsl:value-of select="@cavity"/>
                    </td>
                    <td>
                      <xsl:value-of select="@qty"/>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <td>
                    <xsl:value-of select="//page/qd/screenlabels[@id=473]/@label"/>
                    <!--Manifold Material-->
                  </td>
                  <td>
                    <xsl:value-of select="//page/qd/material/@name"/>
                  </td>
                  <td>

                  </td>
                  <td>
                    1
                  </td>
                </tr>
                <xsl:if test="//page/qd/material/@coating">
                  <tr>
                    <td>
                      <xsl:value-of select="//page/qd/screenlabels[@id=602]/@label"/>
                      <!--Manifold Coating-->
                    </td>
                    <td>
                      <xsl:value-of select="//page/qd/material/@coating"/>
                      <xsl:if test="//page/qd/material/@note">
                        <div>

                          <xsl:value-of select="//page/qd/material/@note"/>
                        </div>
                        <div>
                          <xsl:value-of select="//page/qd/material/@coatingshipnote"/>
                        </div>
                      </xsl:if>
                    </td>
                    <td>

                    </td>
                    <td>

                    </td>
                  </tr>
                </xsl:if>
              </table>
            </xsl:if>  
          </section>
          <xsl:if test="//page/qd[adminlevel='1']">
            <section id="adminsection" class="bg--light-grey pad block bottom-space grid lightborder">
              <a class="helpanchor" id="sundataanchor"/>
              <div>
                <div class="divmore floatright">
                  <a id="ashowadmin" href="#">
                  <xsl:attribute name="onclick">
                    $("#sunsummary").show();
                    $("#ashowadmin").hide();
                    return false;
                  </xsl:attribute>
                  Show
                </a>
                </div>
                <h3 class="block-title">
                  Sun Admin
                </h3>


              </div>
              <div id="sunsummary" class="nodisplay">
								<div class="col-1-2">
                <table class="tableitemsummary">
                  <tr>
                    <td>
                      Fixed Manifold Price ($)
                    </td>
                    <td>
                      <input id="data_manifoldfixedprice" name="data_manifoldfixedprice" maxlength="10" >
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@manifoldfixedprice"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      Fixed Coating Price ($)
                    </td>
                    <td>
                      <input id="data_coatingfixedprice" name="data_coatingfixedprice" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@coatingfixedprice"/>
                        </xsl:attribute>
                        <xsl:if test="//page/qd[not (material/@coating)]">
                          <xsl:attribute name="disabled">true</xsl:attribute>
                        </xsl:if>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Design Complexity
                    </td>
                    <td>
                      <select id="data_designrestrictid" name="data_designrestrictid">
                        <xsl:for-each select="//page/qd/designrestrict">
                          <option>
                            <xsl:attribute name="value">
                              <xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:if test="current()[@id = //page/qd/quoteinfo/@designrestrictid]">
                              <xsl:attribute name="selected">true</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="@name"/>
                          </option>
                        </xsl:for-each>
                      </select> (under review)
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Sun Designer
                    </td>
                    <td>
                      <select id="data_sundesignerid" name="data_sundesignerid">
                        <option/>
                        <xsl:for-each select="//page/qd/sundesigners">
                          <option>
                            <xsl:attribute name="value">
                              <xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:if test="current()[@id = //page/qd/quoteinfo/@sundesignerid]">
                              <xsl:attribute name="selected">true</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="@name"/>
                          </option>
                        </xsl:for-each>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Order Qty
                    </td>
                    <td>
                      <input id="data_orderqty" name="data_orderqty" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@orderqty"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Order Price ($)
                    </td>
                    <td>
                      <input id="data_orderprice" name="data_orderprice" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@orderprice"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>

                  <tr>
                    <td>
                      Order Date
                    </td>
                    <td>
                      <input id="data_orderdate" name="data_orderdate" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@orderdate"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td nowrap="true">
                      Requested Ship Date
                    </td>
                    <td>
                      <input id="data_reqshipdate" name="data_reqshipdate" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@reqshipdate"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Actual Ship Date
                    </td>
                    <td>
                      <input id="data_actshipdate" name="data_actshipdate" maxlength="10">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@actshipdate"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      PO Number
                    </td>
                    <td>
                      <input id="data_ponumber" name="data_ponumber" maxwidth="30">
                        <xsl:attribute name="value">
                          <xsl:value-of select="//page/qd/quoteinfo/@ponumber"/>
                        </xsl:attribute>
                      </input>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      Status
                    </td>
                    <td>
                      <div id="divindesigncell">
                        <xsl:value-of select="//page/qd/qsummary/@status"/>
                      </div>
                      <xsl:if test="//page/qd/mayputindesign">

                        <div id="divindesignquestion" class="connectcavity" style="width:200px;">
                          Change status to
                          <a class="abuttonul">
                            <xsl:attribute name="onclick">
                              if(confirm("Doing this will move the design to Rev. A. It will cause this design to be unavailable to distributors. Any subsequent status changes will then be made on the PDD config page. Continue?")==false){
                              return 0;
                              }
                              document.getElementById("divindesignquestion").style.display="none";
                              document.getElementById("divindesigncell").innerHTML="In Design";
                              putindesign();
                            </xsl:attribute>
                            In Design
                          </a>
                        </div>
                      </xsl:if>
                    </td>
                  </tr>

                  <tr>
                    <td colspan="2">
                      Comments<br/>
                      <textarea id="data_suncomments"
                        name="data_suncomments">
                        <xsl:value-of select="//page/qd/quoteinfo/@suncomments"/>
                      </textarea>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      Internal Notes<br/>
                      <textarea id="data_internalnotes"
                        name="data_internalnotes">
                        <xsl:value-of select="//page/qd/quoteinfo/@internalnotes"/>
                      </textarea>
                    </td>
                  </tr>
                </table>
                  <div class="pad">
                    <a class="tx--orange" target="config" href="#">
                      <xsl:attribute name="value">
                        <xsl:value-of select="//page/qd/quoteid"/>
                      </xsl:attribute>
                      <xsl:attribute name="onclick">
                        loadXMLDoc("showweights", this);
                        $('#divweightheader').toggle("slow");

                        $('#divweights').toggle("slow");
                        $('#divestweights').toggle("slow");

                        return false;
                      </xsl:attribute>
                      <xsl:value-of select="//page/qd/screenlabels[@id='243']/@label"/>
                      <!--See Weights-->
                    </a>
                    <div id="divweightheader" class="nodisplay">Actual Weights (last known config)</div>
                    <div id="divweights" class="nodisplay"></div>
                    <br/>
                    <div id="divestweights" class="nodisplay">
                      Estimated Weight (based on QQ formula) = <xsl:value-of select="//page/qd/estweight/@estweight"/> lb.
                    </div>
                  </div>
									</div>
								<div class="col-2-2 bottom-space-double">
										<table class="tableitemsummary divmetrics">
											<tr>
												<td colspan="2" class="grayitalic">
													Price Metrics
												</td>
											</tr>
										<tr>
											<td>
												Special pricing offered on 
												<xsl:if test="//page/qd[not (qdpricemetrics/@offerdate)]">
													<a href="#">
													<xsl:attribute name="onclick">
														$('#data_offerdate').val('<xsl:value-of select="//page/qd/thisdate/@thisdate"/>');
														$(this).hide();
														return false;
													</xsl:attribute>
													(today)
													</a>

												</xsl:if>
												
											</td>
											<td>
												<input id="data_offerdate" name="data_offerdate" maxlength="10">
													<xsl:attribute name="value">
														<xsl:value-of select="//page/qd/qdpricemetrics/@offerdate"/>
													</xsl:attribute>
												</input>
											</td>
										</tr>

										<tr>
											<td>
												Followed up on
												<xsl:if test="//page/qd[not (qdpricemetrics/@followdate)]">
													<a href="#">
														<xsl:attribute name="onclick">
															$('#data_followdate').val('<xsl:value-of select="//page/qd/thisdate/@thisdate"/>');
															$(this).hide();
															return false;
														</xsl:attribute>
														(today)
													</a>

												</xsl:if>
											</td>
											<td>
												<input id="data_followdate" name="data_followdate" maxlength="10">
													<xsl:attribute name="value">
														<xsl:value-of select="//page/qd/qdpricemetrics/@followdate"/>
													</xsl:attribute>
												</input>
											</td>
										</tr>
                      <tr>
                        <td>
                          Status
                        </td>
                        <td>
                          <select id="data_pricemetricsstatusid" name="data_pricemetricsstatusid">
                            <option/>
                            <xsl:for-each select="//page/qd/pricemetricsstatus">
                              <option>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="@id"/>
                                </xsl:attribute>
                                <xsl:if test="current()[@id = //page/qd/qdpricemetrics/@statusid]">
                                  <xsl:attribute name="selected">true</xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="@name"/>
                              </option>
                            </xsl:for-each>
                          </select>
                        </td>
                      </tr>
										<tr>
											<td colspan="2">
												Comments<br/>
												<textarea id="data_pricecomments"
													name="data_pricecomments">
													<xsl:value-of select="//page/qd/qdpricemetrics/@comments"/>
												</textarea>
											</td>
										</tr>

									</table>

								</div>

								<div class="pad">
								<a class="button bg--blue" href="#">
									<xsl:attribute name="onclick">
										document.getElementById("data_action").value="savesundata";
										submititanchor("sundataanchor");
									</xsl:attribute>
									Save Admin Data
								</a>
								</div>


                <!--  <a class="abuttonul">
                  <xsl:if test="//page/qd[maynotseepricing]">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:attribute name="onclick">
                    squoteid = '<xsl:value-of select="//page/qd/quoteid"/>';
						        sunit=document.getElementById("lstunits").value;
						        seffectdate=document.getElementById("lsteffectdate").value;
						        sxml="quoteid:"+squoteid+";unitid:"+sunit+";effectdate:"+seffectdate+";"; 
                    surl="sundetail.aspx?request=getsundetail&amp;parm1=quoteid:"+squoteid+";unitid:"+sunit+";effectdate:"+seffectdate+";";
						        var nwin = window.open(surl,
                        'sundetail' , 'menubar=1,toolbar=1,scrollbars=1,height=700,width=800,left=30,top=30,resizable=yes')
                    nwin.focus();
                  </xsl:attribute> Show Pricing Detail 

                </a>
               <a id="alinkprintemailvalpack" title="View the pricing report with valvepak pricing only."
                    target="printemail">
                  <xsl:attribute name="onclick">seeprintemail('1');</xsl:attribute>
                  Valvepak List Pricing Report<img src="images/redarrowright.gif"/>
                </a>
                -->

                <div id="divsundetail" style="background:#ffffff;">
                </div>

                
              </div>
                <a class="tx--orange" href="#">
                  <xsl:if test="//page/qd[maynotseepricing]">
                    <xsl:attribute name="style">display:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:attribute name="onclick">
                    squoteid = '<xsl:value-of select="//page/qd/quoteid"/>';
                    sunit=document.getElementById("data_unitid").value;
                    surl="report.aspx?page=sundetail&amp;quoteid="+squoteid+"&amp;unitid="+sunit;
                    var nwin = window.open(surl,
                    'sundetail' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                    nwin.focus();
                    return false;
                  </xsl:attribute> Show Pricing Detail

                </a>							
							
            </section>
          </xsl:if>
          
          <xsl:if test="//page/qd[not (hideconfig)]">
            <hr style="page-break-after:always;border:none;"/>
            <section class="bg--light-grey pad block bottom-space grid lightborder">
              <xsl:if test="//page/qd/sunfirstrun">
                <h3 class="block-title"><a class="helpanchor" id="currencyanchor"/>
                  <xsl:value-of select="//page/qd/screenlabels[@id=619]/@label"/>
                  <!--Pricing--> (<xsl:value-of select="//page/qd/units[@selected='1']/@name"/>,
                  <xsl:value-of select="//page/qd/today"/>)
                  <sup>
                    (<xsl:value-of select="//page/qd/screenlabels[@id=620]/@label"/>)
                    <!--see notes and conditions-->
                  </sup>
                </h3>
                <div>

                  <span>

                    <xsl:value-of select="//page/qd/screenlabels[@id=642]/@label"/>
                    <!--Currency-->
                  </span>

                  <select id="data_unitid" name="data_unitid" class="currencyselect">
                    <xsl:attribute name="onchange">
                      saction='default.aspx?page=summary&amp;quoteid=<xsl:value-of select="//page/qd/quoteid"/>#currencyanchor';

                      submitit(saction);
                    </xsl:attribute>
                    <xsl:for-each select="//page/qd/units">
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
                  </select>
                </div>
                 <div class="qdpnordernote">
                  <xsl:value-of select="//page/qd/qdpnordernote/@qdpnordernote" disable-output-escaping="yes"/>
                </div>
               
                <!-- First Run-->
                <summaryheader>
                  <xsl:value-of select="//page/qd/screenlabels[@id=621]/@label"/>
                  <!--First Run Pricing-->
                </summaryheader>
                <table class="tablepricing">
                  <tr>
                    <!--Sun first run!-->
                    <td>
                      <div>
                        <span>
                          <xsl:value-of select="//page/qd/screenlabels[@id=622]/@label"/>
                          <!--Designed by Sun Engineering-->
                        </span>
                        <br/>
                        <span>
                          P/N:
                          <xsl:value-of select="//page/qd/qsummary/@sunpartno"/><br/>
                          <xsl:value-of select="//page/qd/screenlabels[@id=623]/@label"/>
                          <!--First Run Net Pricing-->
                        </span>
                      </div>
                      <table>
                        <xsl:if test="//page/qd[not (maynotseeqqpricing)]">
                          <tr>
                            <thead>
                              <th>
                                <xsl:value-of select="//page/qd/screenlabels[@id=617]/@label"/>
                                <!--Qty-->
                              </th>
                              <th>
                                <xsl:value-of select="//page/qd/today"/>
                                <xsl:if test="//page/qd[not(futuredate)]">

                                </xsl:if>

                              </th>
                              <xsl:if test="//page/qd/futuredate">
                                <th>
                                  <xsl:value-of select="//page/qd/futuredate"/>
                                </th>
                              </xsl:if>
                            </thead>
                          </tr>
                          <xsl:for-each select="//page/qd/sunfirstrun">
                            <tr>
                              <td>
                                <xsl:value-of select="@low"/>
                              </td>
                              <td>
                                <xsl:value-of select="@price"/>

                              </td>
                              <xsl:if test="@futureprice">
                                <td>
                                  <xsl:value-of select="@futureprice"/>
                                </td>

                              </xsl:if>

                            </tr>
                          </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//page/qd/maynotseeqqpricing">
                          <tr>
                            <td  colspan="3">
                              <b>
                                <xsl:value-of select="//page/qd/screenlabels[@id=624]/@label"/>
                                <!--Sun Engineering pricing does not apply to this design-->
                              </b>
                            </td>
                          </tr>

                        </xsl:if>
                      </table>
                    </td>
                    <!--QD First Run!-->
                    <xsl:if test="//page/qd/qdproduction">
                      <td/>
                      <td>
                        <div>
                          <span>
                            <xsl:value-of select="//page/qd/screenlabels[@id=625]/@label"/>
                            <!--Designed by QuickDesign-->
                          </span>
                          <br/>
                          <span>
                            P/N:
                            <xsl:value-of select="//page/qd/qsummary/@qdpartno"/><br/>
                            <xsl:value-of select="//page/qd/screenlabels[@id=623]/@label"/>
                            <!--First Run Net Pricing-->
                          </span>
                        </div>
                        <table>
                          <xsl:if test="//page/qd/showqdfirstrunissameas">
                            <tr>
                              <td colspan="3">
                                <div class="firstrunsameas">
                                  <b>
                                    <xsl:value-of select="//page/qd/screenlabels[@id=626]/@label"/>
                                    <!--First run pricing does not apply to QuickDesign manifolds-->
                                  </b>  (<xsl:value-of select="//page/qd/screenlabels[@id=627]/@label"/>)
                                  <!--see Production pricing below-->
                                </div>
                              </td>
                            </tr>
                          </xsl:if>

                          <xsl:if test="//page/qd/qdfirstrun">
                            <tr>
                              <thead>
                                <th>
                                  <xsl:value-of select="//page/qd/screenlabels[@id=617]/@label"/>
                                  <!--Qty-->
                                </th>
                                <th>
                                  <xsl:value-of select="//page/qd/today"/>
                                </th>
                                <xsl:if test="//page/qd/futuredate">
                                  <th>
                                    <xsl:value-of select="//page/qd/futuredate"/>
                                  </th>
                                </xsl:if>
                              </thead>
                            </tr>
                            <xsl:for-each select="//page/qd/qdfirstrun">
                              <tr>
                                <td>
                                  <xsl:value-of select="@low"/>
                                </td>
                                <td>
                                  <xsl:value-of select="@price"/>

                                </td>
                                <xsl:if test="@futureprice">
                                  <td>
                                    <xsl:value-of select="@futureprice"/>
                                  </td>

                                </xsl:if>
                              </tr>
                            </xsl:for-each>
                          </xsl:if>
                        </table>
                      </td>
                    </xsl:if>
                    <xsl:if test="//page/qd[show5footnote 
                        and not (qdproduction)
                        and qsummary[@statusid='4950']
                        ]">
                      <td/>
                      <td>
                        <xsl:value-of select="//page/qd/screenlabels[@id=628]/@label"/>
                        <!--QuickDesign pricing is not available.-->
                        <br/>
                        <xsl:value-of select="//page/qd/screenlabels[@id=629]/@label"/>
                        <!--See the notes for additional information.-->
                      </td>
                    </xsl:if>

                  </tr>
                </table>

                <summaryheader>
                  <xsl:value-of select="//page/qd/screenlabels[@id=630]/@label"/>
                  <!--Production Pricing-->
                </summaryheader>
                <table class="tablepricing">
                  <tr>
                    <!--Sun production!-->
                    <td>
                      <div>
                        <span>
                          <xsl:value-of select="//page/qd/screenlabels[@id=622]/@label"/>
                          <!--Designed by Sun Engineering-->
                        </span>
                        <br/>
                        <span>
                          P/N:
                          <xsl:value-of select="//page/qd/qsummary/@sunpartno"/><br/>
                          <xsl:value-of select="//page/qd/screenlabels[@id=631]/@label"/>
                          <!--Production Net Pricing-->
                        </span>
                      </div>
                      <table>
                        <xsl:if test="//page/qd[not (maynotseeqqpricing)]">
                          <tr>
                            <thead>
                              <th>
                                <xsl:value-of select="//page/qd/screenlabels[@id=617]/@label"/>
                                <!--Qty-->
                              </th>
                              <th>
                                <xsl:value-of select="//page/qd/today"/>
                              </th>
                              <xsl:if test="//page/qd/futuredate">
                                <th>
                                  <xsl:value-of select="//page/qd/futuredate"/>
                                </th>
                              </xsl:if>
                            </thead>
                          </tr>
                          <xsl:for-each select="//page/qd/sunproduction">
                            <tr>
                              <td>
                                <xsl:value-of select="@low"/>
                              </td>
                              <td>
                                <xsl:value-of select="@price"/>

                              </td>
                              <xsl:if test="@futureprice">
                                <td>
                                  <xsl:value-of select="@futureprice"/>
                                </td>

                              </xsl:if>
                            </tr>
                          </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="//page/qd/maynotseeqqpricing">
                          <tr>
                            <td  colspan="3">
                              <b>
                                <xsl:value-of select="//page/qd/screenlabels[@id=624]/@label"/>
                                <!--Sun Engineering pricing does not apply to this design-->
                              </b>
                            </td>
                          </tr>
                        </xsl:if>
                      </table>
                    </td>
                    <!--QD production!-->
                    <xsl:if test="//page/qd/qdproduction">
                      <td/>
                      <td>
                        <div>
                          <span>
                            <xsl:value-of select="//page/qd/screenlabels[@id=625]/@label"/>
                            <!--Designed by QuickDesign-->
                          </span>
                          <br/>
                          <span>
                            P/N:
                            <xsl:value-of select="//page/qd/qsummary/@qdpartno"/><br/>
                            <xsl:value-of select="//page/qd/screenlabels[@id=631]/@label"/>
                            <!--Production Net Pricing-->
                          </span>
                        </div>
                        <table>
                          <tr>
                            <thead>
                              <th>
                                <xsl:value-of select="//page/qd/screenlabels[@id=617]/@label"/>
                                <!--Qty-->
                              </th>
                              <th>
                                <xsl:value-of select="//page/qd/today"/>
                              </th>
                              <xsl:if test="//page/qd/futuredate">
                                <th>
                                  <xsl:value-of select="//page/qd/futuredate"/>
                                </th>
                              </xsl:if>

                            </thead>
                          </tr>
                          <xsl:for-each select="//page/qd/qdproduction">
                            <tr>
                              <td>
                                <xsl:value-of select="@low"/>
                              </td>
                              <td>
                                <xsl:value-of select="@price"/>

                              </td>
                              <xsl:if test="@futureprice">
                                <td>
                                  <xsl:value-of select="@futureprice"/>
                                </td>

                              </xsl:if>
                            </tr>
                          </xsl:for-each>
                        </table>
                      </td>
                    </xsl:if>
                  </tr>
                </table>
              </xsl:if>
              <xsl:if test="//page/qd/qdlistprice">

                <summaryheader>
                  <xsl:value-of select="//page/qd/screenlabels[@id=632]/@label"/>
                  <!--QuickDesign Production List Price-->
                </summaryheader>

                <table class="tablepricing">
                  <tr>
                    <!--QuickDesign List Price!-->
                    <td>
                      <div>
                        <span>
                          <xsl:value-of select="//page/qd/screenlabels[@id=625]/@label"/>
                          <!--Designed by QuickDesign-->
                        </span>
                        <br/>
                        <span>
                          P/N:
                          <xsl:value-of select="//page/qd/qsummary/@qdpartno"/><br/>
                          <xsl:value-of select="//page/qd/screenlabels[@id=633]/@label"/>
                          <!--Production List Price-->
                        </span>
                      </div>
                      <table>
                        <tr>
                          <thead>
                            <th>
                              <xsl:value-of select="//page/qd/today"/>

                            </th>
                            <xsl:if test="//page/qd/futuredate">
                              <th>
                                <xsl:value-of select="//page/qd/futuredate"/>
                              </th>
                            </xsl:if>
                          </thead>
                        </tr>
                        <tr>
                          <td align="left">
                            <xsl:value-of select="//page/qd/qdlistprice/@price"/>

                          </td>
                          <xsl:if test="//page/qd/futuredate">
                            <td>
                              <xsl:value-of select="//page/qd/futureqdlistprice/@price"/>
                            </td>

                          </xsl:if>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>

              </xsl:if>

              <xsl:if test="//page/qd/valvepaklistprice">

                <summaryheader>
                  <xsl:value-of select="//page/qd/screenlabels[@id=634]/@label"/>
                  <!--Valvepak List Price-->
                </summaryheader>
                <table>
                  <tr>
                    <!--Valvepak List Price!-->
                    <td>
                      <div>
                        <span>
                          <xsl:value-of select="//page/qd/screenlabels[@id=635]/@label"/>
                          <!--Valvepak Estimate-->
                        </span>
                        <br/>
                        <span>
                          P/N:
                          <xsl:if test="//page/qd/qsummary/@qdpartno">
                            <xsl:value-of select="//page/qd/qsummary/@qdpartno"/>
                          </xsl:if>
                          <xsl:if test="//page/qd/qsummary[not (@qdpartno)]">
                            <xsl:value-of select="//page/qd/qsummary/@partno"/>
                          </xsl:if>
                          <br/>
                          <xsl:value-of select="//page/qd/screenlabels[@id=636]/@label"/>
                          <!--List Price-->
                        </span>
                      </div>
                      <table>
                        <tr>
                          <thead>
                            <th align="left">
                              <xsl:value-of select="//page/qd/today"/>

                            </th>
                            <xsl:if test="//page/qd/futuredate">
                              <th>
                                <xsl:value-of select="//page/qd/futuredate"/>
                              </th>
                            </xsl:if>
                          </thead>
                        </tr>
                        <tr>
                          <td align="left">
                            <xsl:value-of select="//page/qd/valvepaklistprice/@price"/>
                          </td>
                          <xsl:if test="//page/qd/futuredate">
                            <td>
                              <xsl:value-of select="//page/qd/futurevalvepaklistprice/@price"/>
                            </td>

                          </xsl:if>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>

              </xsl:if>


              <xsl:if test="//page/qd/sunfirstrun">
                <hr style="page-break-after:always;"/>
                <summaryheader>
                  <xsl:if test="//page/qd/qqpricingnotes">
                    Pricing Notes and Conditions
                  </xsl:if>
                </summaryheader>

                <xsl:if test="//page/qd/pricemsg/@pricemsg">
                  <table>
                    <tr>
                      <td colspan="8" style="border:none;">
                        <b>
                          QuickDesign Note: <xsl:value-of select="//page/qd/pricemsg/@pricemsg"/>
                        </b>

                      </td>
                    </tr>
                  </table>
                </xsl:if>
                <!--
             <table class="tablepricingnotes"> 
                <tr>
                <td colspan="8">
                -->
                <div class="divpricingnotes">
                  <xsl:for-each select="//page/qd/qqpricingnotes">
                    <xsl:value-of select="@english" disable-output-escaping="yes"/>
                  </xsl:for-each>
                </div>
                <!--
                </td>
              </tr>
            </table>
            -->

              </xsl:if>
            </section>
            </xsl:if>
        </div>

      </xsl:if>
    </div>
    </xsl:template>

</xsl:stylesheet>
