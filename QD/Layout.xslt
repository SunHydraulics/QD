<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="cross.xslt"/>
  <xsl:variable name="hcross">
    <xsl:call-template name="cross"/>
  </xsl:variable>
  <xsl:template match="/">

    <input type="hidden" id="action" name="action"/>
    <input type="hidden" id="crossdrill" name="crossdrill"/>
    <input type="hidden" id="thisqcircuitid" name="thisqcircuitid"/>
    <input type="hidden" id="thisstampoption" name="thisstampoption"/>
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <section class="block bottom-space grid">
          <div class="notifications-wrapper">
            <xsl:for-each select="//page/qd/usermessages">
              <a class="notification alert pad-half" title="Go">
                <xsl:attribute name="href">
                  <xsl:value-of select="@linkhref"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="@linklabel"/>
                </xsl:attribute>
                <xsl:if test="@linkclick">
                  <xsl:attribute name="onclick">
                    <xsl:value-of select="@linkclick" disable-output-escaping="yes"/>
                  </xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@smessage" disable-output-escaping="yes"/>
                <xsl:if test="@linkhref">
                  <span class="arrow">
                    <xsl:value-of select="@linklabel"/> &#10141;
                  </span>
                </xsl:if>
              </a>
            </xsl:for-each>
          </div>
        </section>
        <!--
don't forget the double dash in bg light
        <section class="bg-light-grey pad block bottom-space grid">
          <h2 class="block-title no-bottom-space">
            <xsl:value-of select="//page/qd/parts/@partno"/>
          </h2>
        </section>
