<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <input type="hidden" id="data_action" name="data_action"/>
    <input type="hidden" id="data_qdkey" name="data_qdkey">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/qdkey"/>
      </xsl:attribute>
    </input>
    <xsl:if test="//page[qd/errormessage or errormessage]">
      <div id="errormessage">
        <xsl:value-of select="//page/qd/errormessage"/>
        <xsl:value-of select="//page/errormessage"/>
      </div>
    </xsl:if>

    <div class="container bg--white pad content--wrapper pad">
      <xsl:if test="//page/qd[not (errormessage)]">
        <h2 class="blocktitle">
          <xsl:if test="//page/qd/partno">
            <xsl:value-of select="//page/qd/screenlabels[@id=585]/@label"/>
            <!--Project Setup-->
          </xsl:if>
          <xsl:if test="//page/qd[not (partno)]">
            <xsl:value-of select="//page/qd/screenlabels[@id=586]/@label"/>
            <!--Fill out the form below. Then click Create.-->
          </xsl:if>
        </h2>
        <br/>
        <a id="formanchor"/>
        <div class="grid">
          <div class="setupform">
          <div class="row">
            <label>
              <xsl:if test="//page/qd[not (isqdlite)]">
                <!--Distributor* -->
                <xsl:value-of select="//page/qd/screenlabels[@id='107']/@label"/>*
              </xsl:if>
              <xsl:if test="//page/qd/isqdlite">
                <xsl:value-of select="//page/qd/screenlabels[@id='483']/@label"/>*
                <!--Sun Distributor* -->
              </xsl:if>
            <xsl:if test="//page/qd[isqdlite or partno]">
              <span class="labeldata"><xsl:value-of select="//page/qd/distributors/@name"/></span>
              </xsl:if>
            </label>


            
            <xsl:if test="//page/qd[not (partno)]">
              <select id="data_distributorids" name="data_distributorid">
                <xsl:if test="//page/qd/isqdlite">
                  <xsl:attribute name="style">display:none;</xsl:attribute>
                </xsl:if>
                <xsl:attribute name="onchange">
                  showstickymessage(this,"Please wait...",1 );
                  $("#data_action").val("");
                  document.forms[0].submit();
                </xsl:attribute>
                <option/>
                <xsl:for-each select="//page/qd/distributors">
                  <option>
                    <xsl:attribute name="title">
                      <xsl:value-of select="@fullcode"/>
                      <xsl:if test="@mo"> - Main Office</xsl:if>
                      <xsl:if test="not (@mo)"> - Branch Office</xsl:if>
                    </xsl:attribute>
                    <xsl:attribute name="value">
                      <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:if test="@selected='1'">
                      <xsl:attribute name="selected">true</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="not (@mo)">
                      <xsl:attribute name="style">color:#225555;</xsl:attribute>
                    </xsl:if>
                    <xsl:if test="not (@mo)">
                      .
                    </xsl:if>
                    <xsl:value-of select="@name"/>
                  </option>
                </xsl:for-each>
              </select>
              <xsl:if test="//page/qd/isbonotnow">
                <div style="color:#666666;text-align:right;">
                  ** Branch office
                </div>
              </xsl:if>
            </xsl:if>
            <xsl:if test="//page/qd[not(distributorselected)]">
              <div id="alertmessage2" class="speechbubble">
                Select a distributor to reveal the salespersons
                and customers for that distributor
              </div>
              <br/>
            </xsl:if>
          </div>
          <div class="row">
            <label>
               <xsl:if test="//page/qd[not (isqdlite)]">
                <!--Sales person* -->
                <xsl:value-of select="//page/qd/screenlabels[@id='161']/@label"/>*
              </xsl:if>
              <xsl:if test="//page/qd/isqdlite">
                <xsl:value-of select="//page/qd/screenlabels[@id=563]/@label"/>*
                <!--Designer-->
              </xsl:if>
              <xsl:if test="//page/qd/isqdlite">
                <span class="labeldata">
                <xsl:value-of select="//page/qd/distsalespeople/@name"/>
                </span>
              </xsl:if>
              <xsl:if test="//page/qd[distributorselected and not(maynotcreatesalespersons)]">
                <span class="plusbox" title="Add new salesperson">
                  <xsl:attribute name="onclick">
                    $("#divnewsalesperson").addClass("active");
                    $(".popup-overlay").addClass("active")
                  </xsl:attribute>
                </span>

              </xsl:if>             
            </label>

              <select name='data_salespersonid' id='data_salespersonid'>
                <xsl:if test="//page/qd/isqdlite">
                  <xsl:attribute name="style">display:none;</xsl:attribute>
                </xsl:if>
                <xsl:for-each select="//page/qd/distsalespeople">
                  <option>
                    <xsl:attribute name="value">
                      <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:if test="@selected">
                      <xsl:attribute name="selected">true</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="@name"/>
                  </option>
                </xsl:for-each>
              </select>
          </div>

          <div class="row">
            <xsl:if test="//page/qd/isqdlite">
              <xsl:attribute name="style">display:none;</xsl:attribute>
            </xsl:if>
            <label>
              <!--Market-->
              <xsl:value-of select="//page/qd/screenlabels[@id='112']/@label"/>
            </label>
            <xsl:if test="//page/qd[isqdlite or partno]">
              <xsl:for-each select="//page/qd/markets">
                <xsl:value-of select="@name"/>
              </xsl:for-each>
            </xsl:if>


            <xsl:if test="//page/qd[not (partno)]">
              <select id="data_marketid" name="data_marketid">
                <xsl:if test="//page/qd/isqdlite">
                  <xsl:attribute name="style">display:none;</xsl:attribute>
                </xsl:if>
                <xsl:for-each select="//page/qd/markets">
                  <option>
                    <xsl:attribute name="title">
                      <xsl:value-of select="@fullname"/>
                    </xsl:attribute>
                    <xsl:attribute name="value">
                      <xsl:value-of select="@id"/>
                    </xsl:attribute>
                    <xsl:value-of select="@code"/>
                  </option>
                </xsl:for-each>
              </select>
            </xsl:if>
          </div>
          <div class="row">
            <label>
              <xsl:if test="//page/qd[not (isqdlite)]">
                <xsl:value-of select="//page/qd/screenlabels[@id='149']/@label"/>
                <!--Customer-->
              </xsl:if>
              <xsl:if test="//page/qd/isqdlite">
                <xsl:value-of select="//page/qd/screenlabels[@id='463']/@label"/>*
                <!--Company Name* -->
              </xsl:if>
            <xsl:if test="//page/qd/isqdlite">
              <span class="labeldata">
                <xsl:value-of select="//page/qd/customers/@name"/>
              </span>
            </xsl:if>
              <xsl:if test="//page/qd[distributorselected and not(maynotcreatecustomers)]">
                <span class="plusbox" title="Create new customer">
                  <xsl:attribute name="onclick">
                    $("#divnewcustomer").addClass("active");
                    $(".popup-overlay").addClass("active")
                  </xsl:attribute>
                </span>
              </xsl:if>
            </label>

            <select id="data_customerid" name="data_customerid">
              <xsl:if test="//page/qd/isqdlite">
                <xsl:attribute name="style">display:none;</xsl:attribute>
              </xsl:if>
              <xsl:for-each select="//page/qd/customers">
                <option>
                  <xsl:attribute name="value">
                    <xsl:value-of select="@id"/>
                  </xsl:attribute>
                  <xsl:if test="@selected='1'">
                    <xsl:attribute name="selected">true</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@name"/>
                </option>
              </xsl:for-each>
            </select>
          </div>
          <div class="row">
            <label>
              <xsl:value-of select="//page/qd/screenlabels[@id='110']/@label"/>*
              <!--Est. Annual Usage-->
            </label>
            <input type="text" id="data_estannualusage" name="data_estannualusage"
                   maxlength="5">
              <xsl:attribute name="value">
                <xsl:value-of select="//page/qd/estannualusage"/>
              </xsl:attribute>
            </input>
          </div>

              <div class="row">
                <label>
                  <xsl:value-of select="//page/qd/screenlabels[@id=587]/@label"/>
                  <!--Reference-->
                  <!--
                  
                  <xsl:if test="//page/qd[not (isqdlite)]">
                    <xsl:value-of select="//page/qd/screenlabels[@id='116']/@label"/>
                    Reference No.
                  </xsl:if>
                  <xsl:if test="//page/qd/isqdlite">
                    <xsl:value-of select="//page/qd/screenlabels[@id='467']/@label"/>
                    Customer/Model 
                  </xsl:if>
                  -->
                </label>
                <input type="text" id="data_distrefno" name="data_distrefno" maxlength="60">
                  <!--
                <xsl:attribute name="onmouseover">
                  $("#distrefnomenu").toggle("fast");

                </xsl:attribute>
                -->
                  <xsl:attribute name="value">
                    <xsl:value-of select="//page/qd/quote/@distrefno"/>
                  </xsl:attribute>
                </input>
                <div class="ctypemenu">
                  <xsl:attribute name="id">distrefnomenu</xsl:attribute>
                  <xsl:attribute name="name">distrefnomenu</xsl:attribute>
                  <div class="ctypemenuinner">
                    <xsl:for-each select="//page/qd/distrefno">
                      <div class="ctypemenuitem">
                        <xsl:if test="@isclose">
                          <xsl:attribute name="style">font-size:85%;</xsl:attribute>
                        </xsl:if>
                        <xsl:if test="not(@isclose)">
                          <img src="images/arrow.gif"/>
                        </xsl:if>
                        <a class="ctypemenuitem" style="cursor:pointer;">
                          <xsl:attribute name="onclick">
                            <xsl:if test="not(@isclose)">
                              document.getElementById("data_distrefno").value='<xsl:value-of select="@name"/>';
                            </xsl:if>
                            document.getElementById("distrefnomenu").style.display="none"
                          </xsl:attribute>
                          <xsl:value-of select="@label"/>
                        </a>
                      </div>
                    </xsl:for-each>
                  </div>
                </div>
              </div>
           
            <div class="row">
                <label>
                  <xsl:value-of select="//page/qd/screenlabels[@id=588]/@label"/>
                  <!--Your Part Number (available for stamping on manifold)-->
                  <!--
                  <xsl:if test="//page/qd[not (isqdlite)]">
                    <xsl:value-of select="//page/qd/screenlabels[@id='106']/@label"/>
                    Customer Part No.
                  </xsl:if>
                  <xsl:if test="//page/qd/isqdlite">
                    <xsl:value-of select="//page/qd/screenlabels[@id='477']/@label"/>
                    Part No.
                  </xsl:if>
                  -->
                </label>
                <input type="text" id="data_custpartno" name="data_custpartno" maxlength="40">
                  <!--
                <xsl:attribute name="onmouseover">
                  $("#custpartnomenu").toggle("fast");
                </xsl:attribute>
                -->
                  <xsl:attribute name="value">
                    <xsl:value-of select="//page/qd/quote/@custpartno"/>
                  </xsl:attribute>
                </input>
                <div class="ctypemenu">
                  <xsl:attribute name="id">custpartnomenu</xsl:attribute>
                  <xsl:attribute name="name">custpartnomenu</xsl:attribute>
                  <div class="ctypemenuinner">
                    <xsl:for-each select="//page/qd/custpartno">
                      <div class="ctypemenuitem">
                        <xsl:if test="@isclose">
                          <xsl:attribute name="style">font-size:85%;</xsl:attribute>
                        </xsl:if>
                        <xsl:if test="not(@isclose)">
                          <img src="images/arrow.gif"/>
                        </xsl:if>
                        <a class="ctypemenuitem" style="cursor:pointer;">

                          <xsl:attribute name="onclick">
                            <xsl:if test="not(@isclose)">
                              document.getElementById("data_custpartno").value='<xsl:value-of select="@name"/>';
                            </xsl:if>
                            document.getElementById("custpartnomenu").style.display="none"
                          </xsl:attribute>
                          <xsl:value-of select="@label"/>
                        </a>
                      </div>
                    </xsl:for-each>
                  </div>
                </div>
              </div>

            <div class="row">
              <label>
                <xsl:value-of select="//page/qd/screenlabels[@id=589]/@label"/>
                <!--Drawing Title-->
              </label>
              <input type="text" id="data_drawingtitle" name="data_drawingtitle"
                     maxlength="70">
                <xsl:attribute name="value">
                  <xsl:value-of select="//page/qd/quote/@drawingtitle"/>
                </xsl:attribute>
              </input>
            </div>            
            
            <div class="row">
            <label>
              <xsl:value-of select="//page/qd/screenlabels[@id='462']/@label"/>
              <!-- Comments-->
            </label>
            <div class="celledit" valign="top">
              <textarea id="data_comments"
                  name="data_comments"
                  onkeyup="autogrowtextarea('data_comments');">
                <xsl:value-of
                    select="//page/qd/quote/@comments"/>
              </textarea>

            </div> 
          </div>
          <xsl:if test="//page/qd[quoteid='0']">
            <div class="row">
              <label>
                <xsl:value-of select="//page/qd/screenlabels[@id='473']/@label"/>*
                <!-- Manifold Material*-->
              </label>

                <select id="data_materialid" name="data_materialid">
									<xsl:attribute name="onchange">
										var $el = $('#data_coatingid');
										var thisval = this.value;
										$el.empty();
										<xsl:for-each select="//page/qd/coatings">
											if (thisval=='<xsl:value-of select="@materialid"/>'){
												$el.append($('&lt;option&gt;&lt;/option&gt;').attr('value', '<xsl:value-of select="@coatingid"/>').text('<xsl:value-of select="@coating"/>'));
											}
										</xsl:for-each>
									
									</xsl:attribute>
                  <xsl:for-each select="//page/qd/material">
                    <option>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:value-of select="@name"/>
                    </option>
                  </xsl:for-each>
                </select> 
            </div>
						<div class="row">
							<label>
								<xsl:value-of select="//page/qd/screenlabels[@id='602']/@label"/>
								<!-- Coating-->
							</label>
							<select id="data_coatingid" name="data_coatingid">
								<xsl:for-each select="//page/qd/coatings[@selected]">
									<option>
										<xsl:attribute name="value">
											<xsl:value-of select="@coatingid"/>
										</xsl:attribute>
										<xsl:value-of select="@coating"/>
									</option>
								</xsl:for-each>
							</select>
						</div>
						
          </xsl:if>
          <xsl:if test="//page/qd/showeq">
            <div class="row">
              <label>
                <xsl:value-of select="//page/qd/screenlabels[@id='109']/@label"/>
                <!--EQ Number-->
              </label>
                <input type="text" id="data_eqnumber" name="data_eqnumber" maxlength="20">
                  <xsl:attribute name="value">
                    <xsl:value-of select="//page/qd/quote/@eqnumber"/>
                  </xsl:attribute>
                </input>
            </div>
          </xsl:if>
          </div>
        </div>

        <div id="screenmessage" class="speechbubble nodisplay">
        </div>
        <xsl:if test="//page/qd/partno">
          <div class="displayboxtext">

          </div>
        </xsl:if>


        <div>
          <xsl:if test="//page/qd/mayedit">

            <xsl:if test="//page/qd[quoteid='0']">
              <input type="button" id="cmdpage1create" class="button bg--orange small" value="Create">
                <xsl:attribute name="onclick">javascript:page1save(1);</xsl:attribute>
              </input>
            </xsl:if>
            <xsl:if test="//page/qd[quoteid &gt; '0']">
              <input type="button" class="button bg--orange small" id="cmdpage1save" name="cmdpage1save"
                    value="Save">
                <xsl:attribute name="onclick">javascript:page1save(2);</xsl:attribute>

              </input>
            </xsl:if>
          </xsl:if>
          
        </div>

        <xsl:if test="//page/qd[not (mayedit)]">
          <br/>
          <div class="errormessage">
            <xsl:value-of select="//page/qd/screenlabels[@id='476']/@label"/>*
            <a class="abuttonul">
              <xsl:attribute name="href">
                default.aspx?page=home&amp;quoteid=<xsl:value-of select="//page/qd/qsummary/@quoteid"/>
              </xsl:attribute>
              <xsl:value-of select="//page/qd/screenlabels[@id='370']/@label"/>
              <!--Go-->
            </a>
            <!-- Note: The design may not be edited. Refer to the <a class="abuttonul">
								<xsl:attribute name="href">manage.aspx?page=2&amp;quoteid=<xsl:value-of select="//page/qd/qsummary/@quoteid"/></xsl:attribute>
								Project Manager</a> page for more information.	 *-->

          </div>
        </xsl:if>


        <xsl:if test="//page/errormessage">
          <div class="errormessage">
            <xsl:value-of select="//page/errormessage"/>
          </div>
        </xsl:if>
      </xsl:if>
      <div id="divnewsalesperson" class="popup small ">
        <div class="content pad grid content--wrapper">
          <h3 for="#">New Salesperson</h3>
          <div class="row">
            <label for="data_newspfirst">First Name</label>
            <input id="data_newspfirst" name="data_newspfirst"/>
          </div>
          <div class="row">
            <label for="data_newspfirst">Last Name</label>
            <input id="data_newsplast" name="data_newsplast"/>
          </div>
          <div class="nowrap">
            <input type="button" class="button bg--orange smallbutton" value="Create">
              <xsl:attribute name="onclick">
                
                if($('#data_newspfirst').val()==""
                || $('#data_newsplast').val()==""){
                showstickymessage(this,"Enter a first and last name...",1 );

                return 0;
                }
                $('#data_action').val("newsalesperson");
                submitit();
              </xsl:attribute>
            </input>
            <input type="button" class="button bg--orange smallbutton" value="Close">
              <xsl:attribute name="onclick">
                $("#divnewsalesperson").removeClass("active");
                $(".popup-overlay").removeClass("active")
              </xsl:attribute>            
            </input>            
          </div>

        </div>
      </div>
      <div id="divnewcustomer" class="popup small ">
        <div class="content pad grid content--wrapper">
          <h3 for="#">New Customer</h3>
          <div class="row">
            <label for="data_newcustomer">Name</label>
            <input id="data_newcustomer" name="data_newcustomer"/>
          </div>
          <div class="nowrap">
            <input type="button" class="button bg--orange smallbutton" value="Create">
              <xsl:attribute name="onclick">
                if($("#data_newcustomer").val()==""){
                showmessage("Enter a customer name...",1 );
                return 0;
                }
                showmessage("Please wait...",1 );
                $("#data_action").val("newcustomer");
                submitit();
              </xsl:attribute>
            </input>
            <input type="button" class="button bg--orange smallbutton" value="Close">
              <xsl:attribute name="onclick">
                $("#divnewcustomer").removeClass("active");
                $(".popup-overlay").removeClass("active")
              </xsl:attribute>
            </input>
          </div>
         </div>
       </div>
      <div id="divshownavigate" class="popup">
          <div class="content pad grid content--wrapper">
            <h2 class="blocktitle divnavtitle">
            <xsl:value-of select="//page/qd/editpath[@id=0]/@smessage"/>
              <!--Select a design option below--></h2>
            <div class="nowrap">
              <table class="tableeditpath">
                <tr>
                  <td>
                      <xsl:value-of select="//page/qd/editpath[@id=1]/@smessage"/>
                  </td>
                   <td>
                     <xsl:value-of select="//page/qd/editpath[@id=2]/@smessage"/>
                </td>
                </tr>
                 <tr>
                  <td>
                    <a class="button bg--blue">
                      <xsl:attribute name="href">
                        <xsl:value-of select="//page/qd/linkpaths[@path=1]/@url"/>
                      </xsl:attribute>
                      <xsl:value-of select="//page/qd/screenlabels[@id=581]/@label"/>
                      <!--Schematic-->
                    </a>
                  </td>
                   <td>
                    <a class="button bg--blue">
                      <xsl:attribute name="href">
                        <xsl:value-of select="//page/qd/linkpaths[@path=2]/@url"/>
                      </xsl:attribute>
                      <xsl:value-of select="//page/qd/screenlabels[@id=590]/@label"/>
                      <!--Configure-->
                    </a>
                </td>
                </tr>             
              </table>

            </div>
          </div>
        </div>   

    </div>
    <div class="popup-overlay "></div>
    <xsl:if test="//page/qd/shownavigate">
      <script>
      <![CDATA[
        $("#divshownavigate").addClass("active");
        $(".popup-overlay").addClass("active")

			]]>
    </script>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
