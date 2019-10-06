<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="cross.xslt"/>
  <xsl:variable name="hcross">
    <xsl:call-template name="cross"/>
  </xsl:variable>
  <xsl:template match="/">

    <input type="hidden" id="action" name="action"/>
    <input type="hidden" id="thisid" name="thisid"/>
    <input type="hidden" id="sthisid" name="sthisid"/>
    <input type="hidden" id="thisctypeid" name="thisctypeid"/>
    <input type="hidden" id="thisval" name="thisval"/>
    <xsl:if test="//page/qd/mayedit">
      <input type="hidden" id="mayedit" name="mayedit" value="1"/>
    </xsl:if>
    <input type="hidden" id="thisqcircuitid" name="thisqcircuitid"/>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <section class="block bottom-space grid">
          <div class="notifications-wrapper">
            <xsl:for-each select="//page/qd/usermessages">
              <a class="notification alert pad-half" title="Go">
                <xsl:if test="@linkhref">
                  <xsl:attribute name="href">
                    <xsl:value-of select="@linkhref"/>
                  </xsl:attribute>                  
                </xsl:if>
                <xsl:attribute name="title">
                  <xsl:value-of select="@linklabel"/>
                </xsl:attribute>  
                <xsl:attribute name="onclick">
                  <xsl:value-of select="@linkclick" disable-output-escaping="yes"/>
                </xsl:attribute>
    
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
        <section class="block bottom-space grid">
          <a id="configanchor"/>
          <div id="screenmessage" class="notecard nodisplay"></div>
          <table id="tableconfig">
            <thead>

              <xsl:if test="//page/qd[not (items) or hideconfig]">
                <xsl:attribute name="class">nodisplay</xsl:attribute>
              </xsl:if>

              <tr>
                <th colspan="2">
                  <xsl:value-of select="//page/qd/screenlabels[@id=222]/@label"/>
                  <!--Item-->
                </th>
                <th>
                  <xsl:value-of select="//page/qd/screenlabels[@id=597]/@label"/>
                  <!--Quantity-->
                </th>
                <th>
                  <xsl:value-of select="//page/qd/screenlabels[@id=598]/@label"/>
                  <!--Stamping-->
                </th>
              </tr>
            </thead>
           <!-- <xsl:if test="//page/qd[not (hideconfig)]">-->
            <xsl:for-each select="//page/qd/ctypes[@mayviewconfig='1']">
              <xsl:variable name="thismenuitem" select="." />
              <tr>
                <td colspan="4">
                  <a href="#" class="configlabel">
                    <xsl:attribute name="title">
                      <xsl:value-of select="//page/qd/screenlabels[@id=599]/@label"/>
                      <!--Find an item to add to this design-->
                    </xsl:attribute>
                    <xsl:attribute name="onclick">

                      <xsl:if test="$thismenuitem[@mayedit='1']">
                      $('#thisid').val('0');
                     <xsl:if test="@iscart='1'">
                       $('#tablecartmenu').show();
                       $('#configiframe').hide();
                       $('#menupopup').addClass('active');
                       $('.popup-overlay').addClass('active');

                     </xsl:if>
                      <xsl:if test="@iscart='0'">
                        var nthisid='<xsl:value-of select ="@id"/>';
                        for (i = 2; i &amp; 7; i++) {
                          strthisid=i;
                          si='.divspecmenu'+strthisid;
                          $(si).hide();
                        }
                        si='.divspecmenu'+nthisid;
                        $(si).show();

                        $('#specpopup').addClass('active');
                        $('.popup-overlay').addClass('active');

                      </xsl:if>

                     </xsl:if>
                     <xsl:if test="$thismenuitem[@mayedit='0']">
                        stext='<xsl:value-of select="//page/qd/screenlabels[@id=600]/@label"/>';
                        <!--Editing is not allowed here. Open the schematic to change the configuration.-->
                        alert(stext)
                      </xsl:if>
                      return false;
                    </xsl:attribute>
                    <xsl:if test="@id='1'">
                      <xsl:attribute name="onmouseover">
                        $('.spancart').show();
                      </xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select ="@label"/>                
                  </a>
                </td>
              </tr>
              <xsl:for-each select="//page/qd/items[@ctypeid = $thismenuitem/@id]">
                <xsl:variable name="thisitem" select="." />
                <tr>
                  <td/>
                  <td>
                    <xsl:if test="@ctypeid='1'">
                      <a href="#" title="Modify the cartridge or pressure setting">
                        <xsl:attribute name="onclick">
                          <xsl:if test="//page/qd/mayedit">
                            surl='<xsl:value-of
                        select="//page/qd/configpage/@urlprefix"/>&amp;cartridge=<xsl:value-of
                            select="@cartridge"/>';
                            <xsl:if test="@setting">
                              surl += '&amp;setting=<xsl:value-of select="@setting"/>'
                            </xsl:if>
														<xsl:if test="@psetting">
															surl += '&amp;pilotsetting=<xsl:value-of select="@psetting"/>'
														</xsl:if>
														
														<xsl:if test="@cavity">
                              surl += '&amp;cavity=<xsl:value-of select="@cavity"/>'
                            </xsl:if>
                            $('#thisid').val('<xsl:value-of select="@id"/>');
                            $('#configiframe').attr('src',surl);
                            $('.spancart').hide();
                            $('#tablecartmenu').hide();
                            $('#configiframe').show("slow");
                            $('#menupopup').addClass('active');
                            $('.popup-overlay').addClass('active');
                            return false;
                          </xsl:if>
                          <xsl:if test="$thismenuitem[@mayedit='0']">
                            stext='<xsl:value-of select="//page/qd/screenlabels[@id=600]/@label"/>';
                            <!--Editing is not allowed here. Open the schematic to change the configuration.-->
                            alert(stext)
                          </xsl:if> 
                        </xsl:attribute>

												<xsl:value-of select="@display"/>
                       <!-- <xsl:value-of select="@cartridge"/>
											 <xsl:value-of select="@setting"/>-->
                      </a>
                      <span style="font-size:75%;padding-left:12px;">
                        (<xsl:value-of select="@cavity"/>)
                      </span>
                    </xsl:if>
                    <xsl:if test="@ctypeid != '1'">
                      <xsl:value-of select="@partno"/>
                    </xsl:if>
                    <xsl:if test="@isar='0'">
                      <sup> 1 </sup>
                    </xsl:if>
                    <xsl:if test="@hassymbol='0'">
                      <sup> 2</sup>
                    </xsl:if>
                    <xsl:if test="//page/qd/orificeplugs[@nbattrid = $thisitem/@nbattrid]">
                      <select class="orificeselect">
                        <xsl:attribute name="id">orificeselect<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onchange">
                          loadXMLDoc("qd_orificeplug", this);
                          configsubmitit();
                        </xsl:attribute>
                        <option/>
                        <xsl:for-each select="//page/qd/orificeplugs">
                          <option>
                            <xsl:if test="@partid = $thisitem/@partid">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="value"><xsl:value-of select="@partid"/>
                            </xsl:attribute>
                            <xsl:value-of select="@size"/>
                          </option>
                        </xsl:for-each>
                      </select>
                    </xsl:if>   
										
                    <xsl:if test="//page/qd/xmddrivers[@nbattrid = $thisitem/@nbattrid]">
                      <select class="xmdselect">
                        <xsl:attribute name="id">xmddriverselect<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onchange">
                          loadXMLDoc("qd_xmddriver", this);
                          configsubmitit();
                        </xsl:attribute>
                        <option/>
                        <xsl:for-each select="//page/qd/xmddrivers">
                          <option>
                            <xsl:if test="@partid = $thisitem/@partid">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="value"><xsl:value-of select="@partid"/>
                            </xsl:attribute>
                            <xsl:value-of select="@partno"/>
                          </option>
                        </xsl:for-each>
                      </select>
                    </xsl:if> 
                    <xsl:if test="@mayhavensv">
											<select class="orificeselect">
	                        <xsl:attribute name="id">nsvselect<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onchange">
                          loadXMLDoc("qd_nsvselect", this);
                          configsubmitit();
                        </xsl:attribute>										
                        <option/>
                        <xsl:for-each select="//page/qd/mayhavensv[@id = $thisitem/@id] ">
                          <option>
                            <xsl:attribute name="value"><xsl:value-of select="@partid"/>
                            </xsl:attribute>
                            <xsl:value-of select="@partno"/>
                          </option>
                        </xsl:for-each>								
											</select>
										</xsl:if>    
                    </td>
                  <td>
                    <xsl:if test="$thismenuitem[@mayedit='1']">
                    <select class="qtyselect">
                      <xsl:attribute name="title">
                        <xsl:value-of select="//page/qd/screenlabels[@id=601]/@label"/>
                        <!--Select 0 to remove the item-->
                      </xsl:attribute>
                      <xsl:attribute name="onchange">                       
                        editqty(this, '<xsl:value-of select="@qty"/>','<xsl:value-of select="@id"/>','<xsl:value-of select="@ctypeid"/>');
                      </xsl:attribute>
                      <xsl:for-each select="//page/qd/qtynum">
                        <option>
                          <xsl:attribute name="value">
                            <xsl:value-of select="@num"/>
                          </xsl:attribute>
                          <xsl:if test="@num=$thisitem/@qty">
                            <xsl:attribute name="selected">true</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="@num"/>                   
                        </option>
                      </xsl:for-each>
                    </select>
                    </xsl:if>
                    <xsl:if test="$thismenuitem[@mayedit='0']">
                      <xsl:value-of select="@qty"/>
                    </xsl:if>
                  </td>
                  <td>
                    <xsl:for-each select="//page/qd/stamping[@id=$thisitem/@id
                                  and @ctypeid = $thisitem/@ctypeid]">
                      <div class="divstampentry">
                      <input class="stampinput" maxlength="12" name="stampinput">
                        <xsl:attribute name="id">stamp<xsl:value-of select="@qcircuitid"/></xsl:attribute>
                        <xsl:if test="@showstamp">
                          <xsl:attribute name="value"><xsl:value-of select="@stamp"/></xsl:attribute>
                        </xsl:if>
                        <xsl:if test="$thismenuitem[@mayedit='0']">
                          <xsl:attribute name="disabled">true</xsl:attribute>
                        </xsl:if>
                        <xsl:attribute name="onchange">
                         
                          this.value = this.value.toUpperCase();
                          if(finddupestamp("0")==false){
                          return;
                          }
                          loadXMLDoc("qd_stamptext", this);
                        </xsl:attribute>
                        <xsl:attribute name="onkeypress">return isAlphaKey(event);</xsl:attribute>
                      </input>
                        <xsl:if test="@maybeplugged">
                          <img class="imgplug">
                            <xsl:attribute name="id">plugqcircuit<xsl:value-of select="@qcircuitid"/></xsl:attribute>
                            <xsl:attribute name="src">
                              <xsl:if test="@isplugged=1">images/pluggedport.png</xsl:if>
                              <xsl:if test="@isplugged=0">images/openport.png</xsl:if>
                            </xsl:attribute>
                            <xsl:attribute name="title">Click to plug/unplug this port</xsl:attribute>
                            <xsl:attribute name="onclick">
                              var ssrc = this.src;
                               if(ssrc.search("open") > -1){
                                 ssrc=ssrc.replace("open","plugged");
                                 this.value=1;
                               }
                               else{
                               ssrc=ssrc.replace("plugged","open");
                               this.value=0
                               }
                               this.src=ssrc;
                               loadXMLDoc("qd_plugqcircuit", this);
                            </xsl:attribute>
                          </img>

                        </xsl:if>
                      </div>                  
                    </xsl:for-each>
                    
                  </td>
                </tr>
              </xsl:for-each>
            </xsl:for-each>
            <!-- </xsl:if>-->
            <tr>
              <td colspan="4" class="configlabel" title="Modify the material">
                <xsl:value-of select="//page/qd/screenlabels[@id=473]/@label"/>
                <!--Manifold Material-->
              </td>
            </tr>
            <tr>
              <td/>
              <td colspan="2">
                <select id="data_materialid" name="data_materialid" class="manifoldselect">
                  <xsl:attribute name="onchange">
                    loadXMLDoc("qd_manifoldselect", this);

                  </xsl:attribute>
                  
                  <xsl:if test="//page/qd[not (mayeditmaterial)]">
                    <xsl:attribute name="disabled">true</xsl:attribute>
                  </xsl:if>
                 
                  <xsl:for-each select="//page/qd/material">
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
              </td>
              <td></td>
            </tr>
            <xsl:if test="//page/qd/showcoating">
              <tr>
                <td colspan="4" class="configlabel" title="Add or modify the material coating">
                  <xsl:value-of select="//page/qd/screenlabels[@id=602]/@label"/>
                  <!--Manifold Coating-->
                </td>
              </tr>
              <tr>
                <td/>
                <td colspan="2">
                  <select id="data_coatingid" name="data_coatingid" class="manifoldselect">
                    <xsl:attribute name="onchange">
                      loadXMLDoc("qd_coatingselect", this);
                     // configsubmitit();
                    </xsl:attribute>
                    
                    <xsl:if test="//page/qd[not (mayeditmaterial)]">
                      <xsl:attribute name="disabled">true</xsl:attribute>
                    </xsl:if>
                    <xsl:for-each select="//page/qd/coatings">
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
                  <xsl:if test="//page/qd/coatings[@selected]/@note">
                    <div>

                     <!-- <xsl:value-of select="//page/qd/coatings[@selected]/@note"/>-->
                    </div>
                    <div>
                      <xsl:value-of select="//page/qd/coatings[@selected]/@coatingshipnote"/>
                    </div>
                  </xsl:if>
                </td>
              </tr>
            </xsl:if>
            <xsl:if test="//page/qd/designrestrict">
              <tr>
                <td colspan="4" class="configlabel" title="Set the design complexity">
                  <xsl:value-of select="//page/qd/screenlabels[@id=121]/@label"/>
                  <!--Design Complexity-->
                </td>
              </tr>
              <tr>
                <td/>
                <td colspan="2">
                  <select id="data_designmenu" name="data_designmenu" class="manifoldselect">
                    <xsl:attribute name="onchange">
                      loadXMLDoc("qd_complexityselect", this);
                      //configsubmitit();
                    </xsl:attribute>
                    
                    <xsl:if test="//page/qd[not (mayeditmaterial)]">
                      <xsl:attribute name="disabled">true</xsl:attribute>
                    </xsl:if>
                    
                    <xsl:for-each select="//page/qd/designrestrict">
                      <option>
                        <xsl:attribute name="value">
                          <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:if test="@selected">
                          <xsl:attribute name="selected">true</xsl:attribute>
                        </xsl:if>
                        <xsl:attribute name="title">
                          <xsl:value-of select="@english"/>
                        </xsl:attribute>
                        <xsl:value-of select="@name"/>
                      </option>
                    </xsl:for-each>
                  </select>

                </td>
              </tr>
            </xsl:if>
          </table>
          <xsl:if test="//page/qd/items[@isar='0' or @hassymbol='0']">
            <div class="divmaynotsubmit pad">
              <xsl:if test="//page/qd/items[@isar='0']">
                <sup> 1 </sup> Item may not be submitted to QuickDesign<br/>
             </xsl:if>
              <xsl:if test="//page/qd/items[@hassymbol='0']">                
                <sup> 2 </sup> Item may not be used on a schematic - No symbol
              </xsl:if>

            </div>         
          </xsl:if>
                
        </section>


      </div>
      <!-- .container -->

    </div>

    <!-- page-wrapper -->
    <div id="menupopup" class="popup menupopup">
      <input type="button" class="button bg--darker-grey smallbutton" value="Close">
          <xsl:attribute name="onclick">
            $('#menupopup').removeClass('active');
            $('.popup-overlay').removeClass('active');
            $('#configiframe').attr('src','');
          </xsl:attribute>        
      </input>
      <span class="spancart">
        <xsl:value-of select="//page/qd/screenlabels[@id=603]/@label"/>:
        <!--Cartridge part number-->
        <input id="cartpartno"></input>
        <input id="cartgo" type="button" class="button small" value="Go">
          <xsl:attribute name="thisurl"><xsl:value-of
      select="//page/qd/configpage/@urlprefix"/>&amp;cartridge=</xsl:attribute>
        </input>
      </span>
      <table id="tablecartmenu">
          <tr>
           <xsl:for-each select="//page/qd/menucols">
              <xsl:variable name="thiscol" select="." />
                  <td>
                    <xsl:for-each select="//page/qd/menuitem[@col=$thiscol/@col]">
                      <xsl:variable name="thismenuitem" select="." />
                      <div class="menusubheader">
                      <xsl:value-of select="@name"/>
                      <xsl:for-each select="$thismenuitem/subitem">
                        <xsl:variable name="thissubitem" select="." />
                        <div class="itemwrapper">
                          <xsl:value-of select="@name"/>
                          <xsl:for-each select="$thissubitem/subitem">
                            <div class="menusubitem3" title="View these cartridges">
                              <xsl:attribute name="thisurl">
                                <xsl:value-of 
                                  select="//page/qd/configpage/@urlprefix"/><xsl:value-of
                                  select="@id"/></xsl:attribute>
                              <xsl:value-of select="@name"/>
                            </div>
                          </xsl:for-each>
                          </div>
                      </xsl:for-each>
                      </div>

                    </xsl:for-each>
      
                  </td>
            </xsl:for-each>
          </tr>
        </table>
      <iframe id="configiframe" class="nodisplay">
        
      </iframe>      
    </div>
    <div id="specpopup" class="popup menupopup">
      <div>
      <input type="button" class="button bg--darker-grey smallbutton">
        <xsl:attribute name="value">
          <xsl:value-of select="//page/qd/screenlabels[@id=71]/@label"/>
          <!--Close-->
        </xsl:attribute>
        <xsl:attribute name="onclick">
          $('#specpopup').removeClass('active');
          $('.popup-overlay').removeClass('active');
          return false;
        </xsl:attribute>        
      </input>
      </div>
      <xsl:for-each select="//page/qd/specmenu">
        <xsl:variable name="thismenu" select="." />
        <div>
          <xsl:attribute name="class">divspecmenu<xsl:value-of select="@menuid"/></xsl:attribute>
          <div class="menusubheader">
            <xsl:value-of select="@label"/>
            <xsl:for-each select="$thismenu/item">
              <xsl:variable name="thisitem" select="." />
              <div class="specmenuitem">
                <xsl:attribute name="id">specmenu<xsl:value-of select="@id"/></xsl:attribute>
                <xsl:value-of select="@name"/>
                <xsl:if test="@isar=0">
                  <sup style="background-color:yellow;"> 1 </sup>
                </xsl:if>
                <xsl:if test="not(@symbol)">
                  <sup style="background-color:yellow;"> 2 </sup>
                </xsl:if>
              </div>
            </xsl:for-each>
          </div>
        </div>
      </xsl:for-each>
      <xsl:if test="//page/qd/specmenu/item[@isar=0 or not(@symbol)]">
        <div class="grayitalic clear pad">
          <sup style="background-color:yellow;">1</sup> May not be submitted to QuickDesign.<br/>
          <sup style="background-color:yellow;">2</sup> May not be used in a schematic (no symbol yet).
        </div>
      </xsl:if>
    </div>
    <div id="divlightboxmessage" class="popup small">
      <div class="content pad grid content--wrapper">
        <h2 class="blocktitle divnavtitle">
          <xsl:value-of select="//page/qd/editpath[@id=0]/@smessage"/>
          <!--Select a design option below-->
        </h2>
        <a class="button bg--blue">
          <xsl:attribute name="href">
            <xsl:value-of select="//page/qd/schematiclink"/>
          </xsl:attribute>
          OK
        </a>
      </div>
    </div>
    <div class="popup-overlay"></div>
    <input id="data_cartjson" name="data_cartjson" style="display:none;"></input>
    <script>
      <xsl:comment>
        function listener(event){
          sdata = event.data
          $('#menupopup').removeClass('active');
          $('.popup-overlay').removeClass('active');
          if(sdata.indexOf("SelectedCartridge") &gt; 0){
        $('#data_cartjson').val(sdata);
        $('#action').val('newcart');
        submitit();
        }
        }
        if (window.addEventListener){
        addEventListener("message", listener, false)
        } else {
        attachEvent("onmessage", listener)
        }
        
      </xsl:comment>
    </script>

  </xsl:template>
</xsl:stylesheet>
