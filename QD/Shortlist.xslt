<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div class="reporthead">Design <xsl:value-of select="//page/qd/qsummary/@partno"/></div>
        <div class="reportsection">
 
          <div class="reportlist">
            Created by:

            <xsl:value-of select="//page/qd/qsummary/@username"/>,
            <xsl:value-of select="//page/qd/qsummary/@createdate"/>
          </div>
          <div class="reportlist">
            Distributor:
            <xsl:value-of select="//page/qd/qsummary/@company"/>
          </div>
          <div class="reportlist">
            Rev <xsl:value-of select="//page/qd/qsummary/@rev"/>,
            <xsl:value-of select="//page/qd/qsummary/@revdate"/>
          </div>
        </div>
        <div class="reportsection">
        <div class="sectionhead">Bill of Materials</div>
        <table class="reporttable">
          <thead>
          <tr>
            <td>Type</td>
            <td>Item</td>
            <td>Qty</td>
            <td>Weight<br/>Each (<xsl:value-of select="//page/qd/wsum/@unit"/>)
            </td>
            <td>
                Total<br/>Weight (<xsl:value-of select="//page/qd/wsum/@unit"/>)
            </td>
            <td>Stamp(s)</td>
          </tr>
          </thead>
          <xsl:for-each select="//page/qd/items[not(@ispilotfor)]">
            <tr>
              <td>
                <xsl:value-of select="@ctypename"/>
              </td>
              <td>
                <xsl:value-of select="@partno"/>
                <xsl:value-of select="@ext"/>
                <xsl:if test="@cavity">
                  (<xsl:value-of select="@cavity"/>)
                </xsl:if>
                <xsl:if test="@setting">
                  <xsl:value-of select="@setting"/>
               
                  <xsl:value-of select="@unit"/>
                </xsl:if>
                <xsl:if test="//page/qd/items[@ispilotfor=current()/@id]">
                  <div>
                    <img src="images/arrowright.png"/>
                    <xsl:value-of select="//page/qd/items[@ispilotfor=current()/@id]/@partno"/>
                    <xsl:value-of select="//page/qd/items[@ispilotfor=current()/@id]/@ext"/> (pilot)

                  </div>
                </xsl:if>

                <xsl:if test="@orificepart">
                  <font class="smallnoteblue">
                    <xsl:value-of select="@orificepart"/>
                  </font>
                </xsl:if>
               
              </td>
              <td>
                <xsl:value-of select="@qty"/>
              </td>
              <td>
                <xsl:value-of select="@weighteach"/>
                <xsl:if test="//page/qd/items[@ispilotfor=current()/@id]">
                  <div>
                    <xsl:value-of select="//page/qd/items[@ispilotfor=current()/@id]/@weighteach"/>
                  </div>
                </xsl:if>
             
              </td>
              <td>
                <xsl:value-of select="@weight"/>
                <xsl:if test="//page/qd/items[@ispilotfor=current()/@id]">
                  <div>
                    <xsl:value-of select="//page/qd/items[@ispilotfor=current()/@id]/@weight"/>
                  </div>
                </xsl:if>
             
              </td>
              <td>
                <xsl:for-each select="//page/qd/stamps[@qspecid = current()/@id and @isport='1']">
                  <xsl:value-of select="@stamp"/>

                  <br/>
                </xsl:for-each>
                <xsl:for-each select="//page/qd/stamps[@qqcavpartsid = current()/@id and @isport='0']">
                  <xsl:value-of select="@stamp"/>

                  <br/>
                </xsl:for-each>
              
              </td>
            </tr>
          </xsl:for-each>
          <tr>
            <td colspan="3">
            </td>
            <td>
              
                Total<br/>Weight
              
            </td>
            <td>
              
                <xsl:value-of select="//page/qd/wsum/@totalweight"/>
                
                <xsl:value-of select="//page/qd/wsum/@unit"/>
              
            </td>
            <td>

            </td>
          </tr>
        </table>
        </div>
 
          <!--
        <div style="PAGE-BREAK-AFTER: always;"/>
        <hr/>
        <div>Connections</div>
        <div style="padding-left:20px;">
          <div>Ports</div>
          <table>
            <tr>
              <td class="connectcavitycontainer">
                <div>
                  <xsl:for-each select="//page/qd/qcircuits[@isport='1']">
                    <div class="connectcavity" style="position:relative;">
                      <xsl:attribute name="id">
                        divcavity<xsl:value-of select="@qcircuitid"/>
                      </xsl:attribute>
                      <xsl:attribute name="name">
                        divcavity<xsl:value-of select="@qcircuitid"/>
                      </xsl:attribute>
                      <div class="connectheader">
                        <xsl:value-of select="@stamp1"/>
                        <br/>
                        <xsl:value-of select="@stamp2"/>
                      </div>
                      <xsl:for-each select="//page/qd/qcircconnect[@qcircuitid=current()/@qcircuitid]">
                        <div class="connectboxisoportlabel" >
                          <xsl:value-of select="@portnolabel"/>
                        </div>
                        <div class="connectbox" divposition="1">
                          <xsl:attribute name="id">
                            divbox<xsl:value-of select="@id"/>
                          </xsl:attribute>
                          <xsl:if test="current()[not (@connects)]">
                            <xsl:attribute name="highlighted">1</xsl:attribute>
                          </xsl:if>
                          <xsl:if test="current()[@connecttypeid]">
                            <xsl:attribute name="ispilot">1</xsl:attribute>
                          </xsl:if>
                          <xsl:attribute name="istop">
                            <xsl:value-of select="@istop"/>
                          </xsl:attribute>
                          <xsl:attribute name="isblack">
                            <xsl:value-of select="@isblack"/>
                          </xsl:attribute>
                          <xsl:value-of select="@connects"/>
                        </div>
                      </xsl:for-each>

                    </div>
                  </xsl:for-each>
                </div>
              </td>
            </tr>
            <tr>
              <td style="height:5px"></td>
            </tr>
          </table>
          <div>Cavities</div>
          <table>
            <tr>
              <td class="connectcavitycontainer">
                <div>
                  <xsl:for-each select="//page/qd/qcircuits[@isport='0']">
                    <div class="connectcavity" style="position:relative;">
                      <xsl:attribute name="id">
                        divcavity<xsl:value-of select="@qcircuitid"/>
                      </xsl:attribute>
                      <xsl:attribute name="name">
                        divcavity<xsl:value-of select="@qcircuitid"/>
                      </xsl:attribute>
                      <div class="connectheader">
                        <xsl:value-of select="@stamp1"/>
                        <br/>
                        <xsl:value-of select="@stamp2"/>
                      </div>
                      <xsl:for-each select="//page/qd/qcircconnect[@qcircuitid=current()/@qcircuitid]">
                        <div class="connectbox">
                          <xsl:attribute name="id">
                            divbox<xsl:value-of select="@id"/>
                          </xsl:attribute>
                          <xsl:attribute name="divposition">
                            <xsl:value-of select="@portno"/>
                          </xsl:attribute>
                          <xsl:if test="current()[not (@connects)]">
                            <xsl:attribute name="highlighted">1</xsl:attribute>
                          </xsl:if>
                          <xsl:if test="current()[@connecttypeid]">
                            <xsl:attribute name="ispilot">1</xsl:attribute>
                          </xsl:if>
                          <xsl:attribute name="istop">
                            <xsl:value-of select="@istop"/>
                          </xsl:attribute>
                          <xsl:attribute name="isblack">
                            <xsl:value-of select="@isblack"/>
                          </xsl:attribute>
                          <xsl:attribute name="ispurple">
                            <xsl:value-of select="@ispurple"/>
                          </xsl:attribute>

                          <xsl:value-of select="@connects"/>
                        </div>
                        <div class="connectboxportlabel">
                          <xsl:value-of select="@portnolabel"/>
                          <img src="images/blank.gif"/>
                        </div>
                      </xsl:for-each>
                      <div class="connectnosedrill"/>
                    </div>
                  </xsl:for-each>
                </div>

              </td>
            </tr>
          </table>
          <div>Symbols</div>
          <table>
            <tr>
              <td class="connectcavitycontainer">
                <xsl:for-each select="//page/qd/symbols">
                  <div class="connectcavity" style="font-size:85%;">
                    <xsl:for-each select="//page/qd/qcircuits[@symbol = current()/@symbol]">
                      <xsl:value-of select="@stamp"/>
                      <br/>
                    </xsl:for-each>
                    <img class="connectmenuimage">
                      <xsl:attribute name="src">
                        <xsl:value-of select="@symbol"/>
                      </xsl:attribute>
                    </img>
                  </div>
                </xsl:for-each>

              </td>
            </tr>
          </table>
        </div>
        <script language="javascript">
          <xsl:comment>
            shownetall();
          </xsl:comment>
        </script>
        -->
        <div style="PAGE-BREAK-AFTER: always;clear:both;"/>
        <div class="reportsection">
        <div class="sectionhead">Net Summary and Port Types</div>


          <table class="reporttable">
            <thead>
            <tr>
              <td>
                Net
              </td>
              <td>
                Item
              </td>
              <td>
                Stamp
              </td>
              <td>
                Port
              </td>
              <td style="cursor:hand;">
                <xsl:attribute name="title">
                  <xsl:value-of select="//page/qd/portheaders[@id='2']/@title"/>
                </xsl:attribute>
                
                  <xsl:value-of select="//page/qd/portheaders[@id='2']/@header"/>
                
              </td>
            </tr>
            </thead>
            <xsl:for-each select="//page/qd/connectstamp">
              <tr>
                <td>
                  <xsl:if test="not(@isfirst)">
                    <xsl:attribute name="style">border-bottom:none;border-top:none;</xsl:attribute>
                  </xsl:if>
                  <xsl:if test="@isfirst">
                    <xsl:attribute name="style">border-bottom:none;</xsl:attribute>
                      <xsl:value-of select="@connects"/>
                    
                  </xsl:if>

                </td>
                <td>
                  <xsl:value-of select="@display"/>
                </td>
                <td>
                  <xsl:value-of select="@stamp"/>
                </td>
                <td>
                  <xsl:value-of select="@portnolabel"/>
                </td>
                <!--
            <td align="center">
              <xsl:if test="@connecttypeid='1'">
                <img src="images/checked.gif"/>
              </xsl:if>
              <img src="images/blank.gif"/>
            </td>
          -->
                <td align="center">
                  <xsl:if test="@isisolated='1'">
                    <img src="images/checked.gif"/>
                  </xsl:if>
                 
                </td>
              </tr>
            </xsl:for-each>

          </table>

        </div>

          <div class="smallnote">
            
              <xsl:value-of select="//page/qd/portheaders[@id='2']/@header"/>:
            
            <xsl:value-of select="//page/qd/portheaders[@id='2']/@title"/>
          </div>


        <div style="PAGE-BREAK-AFTER: always;clear:both;"/>
        <div class="reportsection">
          <div class="sectionhead">Layout</div>

          <table class="reporttable">
            <tr>
              <td>
                <div >
                  <div class="reportsubhead">Face Designations</div>

                  <table class="reporttable">
                    <tr>
                      <td colspan="2">
                        The <font class="accentfont">
                          <xsl:value-of select="//page/qd/faceconst[@ismountingface='1']/@label"/>
                        </font>
                        face is the mounting face.
                      </td>
                    </tr>
                    <tr>
                      <td colspan="1">
                        Cartridges are NOT allowed on:
                      </td>
                      <td colspan="1">

                        <font class="accentfont">
                          <xsl:for-each select="//page/qd/faceconst[@isfreeofvalves='1']">
                            <xsl:value-of select="@label"/> .
                          </xsl:for-each>
                        </font>
                        <div id="divfaceconc" style="display:none">
                          <xsl:for-each select="//page/qd/faceconst">
                            <xsl:value-of select="@label"/>
                            <br/>
                          </xsl:for-each>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td colspan="1">
                        Working ports are NOT allowed on:
                      </td>
                      <td colspan="1">

                        <font class="accentfont">
                          <xsl:for-each select="//page/qd/faceconst[@isfreeofports='1']">
                            <xsl:value-of select="@label"/> .
                          </xsl:for-each>
                        </font>
                        <div id="divfaceconp" style="display:none">
                          <xsl:for-each select="//page/qd/faceconst">

                            <xsl:value-of select="@label"/>
                            <br/>
                          </xsl:for-each>

                        </div>
                      </td>
                    </tr>
                  </table>
                </div>
                <br/>
                <div>
                  <div class="reportsubhead">Component Placement</div>

                  <table class="reporttable">
                    <thead>
                      <tr>
                        <td colspan="2">Cartridges</td>
                        <td >Faces</td>
                        <td >Options</td>
                      </tr>
                    </thead>
                    <xsl:for-each select="//page/qd/features[@iscavity='1']">
                      <tr>
                        <td>
                          <xsl:if test="@iscrossdrillfor">
                            <img src="images/arrowright.png" title="Cross-pilot"/>
                          </xsl:if>
                          <xsl:value-of select="@stamp"/>
                        </td>
                        <td >
                          <xsl:value-of select="@partno"/>
                          <xsl:value-of select="@ext"/>
                        </td>
                        <td>

                          <xsl:if test="current()[not (@placementindex)]">
                            (Any allowable)
                          </xsl:if>
                          <xsl:if test="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid]">
                            <font class="accentfont">
                              <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @selected='1']">
                                <xsl:value-of select="@label"/> .
                              </xsl:for-each>
                            </font>
                          </xsl:if>
                          <div>
                            <xsl:attribute name="id">
                              div<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>
                            <xsl:attribute name="name">
                              div<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>
                            <xsl:attribute name="style">display:none</xsl:attribute>
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @isfreeofvalves='0']">

                              <xsl:value-of select="@label"/>
                              <br/>
                            </xsl:for-each>
                          </div>

                        </td>
                        <td  >
                          <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp]">

                            <div>
                              <xsl:attribute name="id">
                                divclearance<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)]">
                                <xsl:attribute name="style">display:none;</xsl:attribute>
                              </xsl:if>
                              Clearance
                              <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@envclearance"/>
                              <br/>
                              (Std <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/> dia)
                            </div>
                          </xsl:if>
                        </td>

                      </tr>
                    </xsl:for-each>
                    <thead>
                      <tr>
                        <td colspan="2">
                          Ports
                        </td>
                        <td >Faces</td>
                        <td isheader="true">Options</td>
                      </tr>
                    </thead>
                    <xsl:for-each select="//page/qd/features[@iscavity='0']">
                      <tr>
                        <td  >
                          <xsl:value-of select="@stamp"/>
                        </td>
                        <td  >
                          <xsl:value-of select="@qqlabel"/>
                        </td>
                        <td>

                          <xsl:if test="current()[not (@placementindex)]">
                            (Any allowable)
                          </xsl:if>
                          <xsl:if test="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid]">
                            <font class="accentfont">
                              <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @selected='1']">
                                <xsl:value-of select="@label"/> .
                              </xsl:for-each>
                            </font>
                          </xsl:if>
                          <div>
                            <xsl:attribute name="id">
                              divcompp<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>
                            <xsl:attribute name="name">
                              divcompp<xsl:value-of select="@qcircuitid"/>
                            </xsl:attribute>
                            <xsl:attribute name="style">display:none</xsl:attribute>
                            <xsl:for-each select="//page/qd/featurefaces[@qcircuitid=current()/@qcircuitid and @isfreeofports='0']">

                              <xsl:value-of select="@label"/>
                              <br/>
                            </xsl:for-each>
                          </div>
                        </td>
                        <td  >
                          <xsl:if test="@issuperfeature">
                            Rot. <select class="formtext" size="1">
                              <xsl:attribute name="name">
                                data_interfacerot<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:attribute name="onchange">showsave();</xsl:attribute>
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


                            <div>
                              <xsl:attribute name="id">
                                divclearance<xsl:value-of select="@qcircuitid"/>
                              </xsl:attribute>
                              <xsl:if test="//page/qd/clearance[@stamp=current()/@stamp and not(@envclearance)]">
                                <xsl:attribute name="style">display:none;</xsl:attribute>
                              </xsl:if>
                              Clearance
                              <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@envclearance"/>
                              <br/>
                              (Std <xsl:value-of select="//page/qd/clearance[@stamp=current()/@stamp]/@dia"/> dia)
                            </div>
                          </xsl:if>
                        </td>
                      </tr>
                    </xsl:for-each>
                  </table>
                </div>
              </td>
              <td style="width:12px;"></td>
              <td>
                <div>
                  Construction Port: <xsl:value-of select="//page/qd/constports[@selected='1']/@name"/>

                </div>
                <br/>
                <div >
                  Mounting Holes: <xsl:value-of select="//page/qd/mh[@id=//page/qd/partconst[@settingid='8']/@setting]/@name"/>

                  <xsl:for-each select="//page/qd/cmholes">
                    <div style="font-size:90%;">
                      <table>
                        <tr>
                          <td>No. Holes</td>
                          <td>
                            <xsl:value-of select="@numholes"/>
                          </td>
                        </tr>
                        <tr>
                          <td>Item</td>
                          <td>
                            <xsl:value-of select="@name"/>
                          </td>
                        </tr>

                      </table>

                    </div>
                  </xsl:for-each>
                </div>
                <xsl:if test="//page/qd/maycreatemetric">
                  <br/>
                  <div >
                    Output to: <xsl:value-of select="//page/qd/inchmetricsetting[@selected='1']/@name"/>

                  </div>

                </xsl:if>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>


  </xsl:template>
</xsl:stylesheet>
