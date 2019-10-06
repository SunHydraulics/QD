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
              <!--Project Summary-->
              <span style="font-size:70%;"><xsl:value-of select="//page/qd/datenow/@datenow"/></span>
              <span style="padding-left:50px;">
                <img id="imgformatforprint" src="images/print.gif" style="cursor:pointer" title="Format this page for printing">
                </img>
              </span>
              <xsl:if test="//page/qd[sunfirstrun or qdlistprice]">
                <xsl:if test="//page/qd[not (hideconfig)]"> 
                <div class="divseepricing">
                  <xsl:value-of select="//page/qd/screenlabels[@id=695]/@label"/>
                  <!--See the Pricing section for ordering instructions.-->
                </div>
                </xsl:if>
              </xsl:if>
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
          <xsl:if test="//page/qd[adminlevel='1' and not(showcustomerversion)]">
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
									<xsl:if test="//page/qd/fixedpricemessage">
										<div class="qdpnordernote">
											<xsl:value-of select="//page/qd/fixedpricemessage" />
										</div>
									</xsl:if>
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
											<td>
												Zbody
											</td>
											<td>
												<xsl:for-each select="//page/qd/zbody">
													<a title="Open the ZBody" class="tx--orange underline" target="pdd">
														<xsl:attribute name="href">
															<xsl:value-of select="@surl"/>
														</xsl:attribute>
														<xsl:value-of select="@partno"/>
													</a>
												</xsl:for-each>

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
												<td colspan="2" class="block-title">
                          <b>Price Metrics</b>
												</td>
											</tr>
										<tr>
											<td>Target Net Price	($)									
											</td>
											<td>
												<input id="data_netprice" name="data_netprice" maxlength="10">
													<xsl:attribute name="value">
														<xsl:value-of select="//page/qd/qdpricemetrics/@netprice"/>
													</xsl:attribute>
												</input>
											</td>
										</tr>
										<tr>
											<td nowrap="true">Expected Gross Margin	($)												
											</td>
											<td>
												<input id="data_expectedgrossmargin" name="data_expectedgrossmargin" maxlength="10">
													<xsl:attribute name="value">
														<xsl:value-of select="//page/qd/qdpricemetrics/@expectedgrossmargin"/>
													</xsl:attribute>
												</input>
											</td>
										</tr>
										<tr>
											<td>Customer Target Price ($)												
											</td>
											<td>
												<input id="data_targetprice" name="data_targetprice" maxlength="10">
													<xsl:attribute name="value">
														<xsl:value-of select="//page/qd/qdpricemetrics/@targetprice"/>
													</xsl:attribute>
												</input>
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
												<td colspan="2" class="grayitalic">
													A status of Pending or Win Anticipated will cause the design
													to be locked.  The In Development status allows the 
													design to be edited while pricing is discussed.
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
              <br/>
              <a class="tx--orange" href="#">
                <xsl:if test="//page/qd[not (adminlevel='1')]">
                  <xsl:attribute name="style">display:none;</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onclick">
                  squoteid = '<xsl:value-of select="//page/qd/quoteid"/>';
                  surl="report.aspx?page=mlaborcosts&amp;quoteid="+squoteid;
                  var nwin = window.open(surl,
                  'sunlaborcosts' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                  nwin.focus();
                  return false;
                </xsl:attribute> Integrated Package Costs (in review)
              </a>
              <br/>
              <a class="tx--orange" href="#">
                <xsl:if test="//page/qd[maynotseepricing]">
                  <xsl:attribute name="style">display:none;</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onclick">
                  squoteid = '<xsl:value-of select="//page/qd/quoteid"/>';
                  sunit=document.getElementById("data_unitid").value;
                  surl="report.aspx?page=sundetailcosting&amp;quoteid="+squoteid+"&amp;unitid="+sunit;
                  var nwin = window.open(surl,
                  'sundetailcosting' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                  nwin.focus();
                  return false;
                </xsl:attribute> Manifold Volume Calculations (in review)
              </a>

            </section>
          </xsl:if>
          
          <xsl:if test="//page/qd[not (hideconfig) and not(showcustomerversion)]">
             <xsl:if test="//page/qd[adminlevel='1' and qdlistprice]">
                <a class="tx--orange" href="#">
                    <xsl:attribute name="onclick">
                      squoteid = '<xsl:value-of select="//page/qd/quoteid"/>';
                      surl="default.aspx?page=summary&amp;quoteid="+squoteid+"&amp;showcustomerversion=1&amp;formatforprint=1";
                      var nwin = window.open(surl,
                      'customerquote' , 'menubar=1,toolbar=1,scrollbars=1,height=900,width=1000,left=30,top=30,resizable=yes')
                      nwin.focus();
                      return false;
                    </xsl:attribute> Show List Price Only
                  </a>
               </xsl:if>
            <hr style="page-break-after:always;border:none;"/>
            <section class="bg--light-grey pad block bottom-space grid lightborder">
              <xsl:if test="//page/qd/shipdelaynote">
								
                <div class="qdpnordernote">
                  <xsl:value-of select="//page/qd/shipdelaynote" disable-output-escaping="yes"/>
                </div>
              </xsl:if>            
              <xsl:if test="//page/qd[sunfirstrun or qdproduction or qdlistprice]">
                <h3 class="block-title"><a class="helpanchor" id="currencyanchor"/>
                  <xsl:value-of select="//page/qd/screenlabels[@id=619]/@label"/>
                  <!--Pricing-->
                  <span style="font-size:70%;padding-left:12px;">(<xsl:value-of select="//page/qd/units[@selected='1']/@name"/>,
                  <xsl:value-of select="//page/qd/today"/>)</span>
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
                


                <xsl:if test="//page/qd/sunfirstrun">
                  <div class="divpricingsummary">
                    <summaryheader>
                      <xsl:value-of select="//page/qd/screenlabels[@id=622]/@label"/><br/>
                      <!--Designed by Sun Engineering-->
                      (SunDesign)
                    </summaryheader>

                    <table class="tablepricing">
                      <tr>
                        <!--Sun first run!-->
                        <td>
                          <div class="divpricingsummarysubhead">
                            <span>
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
                      </tr>
                    </table>
                    <table class="tablepricing">
                      <tr>
                        <!--Sun production!-->
                        <td>
                          <div class="divpricingsummarysubhead">
                            <span>
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
                      </tr>
                    </table>
                  </div>
                </xsl:if>
                
                <div class="divpricingsummary">

                  <summaryheader>
                    <xsl:value-of select="//page/qd/screenlabels[@id=625]/@label"/>
                    <!--Designed by QuickDesign-->
                  </summaryheader>
                  <xsl:if test="//page/qd/qdproduction">
                    <table class="tablepricing">
                      <tr>
                        <!--QD First Run!-->
                        <xsl:if test="//page/qd/qdproduction">
                          <td>
                            <div class="divpricingsummarysubhead">
                              <span>
                                <xsl:value-of select="//page/qd/screenlabels[@id=623]/@label"/>
                                <!--First Run Net Pricing-->
                              </span>
                            </div>
                            <table>
                              <xsl:if test="//page/qd/showqdfirstrunissameas">
                                <tr>
                                  <td colspan="3">
                                    <div>

                                      <xsl:value-of select="//page/qd/screenlabels[@id=626]/@label"/>
                                      <!--First run pricing does not apply to QuickDesign manifolds-->
                                      (<xsl:value-of select="//page/qd/screenlabels[@id=627]/@label"/>)
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
                    <table class="tablepricing">
                      <tr>
                        <!--QD production!-->
                        <xsl:if test="//page/qd/qdproduction">
                          <td>
                            <div class="divpricingsummarysubhead">
                              <span>
                                <xsl:value-of select="//page/qd/screenlabels[@id=631]/@label"/>
                                <!-- Production Net Pricing-->
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
                    <table class="tablepricing">
                      <tr>
                        <!--QuickDesign List Price!-->
                        <td>
                          <div class="divpricingsummarysubhead">
                            <span>
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
                </div>
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
                <hr style="page-break-after:always;clear:both;"/>
                <summaryheader>
                  <xsl:if test="//page/qd/qqpricingnotes">
                    <xsl:value-of select="//page/qd/qqpricingnotes/@header"/>
                   <!-- Pricing Notes and Conditions-->
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

          <xsl:if test="//page/qd[not (hideconfig) 
                  and showcustomerversion
                  and qdlistprice/@price]">
            <hr style="page-break-after:always;border:none;"/>
            <section class="bg--light-grey pad block bottom-space grid lightborder">
              <xsl:if test="//page/qd[sunfirstrun or qdproduction or qdlistprice]">
                <h3 class="block-title">
                  Ordering and Pricing Information
                  <span style="font-size:70%;padding-left:12px;">
                    (<xsl:value-of select="//page/qd/units[@selected='1']/@name"/>,
                    <xsl:value-of select="//page/qd/today"/>)
                  </span>
                </h3>

                <div id="customerpricing">
                  <h5>Sun Authorized Distributor</h5>
                  <div><xsl:value-of select="//page/qd/distline/@blocktext" disable-output-escaping="yes"/>
                    <br/>
                    <i>Contact: </i> <xsl:value-of select="//page/qd/custcontact/@blocktext"/>
                  </div>
                  <h5>When Ordering, Specify this P/N</h5>
                  <div>
                    <xsl:value-of select="//page/qd/pntoorder/@pn"/>
                  </div>
                  <h5>List Price</h5>
                  <div>
                    <xsl:value-of select="//page/qd/qdlistprice/@price"/>
                  </div>

                  <h5>Delivery Options</h5>
                  <div><xsl:value-of select="//page/qd/qdorderterms/@english" disable-output-escaping="yes"/></div>
                </div>

              </xsl:if>
            </section>
          </xsl:if>
          
          
        </div>

      </xsl:if>
    </div>
    <xsl:if test="//page/qd/formatforprint">
      <script>
        <xsl:comment>
            formatforprint("0");
        </xsl:comment>
      
      </script>  
    </xsl:if>
		<div id="divquoteemail" class="popup">
			<div>
				<input type="button" class="button bg--darker-grey smallbutton" style="width:100px;">
					<xsl:attribute name="value">Close
					</xsl:attribute>
					<xsl:attribute name="onclick">
						$('#divquoteemail').removeClass('active');
						$('.popup-overlay').removeClass('active');
						return false;
					</xsl:attribute>
				</input>
			</div>

			<h3>SunDesign Quote</h3>
			<div class="mdtoolstext">
				To request a quote from your distributor for this project, click 
				<a class="button bg--blue" href="#" style="padding-left:20px;">
					<xsl:attribute name="onclick">
						$('#divquoteemail').removeClass('active');
						$('.popup-overlay').removeClass('active');
							surl='<xsl:value-of select="@surl"/>';
							var nwin = window.open(surl,
							'poption', 'menubar=0,toolbar=0,scrollbars=1,left=30,top=30,resizable=yes')
							nwin.focus();
					</xsl:attribute>
					here
				</a>
			</div>


		</div>
    
    <xsl:if test="//page/qe">
      <div>
      Show dialog
      </div>
    </xsl:if>
    
    <div id="popupoverlay" class="popup-overlay"></div>
  </xsl:template>

</xsl:stylesheet>
