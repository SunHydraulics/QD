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
					QD Integrated Packages Report
				</div>
				<xsl:if test="//page[qd/errormessage or errormessage]">
					<div id="errormessage">
						<xsl:value-of select="//page/qd/errormessage"/>
						<xsl:value-of select="//page/errormessage"/>
					</div>
				</xsl:if>
				<xsl:if test="//page[not(qd/errormessage) and not(errormessage)]">

					<br/>
					<section class="bg--light-grey pad block bottom-space grid lightborder ">
						<form id="frmreportform" method="post" runat="server">
							<table>
								<tr>
									<td align="top">
										<h2 class="block-title">
											Include
										</h2>
											<table id="tablesearchoptions">
												<tr>
													<td class="tablestrong">
														Designer
													</td>
													<td>
														<select id="lstdesigner" name="lstdesigner">
															<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
															<xsl:for-each select="//page/qd/designers">
																<option>
																	<xsl:if test="@selected"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
																	<xsl:attribute name="value">
																		<xsl:value-of select="@id"/>
																	</xsl:attribute>
																	<xsl:value-of select="@name"/>
																</option>

															</xsl:for-each>

														</select>
													</td>
												</tr>
												<tr>
													<td class="tablestrong">
														Schedule
													</td>
													<td>
														<select id="lstschedule" name="lstschedule">
															<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
															<xsl:for-each select="//page/qd/schedules">
																<option>
																	<xsl:if test="@selected"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
																	<xsl:attribute name="value">
																		<xsl:value-of select="@id"/>
																	</xsl:attribute>
																	<xsl:value-of select="@name"/>
																</option>

															</xsl:for-each>

														</select>
													</td>
												</tr>

												<tr>
													<td class="tablestrong">
														Status
													</td>
													<td>
														<select id="lststatus" name="lststatus">
															<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
															<xsl:for-each select="//page/qd/statuses">
																<option>
																	<xsl:if test="@selected"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
																	<xsl:attribute name="value">
																		<xsl:value-of select="@id"/>
																	</xsl:attribute>
																	<xsl:value-of select="@name"/>
																</option>

															</xsl:for-each>

														</select>
													</td>
												</tr>
												<tr>
													<td class="tablestrong">
														Project Type
													</td>
													<td>
														<select id="lstprojtype" name="lstprojtype">
															<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
															<xsl:for-each select="//page/qd/projtypes">
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
													</td>
												</tr>
	
									<tr>
										<td class="tablestrong">
											Region
										</td>
										<td>
											<select id="lstregion" name="lstregion">
												<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>

												<xsl:for-each select="//page/qd/regions">
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
										</td>
									</tr>	
								</table>
									</td>
									<td align="top">
										<h2 class="block-title">
											Sort By
										</h2>

										<table id="tablesearchoptions">
											<tr>
												<td>
													<select id="lstorderby" name="lstorderby">
														<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
														<xsl:for-each select="//page/qd/orderby">
															<option>
																<xsl:if test="@selected1"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
																<xsl:attribute name="value">
																	<xsl:value-of select="@id"/>
																</xsl:attribute>
																<xsl:value-of select="@name"/>
															</option>

														</xsl:for-each>

													</select>
													<div class="grayitalic">

														<br/> ...then by
													</div>
													<select id="lstorderby2" name="lstorderby2">
														<xsl:attribute name="onchange">document.forms[0].submit();</xsl:attribute>
														<option/>
														<xsl:for-each select="//page/qd/orderby[not (@selected1)]">
															<option>
																<xsl:attribute name="value">
																	<xsl:value-of select="@id"/>
																</xsl:attribute>
																<xsl:if test="@selected2"><xsl:attribute name="selected">true</xsl:attribute></xsl:if>
																<xsl:value-of select="@name"/>
															</option>

														</xsl:for-each>

													</select>
												</td>
											</tr>
										</table>

									</td>
								</tr>
							</table>
						</form>
					</section>
						
					<section class="bg--light-grey pad block bottom-space grid lightborder ">
					<div><!-- class="search-table-masker closed bottom-space">-->
						<div class="small">Rows: <xsl:value-of select="//page/qd/rowcount"/></div>
            <table class="table">
              <thead>
                <tr>
                  <th>
                    Project
                  </th>
                  <th>
                    Open
                  </th>
                  <th>
                    Created
                  </th>
                  <th>
                    Ordered
                  </th>
                  <th>
                    Due
                  </th>
                  <th>
                    Designer
                  </th>
                  <th>
                    Status
                  </th>
                </tr>
              </thead>

              <xsl:for-each select="//page/qd/report">
								<!--
                <tbody>
                  <xsl:attribute name="id">rowgroup<xsl:value-of select="@num"/></xsl:attribute>
                  <xsl:attribute name="class"><xsl:if 
                  test="@selected">qdrowgroup</xsl:if><xsl:if 
                  test="not(@selected)">qdrowgroup nodisplay</xsl:if>                
                  </xsl:attribute>
                  <xsl:for-each select="//page/qd/recent[@rowgroup = current()/@num]">
									-->
                    <tr>
                      <td>
                        <xsl:value-of select="@partno"/>
                        <xsl:if test="//page/qd[not(isqdlite)]">
                          <div class="packreportsubitem">
                            <xsl:value-of select="@custname"/>
                          </div>
                        </xsl:if>

                            <!-- <a title="View project summary">
                          <xsl:attribute name="href">
                            default.aspx?page=summary&amp;quoteid=<xsl:value-of select="@quoteid"/>
                          </xsl:attribute>
                          
                        </a>
                        <div class="previewbox">
                          <iframe width = "500px" height = "500px">
                            <xsl:attribute name="src">
                              default.aspx?page=summary&amp;quoteid=<xsl:value-of select="@quoteid"/>
                            </xsl:attribute>
                          </iframe></div>
                        -->
                      </td>
                      <td nowrap="true">
                        <div class="divpaddingbottom">
                            <a href="#" class="tx--orange underline linkspace" target="pricing">
                              <xsl:attribute name="href">
                                default.aspx?page=summary&amp;quoteid=<xsl:value-of select="@quoteid"/>#sundataanchor
                              </xsl:attribute>
                               Pricing/Admin
                            </a>
													<br/>
                            <a href="#" class="tx--orange underline linkspace" target="pricing">
                              <xsl:attribute name="href">
                                report.aspx?page=sundetail&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              Detail
                            </a>
													   <a href="#" class="tx--orange underline linkspace" target="pricing">
                              <xsl:attribute name="href">
                                report.aspx?page=mlaborcosts&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              Costs
                            </a>


                          <!--
                          <xsl:if test="@islayout=1">
                            <a href="#" class="">
                              <xsl:attribute name="href">
                                default.aspx?page=layout&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              Layout
                            </a>
                          </xsl:if>
                          -->
                          <a class="tx--orange underline">
                            <xsl:attribute name="href">
                              default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@quoteid"/>
                            </xsl:attribute>
                            <xsl:value-of select="//page/qd/screenlabels[@id=582]/@label"/>
                            <!--Documents-->
                          </a>
                        </div>
                        <div style="display:none;">
                          <a class="tx--orange underline linkspace">
                            <xsl:attribute name="href">
                              default.aspx?page=layout&amp;quoteid=<xsl:value-of select="@quoteid"/>
                            </xsl:attribute>
                            <xsl:value-of select="//page/qd/screenlabels[@id=583]/@label"/>
                            <!--Layout-->
                          </a>
                          <a class="tx--orange underline">
                            <xsl:attribute name="href">
                              default.aspx?page=designsetup&amp;quoteid=<xsl:value-of select="@quoteid"/>
                            </xsl:attribute>
                            <xsl:value-of select="//page/qd/screenlabels[@id=584]/@label"/>
                            <!--Setup-->
                          </a>
                        </div>
                      </td>
                      <td>
                        <xsl:value-of select="@createdate"/>
                        <xsl:if test="//page/qd[not(isqdlite)]">
                          <div class="packreportsubitem">
                            <xsl:value-of select="@createdby"/>
                          </div>
                        </xsl:if>
                      </td>
                       <td>
                        <xsl:value-of select="@orderdate"/>
                      </td>
                       <td>
                        <xsl:value-of select="@reqshipdate"/>
													<xsl:if test="@daysdue">
														<div class="packreportsubitem">
															Due in <xsl:value-of select="@daysdue"/> days
														</div>
												 </xsl:if>
													<xsl:if test="@dayspastdue">
														<div class="packreportsubitem">
														Past due <xsl:value-of select="@dayspastdue"/>
														</div>
												 </xsl:if>                      
													<xsl:if test="@actshipdate">
														<div class="packreportsubitem">
														Shipped <xsl:value-of select="@actshipdate"/>
														</div>
												 </xsl:if>    
											</td>
											<td>
												
                        <xsl:value-of select="@designer"/>
                      </td>
												<td>
                        <xsl:value-of select="@status"/>
                          <div class="packreportsubitem">
                            Rev <xsl:value-of select="@rev"/>, <xsl:value-of select="@revdate"/>
                          </div>
										</td>
                    </tr>
                  </xsl:for-each>
                <!--
							 </xsl:for-each>
						</tbody> -->
             
            </table>
          </div>
					<xsl:if test="//page/qd/seemore">
						<xsl:value-of select="//page/qd/seemore/@message"/>
					</xsl:if>
					</section>

				</xsl:if>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
