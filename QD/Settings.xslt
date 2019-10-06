<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="cross.xslt"/>
  <xsl:variable name="hcross">
    <xsl:call-template name="cross"/>
  </xsl:variable>
  <xsl:template match="/">
    <link rel="stylesheet" type="text/css" href="css/accordion.css"/>

    <input type="hidden" id="data_action" name="data_action"/>
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
  <div class="site--wrapper">
   <div class="container bg--white">
   <xsl:if test="showdetail">
   <label>
      <xsl:value-of select="//page/qd/screenlabels[@id='205']/@label"/>
      <!--Custom default settings for-->
      <xsl:value-of select="//page/qd/me/@name"/>
    </label>
    <xsl:for-each select="//page/qd/userinfo">
      <label>
        <xsl:value-of select="@info"/>
      </label>
    </xsl:for-each>

    <label>
      <xsl:value-of select="//page/qd/screenlabels[@id='204']/@label"/>
      <!--Contact Sun if the information above is incorrect.-->

    </label>
    <!--
 			<div disable-output-escaping="true" class="youtubewrapper">
					<xsl:copy-of select="$htutorial"/>			
			</div>  
     -->
    </xsl:if>
     <section class="bg--light-grey pad block bottom-space">
       <!--
       <h3 class="block-title">
         Your default settings for QuickDesign
       </h3>
       -->
     </section>
     <ul>
       <li class="block">
         <input type="checkbox" name="item" id="itemexpandall">
           <xsl:attribute name="onchange">
             sexpand='<xsl:value-of select="//page/qd/screenlabels[@id=608]/@label"/>';
             scollapse='<xsl:value-of select="//page/qd/screenlabels[@id=609]/@label"/>';
					
             lc=false;
             stext=sexpand+" ";
             if(this.checked){lc=true;stext=scollapse+" "}
             $("#accordionshowall").prop("innerText",stext);
             $("#item0").prop("checked",lc);
             $("#item1").prop("checked",lc);
             $("#item2").prop("checked",lc);
             $("#item3").prop("checked",lc);
           </xsl:attribute>
         
         </input>
           
         <label for="itemexpandall" class="accbox"><font style="color:#dddddd;">.</font>
           <span id="accordionshowall" class="accordion-icon"><xsl:value-of select="//page/qd/screenlabels[@id=608]/@label"/>
					<!--Expand All-->
         </span>
         </label>
        </li>
        <xsl:for-each select="//page/qd/gslabels">
          <xsl:variable name="thislabel" select="."/>
           <li class="block">
             <input type="checkbox" name="item">
             <xsl:attribute name="id">item<xsl:value-of select="@issc"/> </xsl:attribute></input>
              <label class="accbox">
                <xsl:attribute name="for">item<xsl:value-of select="@issc"/></xsl:attribute>
                   <xsl:value-of select="@label"/>
                  <!-- General Settings-->
               <span class="accordion-icon"></span>
             </label>
              <ul class="options">
                <li>
               <table>
                <xsl:for-each select="//page/qd/gstypes[@issc=$thislabel/@issc]">
                  <tr>
                    <td>
                      <xsl:value-of select="@name"/>
                    </td>
                    <td>
                      <select>
                        <xsl:attribute name="id">gsid<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="name">gsid<xsl:value-of select="@id"/></xsl:attribute>
                        <xsl:attribute name="onchange">
                          loadXMLDoc("qd_userpreferences", this);	
                          if(this.id == 'gsid21'){submitit();}
                        
                        
                        </xsl:attribute>
                        <xsl:for-each select="//page/qd/gspref[@settingid = current()/@id]">
                          <option>
                            <xsl:attribute name="id">us<xsl:value-of select="@settingid"/></xsl:attribute>
                            <xsl:attribute name="name">us<xsl:value-of select="@settingid"/></xsl:attribute>
                            <xsl:attribute name="value">
                              <xsl:value-of select="@setting"/>
                            </xsl:attribute>
                            <xsl:if test="@selected">
                              <xsl:attribute name="selected">true</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="@display"/>
                          </option>
                        </xsl:for-each>
                      </select>
                      <xsl:if test="@id='11'"> (under development)</xsl:if>
                    </td>
                    <td>
                      <xsl:value-of select="@extdescrip"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </table>   
                </li>
              </ul>
          </li>
           
         </xsl:for-each>
         <li class="block">
            <input type="checkbox" name="item" id="item2"/>
            <label for="item2" class="accbox">
              <xsl:value-of select="//page/qd/screenlabels[@id=610]/@label"/>
					    <!--Layout Preferences-->
             <span class="accordion-icon"></span>
          </label>
            <ul class="options">
              <li>     
          <table>

            <tr>
              <td>
                <xsl:value-of select="//page/qd/screenlabels[@id='227']/@label"/>
                <!--Mounting Face-->

              </td>
              <td>
                <select id="lstmf" name="lstmf">
                  <xsl:attribute name="onchange">
                    obox="#chkfc"+this.value;
                    $(obox).prop('checked','true');
                    loadXMLDoc("qd_mountingface", this);	
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
              </td>
            </tr>
            <tr>
              <td>
                <xsl:value-of select="//page/qd/screenlabels[@id='195']/@label"/>
                <!--Cartridges are NOT allowed on-->

              </td>
              <td>

                <xsl:for-each select="//page/qd/faceconst">

                  <input type="checkbox" class="userbox">
                    <xsl:attribute name="id">chkfc<xsl:value-of select="@findex"/></xsl:attribute>
                    <xsl:attribute name="name">chkfc<xsl:value-of select="@findex"/></xsl:attribute>
                    <xsl:attribute name="onchange">
                    thismf=$("#lstmf").val();
                    this.value=this.checked;
                    if(thismf == '<xsl:value-of select="@findex"/>'){
                      $(this).prop('checked','true');
                      return;
                     }
                     loadXMLDoc("qd_faceconst", this);	
                    </xsl:attribute>
                    <xsl:if test="@isfreeofvalves='1'">
                      <xsl:attribute name="checked">true</xsl:attribute>
                    </xsl:if>
                  </input>
                  <labelfor class="labelfor"><xsl:value-of select="@label"/></labelfor>
                   <!-- 
                   <label>
                        <xsl:attribute name="for">
                          chkfc<xsl:value-of select="@findex"/>
                        </xsl:attribute>
                        <xsl:value-of select="@label"/>
                   </label>
                   -->
                </xsl:for-each>
              </td>
            </tr>
            <tr>
              <td>
                <xsl:value-of select="//page/qd/screenlabels[@id='256']/@label"/>
                <!--Working ports are NOT allowed on-->

              </td>
              <td>
                  <xsl:for-each select="//page/qd/faceconst">
                    <input type="checkbox" class="userbox">
                      <xsl:attribute name="id">chkfp<xsl:value-of select="@findex"/></xsl:attribute>
                      <xsl:attribute name="name">chkfp<xsl:value-of select="@findex"/></xsl:attribute>
                      <xsl:attribute name="onchange">
                        this.value=this.checked;
                        loadXMLDoc("qd_faceconst", this);	
                      </xsl:attribute>
                      <xsl:if test="@isfreeofports='1'">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                    </input>
                    <labelfor class="labelfor"><xsl:value-of select="@label"/></labelfor>

                  </xsl:for-each>
            </td>
            </tr>
            <tr>
              <td/>
              <td colspan="1">
                <xsl:copy-of select="$hcross"/>
              </td>
            
          </tr>
          </table>
              </li>
            </ul>
        </li>   
         <li class="block">
            <input type="checkbox" name="item" id="item3"/>
            <label for="item3" class="accbox">
                 <xsl:value-of select="//page/qd/screenlabels[@id=209]/@label"/>
					      <!--Design Features-->
             <span class="accordion-icon"></span></label>
            <ul class="options">
              <li>     
          <table>
            <tr>
              <td>
                <xsl:value-of select="//page/qd/screenlabels[@id='222']/@label"/>
                <!--Item-->

              </td>
              <td>
                <xsl:value-of select="//page/qd/screenlabels[@id=611]/@label"/>
					<!--Include in the list of features-->
              </td>
            </tr>
            <xsl:for-each select="//page/qd/features">
              <tr>
                <td>
                  <xsl:value-of select="@name"/>
                </td>
                <td>
                  <xsl:if test="not (@mayedit)">
                    <xsl:value-of select="//page/qd/screenlabels[@id=612]/@label"/>
					          <!--Always-->
                  </xsl:if>
                  <xsl:if test="@mayedit">
                    <input type="checkbox" class="userbox">
                      <xsl:attribute name="id">dfid<xsl:value-of select="@id"/></xsl:attribute>
                      <xsl:attribute name="name">dfid<xsl:value-of select="@id"/></xsl:attribute>
                      <xsl:attribute name="onchange">
                        this.value=this.checked;
                        loadXMLDoc("qd_userfeatures", this);	
                      </xsl:attribute>
                        <xsl:if test="not (@exclude)">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                    </input>

                  </xsl:if>
                </td>
                <!--
						  <td>
							  <xsl:if test="@mayedit">
								  <input type="textbox" class="textboxnormal" style="width:20px;">
									  <xsl:attribute name="id">dfsort<xsl:value-of select="@id"/>
											  </xsl:attribute>
									  <xsl:attribute name="name">dfsort<xsl:value-of select="@id"/>
											  </xsl:attribute>
									  <xsl:attribute name="value">
										  <xsl:value-of select="@sortorder"/>
									  </xsl:attribute>

								  </input>
							  </xsl:if>	
						  </td>
						  -->
              </tr>
            </xsl:for-each>
          </table>
 
              </li>
            </ul>
        </li>   
     
     
    </ul>
   
    
      
      
        
 </div>

    </div>
    <script>
      <![CDATA[

			]]>
    </script>
  </xsl:template>

</xsl:stylesheet>
