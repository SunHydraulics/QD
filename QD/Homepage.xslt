<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="datepicker.xslt"/>
  <xsl:variable name="hdatepicker">
    <xsl:call-template name="datepicker"/>
  </xsl:variable>
  
  <xsl:template match="/">
    <input type="hidden" id="thisrowgroup" value="1"/>
		<input type="hidden" id="data_hidethisdesign" name="data_hidethisdesign"/>
		<input type="hidden" id="data_showthisdesign" name="data_showthisdesign"/>
		<xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
         <xsl:if test="//page/qd[adminlevel=99]">
        <section class="bg--light-grey pad block">
          <h2 class="block-title">
            <xsl:value-of select="//page/qd/screenlabels[@id=163]/@label"/>
            <!--Sun Admin-->
          </h2>
          <!--
          <h2 class="block-title">Manage your account</h2>
          <div class="right grid align-to-title">
            <a href="default.aspx?page=settings" class="button bg~~orange right bottom-space-half" >Change Settings</a>
            <xsl:if test="//page/qd[adminlevel=1]">
              <a href="#" class="button bg~~orange right" style="clear:both;"
                 onclick="alert('Preferences apply to specific designs')"
               >Change Preferences</a>
            </xsl:if>             
          </div>
          -->
             <a href="#" class="tx--orange bottom-space-half" enabled="false">QuickDesign Log</a>
            <br/>
              <a href="#" class="tx--orange" enabled="false">Statistics</a>         
          </section>
          </xsl:if>
				<xsl:if test="//page/qd/showwhatsnewlink">
					<div class="divseewhatsnew">
							<a href="#" class="tx--orange small">
								<xsl:attribute name="onclick">
									$('#awhatsnewpopup').addClass('active');
									$('.popup-overlay').addClass('active');
									return false;
								</xsl:attribute>
								See what's new
							</a>
					</div>					
				</xsl:if>


<!--
        <div class="homepagemessage" id="homepagemessage">
					<b>FLeX valves are now available to submit in QuickDesign! </b>
					Please note that if ordered, projects that include FLeX valves will not begin shipping until January 2, 2018.
				</div>