-->
        <div id="screenmessage" class="notecard nodisplay"></div>
        <xsl:if test="//page/qd/validationflags[@maysubmittoar='notnow']">
          <section class="block bottom-space grid lightborder">
            <div class="grid bg--light-grey pad bottom-space">
              <h4 class="block-title">This design may be submitted</h4>
              <p>
                <xsl:value-of select="//page/qd/screenlabels[@id=382]/@label"/>
              </p>
              <a id="submittoar" href="#" class="button bg--blue">

                Submit Design
              </a>
            </div>
          </section>
        </xsl:if>
        <section class="block bottom-space grid">
          <div class="col-3-5">

            <form class="grid bg--light-grey pad bottom-space">
              <a id="facedesignationanchor"/>
              <h4 class="block-title">
                <xsl:value-of select="//page/qd/screenlabels[@id=604]/@label"/>
                <!--Face Designations-->
              </h4>

              <div class="row bottom-space-double">
                <label for="category">
                  <xsl:value-of select="//page/qd/screenlabels[@id='491']/@label"/>:
                  <!--The mounting face is -->
                </label>
                  <input type="hidden" id="txtmountingface"/>
                   <xsl:for-each select="//page/qd/faceconst">
                      <input type="radio" class="radiomountingface">
                        <xsl:attribute name="id">lstmf<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:attribute name="name">lstmf</xsl:attribute>
                        <xsl:attribute name="value"><xsl:value-of select="@findex"/></xsl:attribute>
                          <xsl:attribute name="onclick">
                          $(".waitmodal").show();  
                          this.value='<xsl:value-of select="@findex"/>';
                          faceconadj('m','<xsl:value-of select="@findex"/>');
                        </xsl:attribute>
                        <xsl:if test="@ismountingface='1'">
                          <xsl:attribute name="checked">true</xsl:attribute>
                        </xsl:if>
                      </input>
                        <span><xsl:value-of select="@label"/></span>
                      
                  </xsl:for-each>


              <!--
                <select id="lstmf" name="lstmf">
                  <xsl:attribute name="onchange">
                    faceconadj('m',this.value);
                  </xsl:attribute>
                  <xsl:for-each select="//page/qd/faceconst">
                    <option>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@findex"/>
                      </xsl:attribute>
                      <xsl:if test="@ismountingface='1'">
                        <xsl:attribute name="selected">true</xsl:attribute>
                      </xsl:if>
                      <xsl:value-of select="@label"/>
                    </option>
                  </xsl:for-each>
                </select>
              -->
              </div>

              <div class="row bottom-space-double">
                <label for="working-ports">
                  <xsl:value-of select="//page/qd/screenlabels[@id='171']/@label"/>:
                  <!-- Cartridges are NOT allowed on-->
                </label>
                <ul class="horizontal-list">
                  <xsl:for-each select="//page/qd/faceconst">
                    <li>
                      <input type="checkbox">
                        <xsl:attribute name="id">chkfc<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:attribute name="name">chkfc<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:attribute name="onclick">
                          this.value=this.checked;
                          $(".waitmodal").show();
                          faceconadj('c','<xsl:value-of select="@findex"/>');
                        </xsl:attribute>
                        <xsl:if test="@isfreeofvalves='1'">
                          <xsl:attribute name="checked">true</xsl:attribute>
                        </xsl:if>
                      </input>
                      <label>
                        <xsl:attribute name="for">chkfc<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:value-of select="@label"/>
                      </label>
                    </li>
                  </xsl:for-each>

                </ul>
              </div>

              <div class="row">
                <label for="category">
                  <xsl:value-of select="//page/qd/screenlabels[@id='188']/@label"/>:
                  <!-- Working ports are NOT allowed on-->
                </label>
                <ul class="horizontal-list">
                  <xsl:for-each select="//page/qd/faceconst">
                    <li>
                      <input type="checkbox">
                        <xsl:attribute name="id">chkfp<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:attribute name="name">chkfp<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:attribute name="onclick">
                          $(".waitmodal").show();
                          this.value=this.checked;
                          faceconadj('p','<xsl:value-of select="@findex"/>');
                        </xsl:attribute>
                        <xsl:if test="@isfreeofports='1'">
                          <xsl:attribute name="checked">true</xsl:attribute>
                        </xsl:if>
                      </input>
                      <label>
                        <xsl:attribute name="for">
                          chkfp<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:value-of select="@label"/>
                      </label>
                    </li>
                  </xsl:for-each>

                </ul>
              </div>
            </form>

            <div class="bg--light-grey pad-half lightborder">
              <div class="cartplacementmessage">
              <xsl:value-of select="//page/qd/cartmessage/@cartmessage"/>
              </div>
              <xsl:if test="//page/qd[not (hideconfig)]">
             <h4 class="block-title">
               <xsl:value-of select="//page/qd/screenlabels[@id=605]/@label"/>
               <!--Cartridge Placement-->
             </h4>
              <table class="table bottom-space">
                <thead>
                  <tr>
                    <th colspan="1">
                      <xsl:value-of select="//page/qd/screenlabels[@id='170']/@label"/>
                      <!-- Cartridges-->
                    </th>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id='177']/@label"/>
                      <!--Faces -->
                    </th>
                    <th class="tx--center">
                      <xsl:value-of select="//page/qd/screenlabels[@id='183']/@label"/>
                      <!-- Options-->
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="//page/qd/features[@iscavity='1']">
                    <tr>
                      <td>
                        <xsl:value-of select="@partno"/>
                        <xsl:value-of select="@ext"/><xsl:value-of select="@pilot"/>

                        <span class="grayitalic">
                          
                          (<xsl:if test="@iscrossdrillfor">(cross drill)</xsl:if><xsl:value-of select="@stamp"/>)
                        </span>
                      </td>
                      <td>
                        <img src="images/plusbox.gif" style="cursor:hand">
                          <xsl:attribute name="onclick">
                            <xsl:if test="@iscrossdrillfor">
                              smess='<xsl:value-of select="//page/qd/screenlabels[@id=402]/@label"/>';
                              //<!--The cross-drill valve placement is automatically controlled. -->
                              alert(smess);
                              return 0;
                            </xsl:if>
                            sdiv=document.getElementById("div<xsl:value-of select="@qcircuitid"/>");
                            showhideimg(this,sdiv);
                          </xsl:attribute>
                        </img>

                        <xsl:if test="current()[not (@placementindex)]">
                          Any
                          <!--<xsl:value-of select="//page/qd/screenlabels[@id='371']/@label"/>-->
                          <!-- Any allowable  -->

                        </xsl:if>
                        <xsl:if test="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid]">
                          <font class="accentfont">
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @selected='1']">
                              <xsl:value-of select="@label"/> .
                            </xsl:for-each>
                          </font>
                        </xsl:if>
                        <span>
                          <xsl:attribute name="id">div<xsl:value-of select="@qcircuitid"/>
                          </xsl:attribute>
                          <xsl:attribute name="name">div<xsl:value-of select="@qcircuitid"/>
                          </xsl:attribute>
                          <xsl:attribute name="style">display:none</xsl:attribute>
                          <ul class="horizontal-list">
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @isfreeofvalves='0']">
                              <li>
                                <input type="checkbox">
                                  <xsl:attribute name="id">data_comp<xsl:value-of select="@qcircuitid"/>_<xsl:value-of select="@findex"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="name">data_comp<xsl:value-of select="@qcircuitid"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="onchange">
                                  getplacementindex('<xsl:value-of select="@qcircuitid"/>');
                                  </xsl:attribute>
                                  <xsl:attribute name="onclick">
                                    <xsl:if test="@iscrossdrillfor">
                                      smess='<xsl:value-of select="//page/qd/screenlabels[@id=402]/@label"/>';
                                      //<!--The cross-drill valve placement is automatically controlled. -->
                                      alert(smess);
                                      return 0;
                                    </xsl:if>

                                    //showsave();
                                  </xsl:attribute>
                                  <xsl:attribute name="value">
                                    <xsl:value-of select="@findex"/>
                                  </xsl:attribute>
                                  <xsl:if test="@selected='1'">
                                    <xsl:attribute name="checked">true</xsl:attribute>
                                  </xsl:if>
                                </input>
                                <label>
                                  <xsl:attribute name="for">
                                    data_comp<xsl:value-of select="@qcircuitid"/>
                                  </xsl:attribute>
                                  <xsl:value-of select="@label"/>
                                </label>

                              </li>
                            </xsl:for-each>
                          </ul>
                        </span>

                      </td>
                      <td class="tx--center">
                        <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp]/@dia">
                          <!-- 
                    <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)] ">
                    -->
                          <img src="images/plusbox.gif" style="cursor:hand">
                            <xsl:attribute name="onclick">
                              <xsl:if test="@iscrossdrillfor or @hascrossdrill">
                                smess='<xsl:value-of select="//page/qd/screenlabels[@id=490]/@label"/>';
                                //<!--The cross-drill clearance sizing is automatically controlled. -->
                                alert(smess);
                                return 0;
                              </xsl:if>
                              sdiv=document.getElementById('divclearance<xsl:value-of select="@qcircuitid"/>');
                              showhideimg(this,sdiv);
                            </xsl:attribute>
                          </img>
                          <!-- 
                    </xsl:if>
                    -->
                          <xsl:if test="@showclearancealert='1'">
                            <div>
                            <img class="envalert" src="images/alert.png" style="cursor:pointer;width:20%">
                              <xsl:attribute name="title"></xsl:attribute>
                               <xsl:attribute name="onclick">
                              sdiv='#divclearance<xsl:value-of select="@qcircuitid"/>';
                              $(sdiv).toggle();

                            </xsl:attribute>
                            </img>     
                            </div>
                          </xsl:if>
                          <span>
                            <xsl:attribute name="id">divclearance<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>
                            <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)]">
                              <xsl:attribute name="style">display:none;</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="//page/qd/screenlabels[@id='374']/@label"/> (in.)
                            <!--Clearance -->
                            <input class="inputclearance">
                              <xsl:attribute name="id">cdia<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:attribute name="name">cdia<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:attribute name="title">
                                <xsl:value-of select="//page/qd/screenlabels[@id='384']/@label"/>
                                <!--Enter a value here to create a clearance larger than the diameter shown below -->
                              </xsl:attribute>
                              <xsl:attribute name="onblur">
                                if(validateclearance(this,'<xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/>')){
                                  loadXMLDoc("qd_featureclearance", this);
                                }
                              </xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@envclearance"/>
                              </xsl:attribute>
                            </input><br/>
                            (<xsl:value-of select="//page/qd/screenlabels[@id='489']/@label"/>:
                            <!--Std-->
                            <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/> dia)
                          <xsl:if test="@showclearancealert='1'">
                            <div class="popupmessage">Check component footprint. Extra clearance may be required.</div>
                          </xsl:if> 
                          </span>
 
                        </xsl:if>
                      </td>
                    </tr>

                  </xsl:for-each>

                </tbody>
              </table>
              <h4 class="block-title">
                <xsl:value-of select="//page/qd/screenlabels[@id=606]/@label"/>
                <!--Port Placement-->
              </h4>
              <table class="table bottom-space">
                <thead>
                  <tr>
                    <th colspan="1">
                      <xsl:value-of select="//page/qd/screenlabels[@id='185']/@label"/>
                      <!--Ports -->
                    </th>
                    <th>
                      <xsl:value-of select="//page/qd/screenlabels[@id='177']/@label"/>
                      <!--Faces -->
                    </th>
                    <th class="tx--center">
                      <xsl:value-of select="//page/qd/screenlabels[@id='183']/@label"/>
                      <!-- Options-->
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="//page/qd/features[@iscavity='0']">
                    <tr>
                      <td>
                        <xsl:value-of select="@qqlabel"/>
                        <span class="grayitalic">
                          (<xsl:value-of select="@stamp"/>)
                        </span>
                      </td>
                      <td>
                        <img src="images/plusbox.gif" style="cursor:hand">
                          <xsl:attribute name="onclick">
                            <xsl:if test="@iscrossdrillfor">
                              smess='<xsl:value-of select="//page/qd/screenlabels[@id=402]/@label"/>';
                              //<!--The cross-drill valve placement is automatically controlled. -->
                              alert(smess);
                              return 0;
                            </xsl:if>
                            sdiv=document.getElementById("div<xsl:value-of select="@qcircuitid"/>");
                            showhideimg(this,sdiv);
                          </xsl:attribute>
                        </img>

                        <xsl:if test="current()[not (@placementindex)]">
                          <xsl:value-of select="//page/qd/screenlabels[@id=607]/@label"/>
                          <!--Any-->
                          </xsl:if>
                        <xsl:if test="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid]">
                          <font class="accentfont">
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @selected='1']">
                              <xsl:value-of select="@label"/> .
                            </xsl:for-each>
                          </font>
                        </xsl:if>
                        <span>
                          <xsl:attribute name="id">div<xsl:value-of select="@qcircuitid"/>
                          </xsl:attribute>
                          <xsl:attribute name="name">div<xsl:value-of select="@qcircuitid"/>
                          </xsl:attribute>
                          <xsl:attribute name="style">display:none</xsl:attribute>
                          <ul class="horizontal-list">
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @isfreeofports='0']">
                              <li>
                                <input type="checkbox">
                                  <xsl:attribute name="id">data_comp<xsl:value-of select="@qcircuitid"/>_<xsl:value-of select="@findex"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="name">data_comp<xsl:value-of select="@qcircuitid"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="onchange">
                                  getplacementindex('<xsl:value-of select="@qcircuitid"/>');
                                  </xsl:attribute>
                                  <xsl:attribute name="onclick">
                                    <xsl:if test="@iscrossdrillfor">
                                      smess='<xsl:value-of select="//page/qd/screenlabels[@id=402]/@label"/>';
                                      //<!--The cross-drill valve placement is automatically controlled. -->
                                      alert(smess);
                                      return 0;
                                    </xsl:if>

                                    //showsave();
                                  </xsl:attribute>
                                  <xsl:attribute name="value">
                                    <xsl:value-of select="@findex"/>
                                  </xsl:attribute>
                                  <xsl:if test="@selected='1'">
                                    <xsl:attribute name="checked">true</xsl:attribute>
                                  </xsl:if>
                                </input>
                                <label>
                                  <xsl:attribute name="for">
                                    data_comp<xsl:value-of select="@qcircuitid"/>_<xsl:value-of select="@findex"/>
                                  </xsl:attribute>
                                  <xsl:value-of select="@label"/>
                                </label>
                              </li>
                            </xsl:for-each>
                          </ul>
                        </span>

                      </td>
                      <td class="tx--center">
                        <xsl:if test="@issuperfeature">
                          <xsl:if test="//page/qd[not (showisorotate)]">
                            <xsl:value-of select="//page/qd/screenlabels[@id='488']/@label"/>
                            <!--Rotate CCW -->
                          </xsl:if>
                          <xsl:if test="//page/qd/showisorotate">
                            <xsl:value-of select="//page/qd/screenlabels[@id='488']/@label"/>
                            <br/>
                            <a class="tx--orange underline" href="#">
                              <xsl:attribute name="onclick">
                                $('#imgrotimg').attr('src','images/<xsl:value-of select="@rotimg"/>');
                                $('#divisorotate').css('width','1000px');
                                $('#divisorotate').css('left','20%');
                                $('#divisorotate').addClass('active');
                                $('.popup-overlay').addClass('active');
                                return false;
                              </xsl:attribute>
                              See example
                            </a>
                          </xsl:if>
                          <select class="formtext" size="1">
                            <xsl:attribute name="id">data_interfacerot<xsl:value-of select="@qcircuitid"/></xsl:attribute>
                            <xsl:attribute name="name">data_interfacerot<xsl:value-of select="@qcircuitid"/></xsl:attribute>
                            <xsl:attribute name="onchange">
                              loadXMLDoc("qd_featurerot", this);
                            </xsl:attribute>
                            <xsl:for-each select="//page/qd/interfacerotangles[@angle = current()/@interfacerot]">
                              <option>
                                <xsl:attribute name="selected">true</xsl:attribute>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="@angle"/>
                                </xsl:attribute>
                                <xsl:value-of select="@angle"/>
                              </option>
                            </xsl:for-each>
                            <xsl:for-each select="//page/qd/interfacerotangles">
                              <option>
                                <xsl:attribute name="value">
                                  <xsl:value-of select="@angle"/>
                                </xsl:attribute>
                                <xsl:value-of select="@angle"/>
                              </option>
                            </xsl:for-each>
                          </select>
                        </xsl:if>
                        
                        
                        <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp]">
                          <!-- 
                    <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)] ">
                    -->
                          <img src="images/plusbox.gif" style="cursor:hand">
                            <xsl:attribute name="onclick">
                              sdiv=document.getElementById("divclearance<xsl:value-of select="@qcircuitid"/>");
                              showhideimg(this,sdiv);
                            </xsl:attribute>
                          </img>
                          <!-- 
                    </xsl:if>
                    -->

                          <span>
                            <xsl:attribute name="id">divclearance<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>

                            <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)]">
                              <xsl:attribute name="style">display:none;</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="//page/qd/screenlabels[@id='374']/@label"/> (in.)
                            <!--Clearance -->
                            <input class="inputclearance">
                              <xsl:attribute name="id">cdia<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:attribute name="name">cdia<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:attribute name="title">
                                <xsl:value-of select="//page/qd/screenlabels[@id='384']/@label"/>
                                <!--Enter a value here to create a clearance larger than the diameter shown below -->
                              </xsl:attribute>
                              <xsl:attribute name="onblur">
                                if(validateclearance(this,'<xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/>')){
                                  loadXMLDoc("qd_featureclearance", this);
                                }
                              </xsl:attribute>
                              <xsl:attribute name="value">
                                <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@envclearance"/>
                              </xsl:attribute>
                            </input><br/>
                            (<xsl:value-of select="//page/qd/screenlabels[@id='489']/@label"/>:
                            <!--Std-->
                            <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/> dia)
                          </span>
                        </xsl:if>
                      </td>
                    </tr>

                  </xsl:for-each>

                </tbody>
              </table>
                <xsl:if test="//page/qd/iscrossdrill">
                  <a id="crosspilotanchor"/>
                  <h4 class="block-title">
                    <xsl:value-of select="//page/qd/screenlabels[@id='549']/@label"/>
                    <!--Cross-Pilot Cavities-->
                  </h4>

                  <div>
                    <xsl:if test="//page/qd/crossdrills">
                      <div>
                        <b><xsl:value-of select="//page/qd/screenlabels[@id='556']/@label"/></b>
                        <!--Selected cavities-->
                        <br/>
                        <xsl:value-of select="//page/qd/screenlabels[@id='555']/@label"/>
                        <!--Press the UnLink button to remove the cross-pilot relationship.-->
                      </div>
                      <table>
                        <xsl:for-each select="//page/qd/crossdrills">
                          <tr class="gridrow">
                            <td class="gridcell">
                              <input type="button">
                                <xsl:attribute name="value">
                                  <xsl:value-of select="//page/qd/screenlabels[@id=557]/@label"/>
                                  <!-- Unlink-->
                                </xsl:attribute>
                                <xsl:attribute name="onclick">
                                  
                                  //smess='<xsl:value-of select="//page/qd/screenlabels[@id=550]/@label"/>';
                                  //if(confirm(smess)==false){
                                  //return 0;
                                  //}
                                  document.getElementById("crossdrill").value="<xsl:value-of select="@qcircuitid"/>_<xsl:value-of select="@childid"/>";
                                  document.getElementById("action").value="removecrossdrill";
                                  submititanchor("crosspilotanchor");
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="divnowrap">
                              <xsl:value-of select="@stamp"/>
                            </td>
                            <td>
                              <img src="images/crosspilot.png" style="width:100%;"/>
                            </td>
                            <td class="divnowrap">
                              <xsl:value-of select="@childstamp"/>
                            </td>
                          </tr>
                        </xsl:for-each>
                      </table>
                      <br/>
                    </xsl:if>

                    <xsl:if test="//page/qd/maybecrossdrills">
                      <div >
                        <b> <xsl:value-of select="//page/qd/screenlabels[@id=553]/@label"/></b>
                        <!--Possible Pairs-->
                        <br/>
                        <xsl:value-of select="//page/qd/screenlabels[@id=554]/@label"/>
                        <!--Press the Link button to create a cross-pilotpair.-->
                      </div>
                      <table>
                        <xsl:for-each select="//page/qd/maybecrossdrills">
                          <tr class="gridrow">
                            <td class="gridcell">
                              <input type="button">
                                <xsl:attribute name="value">
                                  <xsl:value-of select="//page/qd/screenlabels[@id=551]/@label"/>
                                  <!-- Link-->
                                </xsl:attribute>
                                <xsl:attribute name="onclick">
                                  //If you have any unsaved changes above, cancel this operation and save the changes first. Continue?
                                  //smess='<xsl:value-of select="//page/qd/screenlabels[@id=550]/@label"/>';
                                  //if(confirm(smess)==false){
                                  //return 0;
                                  //}
                                  document.getElementById("crossdrill").value="<xsl:value-of select="@qcircuitid"/>_<xsl:value-of select="@childid"/>";
                                  document.getElementById("action").value="savecrossdrill";
                                  submititanchor("crosspilotanchor");
                                </xsl:attribute>
                              </input>
                            </td>
                            <td class="divnowrap">
                              <xsl:value-of select="@stamp"/>
                            </td>
                            <td>
                              <img src="images/notcrosspilot.png" style="width:100%;"/>
                            </td>
                            <td class="divnowrap">
                              <xsl:value-of select="@childstamp"/>
                            </td>
                          </tr>
                        </xsl:for-each>
                      </table>
                    </xsl:if>
                  </div>
                </xsl:if>
              
              </xsl:if>
            </div>

          </div>
          <!-- col-1-2 -->

          <div class="col-2-5">
            <div class="bg--light-grey pad bottom-space lightborder">
              <xsl:copy-of select="$hcross"/>
            </div>
            <div class="bg--light-grey pad bottom-space lightborder">
              <h4 class="block-title">
                <xsl:value-of select="//page/qd/screenlabels[@id='174']/@label"/>
                <!--Construction Ports -->
              </h4>
              <ul class="vertical-list">
                <xsl:for-each select="//page/qd/constports">
                  <li >
                    <xsl:attribute name="title">
                      <xsl:value-of select="@drawingnote"/>
                    </xsl:attribute>
                    <input type="radio">
                      <xsl:attribute name="name">data_cport</xsl:attribute>
                      <xsl:attribute name="id">data_cport<xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="onclick">
                      loadXMLDoc("qd_constructionport", this);
                        </xsl:attribute>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:if test="@selected">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                    </input>
                    <label>
                      <xsl:attribute name="for">
                        data_cport<xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:value-of select="@name"/>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>
            </div>
            <div class="bg--light-grey pad bottom-space lightborder">
              <a id="mountingholeanchor"/>
              <h4 class="block-title">
                <xsl:value-of select="//page/qd/screenlabels[@id='182']/@label"/>
                <!--Mounting Holes -->
              </h4>
              <ul class="vertical-list">
                <xsl:for-each select="//page/qd/mh">
                  <li>
                    <xsl:if test="current()[@visible='0']">
                      <xsl:attribute name="style">display:none;</xsl:attribute>
                    </xsl:if>
                    <input type="radio" name="data_mountinghole">
                      <xsl:attribute name="id">data_mountinghole<xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="onclick">
                       $(".waitmodal").show();
                      loadXMLDoc("qd_mountinghole", this);
                       
                      </xsl:attribute>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:if test="current()[@active='0']">
                        <xsl:attribute name="disabled">true</xsl:attribute>
                      </xsl:if>
                      <xsl:if test="//page/qd/partconst[@settingid='8'][@quotesetting=current()/@id]">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                    </input>
                    <label>
                      <xsl:attribute name="for">
                        data_cport<xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:value-of select="@name"/>
                    </label>
                  </li>
                </xsl:for-each>
                <xsl:if test="//page/qd/liftingeyes">
                  <li>
                    <input type="checkbox" id="chkisle" name="chkisle">
                     <xsl:if test="//page/qd/liftingeyes[@withoption='1']">
                      <xsl:attribute name="checked">true</xsl:attribute>
                    </xsl:if>

                    <xsl:attribute name="onchange">
                      this.value="0";
                      if(this.checked){this.value="1"};
                      loadXMLDoc("qd_liftingeyes", this);                   
                    </xsl:attribute>
                    <label for="chkisle"> <xsl:value-of select="//page/qd/screenlabels[@id='726']/@label"/></label>
                    </input>
                  </li>
           
                </xsl:if>
              </ul>
              <xsl:for-each select="//page/qd/cmholes">
                <div>
                  <table>
                    <tr class="gridrow">
                      <td class="gridcell">
                        <xsl:value-of select="//page/qd/screenlabels[@id='391']/@label"/>
                        <!--No. Holes-->
                      </td>
                      <td class="gridcell">
                        <xsl:value-of select="@numholes"/>
                      </td>
                    </tr>
                    <!--
                    <tr class="gridrow">
                      <td class="gridcell">Item</td>
                      <td class="gridcell">
                        <xsl:value-of select="@name"/>
                      </td>
                    </tr>
                    -->
                    <tr class="gridrow">
                      <td class="gridcell" colspan="2">
                        <xsl:value-of select="//page/qd/screenlabels[@id='389']/@label"/>
                        <!-- Mounting hole options may be limited based on the estimated weight of the block-->


                      </td>
                    </tr>

                  </table>

                </div>
              </xsl:for-each>
            </div>
            <div class="bg--light-grey pad bottom-space lightborder">
              <a id="stampanchor"/>
              <h4 class="block-title">
                <xsl:value-of select="//page/qd/screenlabels[@id='168']/@label"/>
                <!--Body Stamping Options -->
              </h4>
              <div style="border:1px solid silver;padding-top:18px;">
                <ul class="vertical-list">
                <xsl:for-each select="//page/qd/stampoptions">
                  <xsl:if test="@lbreak">
                    <br/>
                  </xsl:if>
                  <li style="margin-bottom:12px;">
                   <input type="radio">
                     <xsl:attribute name="name">stamp<xsl:value-of select="@settingid"/></xsl:attribute>
                     <xsl:attribute name="id">stamp<xsl:value-of select="@settingid"/>_<xsl:value-of select="@setting"/></xsl:attribute>
                     <xsl:attribute name="onclick">
                       this.value='<xsl:value-of select="@setting"/>';
                       $(".waitmodal").show();
                       document.getElementById("action").value='stampoption<xsl:value-of select="@settingid"/>';
                       submititanchor("stampanchor");
                     </xsl:attribute>
                     <xsl:if test="@selected">
                       <xsl:attribute name="checked">true</xsl:attribute>
                     </xsl:if>
                    <xsl:value-of select="@display"/>                     
                  </input>                   
                  </li>
                </xsl:for-each>
                </ul>

                <!--
                <xsl:if test="//page/qd/drawingpreview/@isyou">
                  Showing your body stamp preferences. See the Settings page under General Settings: <a class="tx- -orange underline" href="default.aspx?page=settings">Go</a>
                </xsl:if>
                <xsl:if test="//page/qd/drawingpreview[not (@isyou)]">
                  Showing the stamping preferences of the design's creator: <xsl:value-of select="//page/qd/drawingpreview/@createdby"/>. 
                </xsl:if>
                -->
              </div>
              <br/> 
              <div class="gridcell">
                <xsl:value-of select="//page/qd/screenlabels[@id='387']/@label"/>:
                <!--How stamping will appear during QuickDesign:-->
                <div id="divstamppreviewd" class="bodystamppreview">
                  <xsl:value-of select="//page/qd/drawingpreview/@qdstamp" disable-output-escaping="yes"/>
                </div>
              </div>
              <div class="gridcell">
                <br/>
                <xsl:value-of select="//page/qd/screenlabels[@id='486']/@label"/>:
                <!--How stamping will appear if manufactured by Sun:-->
                <div id="divstamppreviews" class="bodystamppreview">
                  <xsl:value-of select="//page/qd/drawingpreview/@qdstamp" disable-output-escaping="yes"/>
                  <xsl:value-of select="//page/qd/drawingpreview/@sunsuffix" disable-output-escaping="yes"/>

                </div>
              </div>
              <div class="bodystampcomment">
                <br/>
                Your stamping preferences are located on the Settings page under General Settings: <a class="tx--orange underline" href="default.aspx?page=settings">Go</a>

              </div>
            </div>
            <xsl:if test="//page/qd/anglepref">
              <div class="bg--light-grey pad bottom-space lightborder">
                <a id="angleprefanchor"/>
                <h4 class="block-title">
                  Angle Hole Capability
                </h4>
                <div class="bodystampcomment">
                  Applies to future QuickDesign submittals of this design only.  
                  <xsl:if test="//page/qd[not (anglepref/@isset)]">
                     See the Settings page under General Settings: <a class="tx--orange underline" href="default.aspx?page=settings">Go</a>
                  </xsl:if>
                  <xsl:if test="//page/qd/anglepref/@isset">
                     (Has been set for this design)
                  </xsl:if>
                </div>
                <ul class="vertical-list">
                  <xsl:for-each select="//page/qd/anglepref">
                    <li>
                      <input type="radio" name="data_anglepref">
                        <xsl:attribute name="id">data_anglepref<xsl:value-of select="@id"/></xsl:attribute>

                        <xsl:attribute name="onclick">
                          loadXMLDoc("qd_anglepref",this)
                        </xsl:attribute>
                        <xsl:attribute name="value">
                          <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:if test="@selected">
                          <xsl:attribute name="checked">true</xsl:attribute>
                        </xsl:if>
                      </input>
                      <label>
                        <xsl:attribute name="for">
                          data_anglepref<xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:value-of select="@name"/>
                      </label>
                    </li>
                  </xsl:for-each>
                </ul>
              </div>
            </xsl:if>
            
          </div>
        </section>
        <!--   remember double dash bg orange
        <section class="pad tx-center ">
          <a href="#" class="button bg-orange">Reset</a>
          <a href="#" class="button bg-orange has-bottom-text left-space" data-top-text="and return to schematic">Safe Preferences</a>
          <a href="#" class="button bg-orange has-bottom-text left-space" data-top-text="and close project">Safe Preferences</a>
        </section>
-->
      </div>
      <!-- .container -->

    </div>
    <!-- page-wrapper -->

    <div id="divisorotate" class="popup">
      <div class="content pad grid content--wrapper">
        <a class="tx--orange underline" href="#">
          <xsl:attribute name="value">
            <xsl:value-of select="//page/qd/screenlabels[@id=71]/@label"/>
            <!--Close-->
          </xsl:attribute>
          <xsl:attribute name="onclick">
            $('#divisorotate').removeClass('active');
            $('.popup-overlay').removeClass('active');
            return false;
          </xsl:attribute>
          Close
        </a>
        <h2 class="blocktitle divnavtitle pad-half">
          <xsl:value-of select="//page/qd/screenlabels[@id=700]/@label"/>
          <!--Pattern Rotation-->
        </h2>
        <div class="divcontainer">
          <div class="divfloat">
            <img id="imgrotimg"></img>
          </div>
          <div class="divfloat">
            <xsl:value-of select="//page/qd/screenlabels[@id=699]/@label"/>
            <!--Rotation applies to each block face as oriented below.-->
            <br/> <br/>
            <xsl:copy-of select="$hcross"/>
            <br/>
            <div>
              <xsl:value-of select="//page/qd/screenlabels[@id=698]/@label"/>
             <!--Note: QuickDesign will increase the manifold size to avoid a
              solenoid extending into the mounting surface plane.--> 
            </div>
          </div>
        </div>
        </div>
      </div>
    <div class="popup-overlay"></div>
    <div class="waitmodal"/>
  </xsl:template>
</xsl:stylesheet>