-->
            <section class="bg--light-grey pad block bottom-space grid lightborder">
          
          <h2 class="block-title">
            <xsl:value-of select="//page/qd/screenlabels[@id=571]/@label"/>
            <!--Search existing projects-->
            <a name="searchblock"/>
              <a id="startnewproject" href="default.aspx?page=setup&amp;qquoteid=0" class="button bg--blue">
                <xsl:value-of select="//page/qd/screenlabels[@id=572]/@label"/>
                <!--Start a new project-->
              </a>
          </h2>
            <div class="col-4-7">
              <table id="tablesearchoptions">
                <xsl:if test="//page/qd/whooptions">
                  <tr>
                    <td class="tablestrong">
                      <xsl:value-of select="//page/qd/screenlabels[@id=415]/@label"/>:
                      <!--Created by-->
                    </td>
                    <td>
                      <ul class="horizontal-list">
                        <xsl:for-each select="//page/qd/whooptions[@id &lt; 5]">
                          <li>
                            <input type="radio" name="data_whooption">
                              <xsl:attribute name="value">
                                <xsl:value-of select="@id"/>
                              </xsl:attribute>
                              <xsl:if test="@selected">
                                <xsl:attribute name="checked">true</xsl:attribute>
                              </xsl:if>
                              <xsl:attribute name="onclick">
                                $('#data_username').val('');
                                saction="default.aspx#searchblock";
                                submitit(saction);
                              </xsl:attribute>
                            </input>
                            <label >
                              <xsl:attribute name="for">
                                <xsl:value-of select='@id'/>
                              </xsl:attribute>
                              <xsl:value-of select='@display'/>
                            </label>
                          </li>
                        </xsl:for-each>
                      </ul>
                      <xsl:if test='//page/qd/showwhofilter'>
                        <div class='divusersearch'>
                          <ul class="horizontal-list">
                            <xsl:for-each select="//page/qd/whooptions[@id = 5]">
                              <li>
                                <input type="radio" name="data_whooption">
                                  <xsl:attribute name="value">5</xsl:attribute>
                                  <xsl:if test="@selected">
                                    <xsl:attribute name="checked">true</xsl:attribute>
                                  </xsl:if>
                                  <xsl:attribute name="onclick">
                                    if($('#data_username').val()==''){
                                    $('#data_username').focus();
                                    return}
                                    saction="default.aspx#searchblock";
                                    submitit(saction);
                                  </xsl:attribute>
                                </input>
                                <label >
                                  <xsl:attribute name="for">
                                    <xsl:value-of select='@id'/>
                                  </xsl:attribute>
                                  <xsl:value-of select='@display'/>
                                </label>

                              </li>
                            </xsl:for-each>
                          </ul>
                          <xsl:if test='//page/qd/showwhofilter'>
                            <input id="data_username" name="data_username" type="text" maxlength="20">
                              <xsl:attribute name="placeholder">
                                <xsl:value-of select="//page/qd/screenlabels[@id=573]/@label"/>
                                <!--Person's last name-->
                              </xsl:attribute>
                              <xsl:attribute name="onkeydown">
                                if(event.keyCode==13){
                                saction="default.aspx#searchblock";
                                submitit(saction);
                                }
                              </xsl:attribute>
                              <xsl:if test="//page/qd/username">
                                <xsl:attribute name="value">
                                  <xsl:value-of select='//page/qd/username/@stext'/>
                                </xsl:attribute>
                              </xsl:if>
                            </input>
                          </xsl:if>
                         </div>
                      </xsl:if>
                    </td>
                  </tr>
                </xsl:if>
                <tr>
                  <td class='tablestrong'>
                    <xsl:value-of select="//page/qd/screenlabels[@id=419]/@label"/>:
                    <!--Status-->
                  </td>
                  <td>
                    <ul class="horizontal-list">
                      <xsl:for-each select="//page/qd/scopeoptions">
                        <li>
                          <input type="radio" name="data_scopeoption">
                            <xsl:attribute name="value">
                              <xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:if test="@selected">
                              <xsl:attribute name="checked">true</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="onclick">
                              saction="default.aspx#searchblock";
                              submitit(saction);
                            </xsl:attribute>
                          </input>
                          <label >
                            <xsl:attribute name="for">
                              <xsl:value-of select='@id'/>
                            </xsl:attribute>
                            <xsl:value-of select='@display'/>
                          </label>
                        </li>
                      </xsl:for-each>
                    </ul>                   
                  </td>
                </tr>
                <xsl:if test='//page/qd/showdistfilter'>
                  <tr>
                    <xsl:if test='//page/qd/showmore'>
                      <xsl:attribute name='class'>rowfiltermore</xsl:attribute>
                    </xsl:if>
                    <td class='tablestrong'>
                      <xsl:value-of select="//page/qd/screenlabels[@id=154]/@label"/>:
                      <!--Distributor-->               
                    </td>
                    <td>
                      <input id="data_distname" name="data_distname" type="text" maxlength="20" class="distcustbox">
                    <xsl:attribute name="placeholder"><xsl:value-of select="//page/qd/screenlabels[@id=574]/@label"/>
                      <!--Distributor name or code-->	
                    </xsl:attribute>
                    <xsl:attribute name="onkeydown">
                      if(event.keyCode==13){
                      saction="default.aspx#searchblock";
                      submitit(saction);
                      }
                    </xsl:attribute>
                    <xsl:if test="//page/qd/distname">
                      <xsl:attribute name="value">
                        <xsl:value-of select='//page/qd/distname/@stext'/>
                      </xsl:attribute>
                    </xsl:if>
                  </input>
                    </td>
                  </tr>
                </xsl:if>
                <xsl:if test='//page/qd/showcustfilter'>
                  <tr>
                    <xsl:if test='//page/qd/showmore'>
                      <xsl:attribute name='class'>rowfiltermore</xsl:attribute>
                    </xsl:if>
                    <td class='tablestrong'>
                      <xsl:value-of select="//page/qd/screenlabels[@id=149]/@label"/>:
                      <!--Customer-->               
                    </td>
                    <td>
                      <input id="data_custname" name="data_custname" type="text" maxlength="20" class="distcustbox">
                    <xsl:attribute name="placeholder">Customer name</xsl:attribute>
                    <xsl:attribute name="onkeydown">
                      if(event.keyCode==13){
                      saction="default.aspx#searchblock";
                      submitit(saction);
                      }
                    </xsl:attribute>
                    <xsl:if test="//page/qd/custname">
                      <xsl:attribute name="value">
                        <xsl:value-of select='//page/qd/custname/@stext'/>
                      </xsl:attribute>
                    </xsl:if>
                  </input>
                    </td>
                  </tr>
                </xsl:if>
              </table>
              <xsl:if test='//page/qd/showmore'>
                <div class="divmore"><a href="#" title="Display more filters">
                  <xsl:attribute name="onclick">
                    $(".rowfiltermore").show();
                    $(".divmore").hide();
                    return false;
                  </xsl:attribute>
                <xsl:value-of select="//page/qd/screenlabels[@id=674]/@label"/>
					      <!--More filters--></a>
                </div>
              </xsl:if>
              
            </div>
            <div class="col-3-7">
              <input id="data_partno" name="data_partno" type="text" class="col-3-5">
                <xsl:attribute name="placeholder">
                  <xsl:value-of select="//page/qd/searchplaceholder/@stext"/>
                </xsl:attribute>
                <xsl:attribute name="onkeydown">
                  if(event.keyCode==13){
                  submitit();
                  }
                </xsl:attribute> 
              <xsl:if test="//page/qd/partno">
                <xsl:attribute name="value"><xsl:value-of select='//page/qd/partno'/></xsl:attribute>              
              </xsl:if>
                </input>
              <input type="button" class="col-2-5 button bg--darker-grey partnosearch">
                <xsl:attribute name="value"><xsl:value-of select="//page/qd/screenlabels[@id=675]/@label"/>
                <!--Search--></xsl:attribute>
               
                <xsl:attribute name="onclick">submitit();</xsl:attribute>
              </input>              
      </div>
        </section>

        <section class="bg--light-grey pad block bottom-space lightborder">
          <h3 class="block-title">
						<xsl:if test="//page/qd/recent/@ishidden">
							<xsl:value-of select="//page/qd/screenlabels[@id=718]/@label"/>
							<!--Archived Project list-->
						</xsl:if>
						<xsl:if test="not(//page/qd/recent/@ishidden)">
							<xsl:value-of select="//page/qd/screenlabels[@id=575]/@label"/>
							<!--Project list-->
						</xsl:if>
          </h3>
          <xsl:if test="//page/qd[not (recent)]">
            <xsl:value-of select="//page/qd/screenlabels[@id=576]/@label"/>...
            <!--No projects to show-->
          </xsl:if>
            
          <xsl:if test="//page/qd/recent">
          <div class="qdnavparent">
            <table class="qdnavtable">
                <thead>
                  <tr>
                <th>
                  <xsl:if test="//page/qd/searchshowall">
                    <a href="#searchblock" class="tx--orange underline">
                      <xsl:attribute name="onclick">
                        $(".qdrowgroup").removeClass("nodisplay");
                      </xsl:attribute>
                      <xsl:value-of select="//page/qd/screenlabels[@id=577]/@label"/>
                      <!--View all-->
                    </a>
                   </xsl:if>
								
								</th>
                <th class="qdnavarrowleft">
                  <xsl:attribute name="onclick">
                  var nmax = '<xsl:value-of select ="//page/qd/rowgroups[@ismax='1']/@num"/>';
                  searchtablepaginate(-1, nmax);
                  </xsl:attribute>
                
                </th>
                <th id="pagemessage">Page 1 of <xsl:value-of select ="//page/qd/rowgroups[@ismax='1']/@num"/>
              </th>
                <th class="qdnavarrowright">
                  <xsl:attribute name="onclick">
                  var nmax = '<xsl:value-of select ="//page/qd/rowgroups[@ismax='1']/@num"/>';
                  searchtablepaginate(1, nmax);
                  </xsl:attribute>
              </th>
                </tr> 
              </thead>    
            </table>      
          </div>
          <div id="tablesearch"><!-- class="search-table-masker closed bottom-space">-->
            <table class="table">
              <thead>
                <tr>
                  <th>
                    <xsl:value-of select="//page/qd/screenlabels[@id=578]/@label"/>
                    <!--Project-->
                  </th>
                  <th>
										<xsl:if test="//page/qd/recent/@ishidden">
											<xsl:value-of select="//page/qd/screenlabels[@id=719]/@label"/>
											<!--Action-->
										</xsl:if>
										<xsl:if test="not(//page/qd/recent/@ishidden)">
											<xsl:value-of select="//page/qd/screenlabels[@id=579]/@label"/>
										</xsl:if>
                    <!--Open-->
                  </th>
                  <th>
                    <xsl:value-of select="//page/qd/screenlabels[@id=580]/@label"/>
                    <!--Created-->
                  </th>
                  <th>
                    <xsl:value-of select="//page/qd/screenlabels[@id=419]/@label"/>
                    <!--Status-->
                  </th>
                </tr>
              </thead>

              <xsl:for-each select="//page/qd/rowgroups">
                <tbody>
                  <xsl:attribute name="id">rowgroup<xsl:value-of select="@num"/></xsl:attribute>
                  <xsl:attribute name="class"><xsl:if 
                  test="@selected">qdrowgroup</xsl:if><xsl:if 
                  test="not(@selected)">qdrowgroup nodisplay</xsl:if>                
                  </xsl:attribute>
                  <xsl:for-each select="//page/qd/recent[@rowgroup = current()/@num]">
                    <tr>
                      <td>
                        <xsl:value-of select="@partno"/>
												<xsl:if test="//page/qd/showhidelink">													
													<span style="float:right;">
														<xsl:if test="not(@ishidden)">
															<a class="hidedesignlink" href="#">
																<xsl:attribute name="title">
																	<xsl:value-of select="//page/qd/screenlabels[@id=720]/@label"/>
																		 <!--Remove project from listing-->
																
																</xsl:attribute>
																<xsl:attribute name="onclick">
																	sval='<xsl:value-of select="//page/qd/screenlabels[@id=721]/@label"/>'
																		 <!--his project will be removed from your listing but...-->
																	if(confirm(sval)==false){
																	return false;
																	}
																	$('#data_hidethisdesign').val('<xsl:value-of select="@quoteid"/>');
																	submitit()
																</xsl:attribute>
																x</a>
														</xsl:if>

												</span>												
												</xsl:if>
                        <xsl:if test="//page/qd[not(isqdlite)]">
                          <div class="resultsusername">
                            <xsl:value-of select="@customer"/>
                            <xsl:if test="@drawingtitle">
                              <br/><span style="color:#4f4f4f;"><xsl:value-of select="@drawingtitle"/></span>
                            </xsl:if>
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
 												<xsl:if test="@ishidden">
													<div class="divpaddingbottom">
														<a class="tx--orange underline linkspace" href="#">
																<xsl:attribute name="title">
																	<xsl:value-of select="//page/qd/screenlabels[@id=722]/@label"/>
																		 <!--Restore project to main listing-->															
																</xsl:attribute>
															<xsl:attribute name="onclick">
																if(confirm("Continue?")==false){
																return false;
																}
																$('#data_showthisdesign').val('<xsl:value-of select="@quoteid"/>');
																submitit()
															</xsl:attribute>
															<xsl:value-of select="//page/qd/screenlabels[@id=723]/@label"/>
																		 <!--Restore-->	
														</a>
													</div>
												</xsl:if> 
												<xsl:if test="not(@ishidden)">
													
													<div class="divpaddingbottom">
                          <xsl:if test="@isschematic=1">												
                            <a href="#" class="tx--orange underline linkspace">
                              <xsl:attribute name="href">
                                default.aspx?page=schematic&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              <xsl:value-of select="//page/qd/screenlabels[@id=581]/@label"/>
                              <!--Schematic-->
                            </a>
                          </xsl:if>
                          <xsl:if test="@isconfig=1">
                            <a href="#" class="tx--orange underline linkspace">
                              <xsl:attribute name="href">
                                default.aspx?page=config&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              <xsl:value-of select="//page/qd/screenlabels[@id=198]/@label"/>
                              <!--Config-->
                            </a>
                          </xsl:if>
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
                      </xsl:if> 
											</td>
                      <td>
                        <xsl:value-of select="@createdate"/>
                        <xsl:if test="//page/qd[not(isqdlite)]">
                          <div class="resultsusername">
                            <xsl:value-of select="@name"/>
                          </div>
                        </xsl:if>
                      </td>
                      <td>
                        <xsl:value-of select="@status"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </xsl:for-each>
            </table>
						<xsl:if test="//page/qd/showviewallarchive">
							<a href="#searchblock" class="tx--orange underline smallbutton pad-half">
								<xsl:attribute name="onclick">
									$('#data_hidethisdesign').val('-1');
									saction="default.aspx#searchblock";
									submitit(saction)
								</xsl:attribute>
								<xsl:value-of select="//page/qd/screenlabels[@id=724]/@label"/>
                <!--Show archived projects-->
							</a>
						</xsl:if>
						<xsl:if test="//page/qd/recent/@ishidden">
							<a href="#searchblock" class="tx--orange underline smallbutton pad-half">
								<xsl:attribute name="onclick">

									saction="default.aspx#searchblock";
									submitit(saction)
								</xsl:attribute>
								<xsl:value-of select="//page/qd/screenlabels[@id=725]/@label"/>
								
								<!--Return to main listing-->
							</a>
						</xsl:if>
					</div>
          <xsl:if test="seeoldshowall">
          <div class="view-more tx--center tx--med-dark-grey">
            <h2 class="bottom-space-half">
              <xsl:value-of select="//page/qd/searchresult"/> 
            </h2>
            <xsl:if test="//page/qd/searchshowall">
            <a href="#searchblock" class="tx--orange underline">
              <xsl:attribute name="onclick">
                $("#tablesearch").toggleClass("closed");
              </xsl:attribute>
              <xsl:value-of select="//page/qd/screenlabels[@id=577]/@label"/>
              <!--View all-->
            </a>
            </xsl:if>
          </div>
          </xsl:if>
          </xsl:if>

        </section>
      <xsl:if test="//page/qd/report">
        <section class="bg--light-grey pad block bottom-space lightborder">
           <h2 class="blocktitle divnavtitle">
                Reports - <xsl:value-of select="//page/qd/me/@name"/>
                <!--Select a design option below-->
              </h2>
              <xsl:for-each select="//page/qd/report">
                <div>
                  <a class="button bg--blue" style="cursor:pointer;" target="_blank">
                    <xsl:attribute name="href">
                      <xsl:value-of select="@url"/>
                    </xsl:attribute>
                    <xsl:value-of select="@title"/>
                  </a>
                </div>
                <br/>
                <div class="grayitalic">
                  <xsl:value-of select="@comment"/>
                </div>
                <hr/>
              </xsl:for-each>    
        </section>
      </xsl:if>  

      </div>
      <!-- .container -->
    </div>

    <div id="awhatsnewpopup" class="popup popupwhatsnew">
      <div class="page-header pad">
        <h1 class="title" id="highlightsheader">
					QuickDesign
				</h1>
      </div>
      <section class="bg--light-grey pad block bottom-space ">
        <div class="whatsnewheader">
					<xsl:value-of select="//page/qd/qdwhatsnew/@header"/>
        </div>

        
        <div class="whatsnewtext">
					<xsl:if test="//page/qd/tandc">
						<div style="max-height:300px;overflow:auto;border:1px solid silver;padding:6px;">
							<xsl:for-each select="//page/qd/tandc">
								<xsl:value-of select="@english" disable-output-escaping="yes"/>
								
								<br/>
								<hr/>
							</xsl:for-each>							
						</div>

					</xsl:if>
					<xsl:if test="//page/qd[not (tandc)]">
						<xsl:value-of select="//page/qd/qdwhatsnew/@display" disable-output-escaping="yes"/>
					</xsl:if>
					
					
				</div>

      </section>
      <section class="bg--light-grey pad-half block bottom-space right">
				<input type="hidden" id="data_txtqdmmessages" name="data_txtqdmmessages"></input>
				<!--
				<a id="remindmelater" class="button whatsnew" title="Show this message again tomorrow">
          <xsl:attribute name="onclick">
						$('#awhatsnewpopup').removeClass('active');
						$('.popup-overlay').removeClass('active');
						
						$('#data_txtqdmmessages').val('showafter');
						submitit();
					</xsl:attribute>
          Remind me later
        </a> .
				-->
        <a id="agotit" class="button whatsnew" title="Don't show this message again.">
          <xsl:attribute name="onclick">
						$('#awhatsnewpopup').removeClass('active');
						$('.popup-overlay').removeClass('active');
						$('#data_txtqdmmessages').val('gotit');
						submitit();
					</xsl:attribute>
         Accept 
        </a>
      </section>
    </div>
    
    <div class="popup-overlay"></div>
    <xsl:if test="//page/qd/showwhatsnew">
      <script>
        <xsl:comment>
          $('#awhatsnewpopup').addClass('active');
          $('.popup-overlay').addClass('active');
        </xsl:comment>
      </script>
    </xsl:if>

</xsl:template>
</xsl:stylesheet>
