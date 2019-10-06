<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <div style="float:right;width:300px;">
          <form id="frmreportform" method="post" runat="server">
            <input id="txtpartno" name="txtpartno" maxlength="20">
              <xsl:attribute name="value">
                <xsl:value-of select="//page/qd/parts/@partno"/>
              </xsl:attribute>
            </input>
            <a href="#">
              <xsl:attribute name="onclick">
                this.href="report.aspx?page=mlaborcosts&amp;partno="+document.getElementById("txtpartno").value;
                document.forms[0].submit();
              </xsl:attribute>Go
            </a>
          </form>
        </div>
        <div class="reporthead">
          Integrated Package Costs 
          <div class="smallgrid">For review only.  May contain incorrect data</div>
        </div>
        <br/>
        <div class="divtablecontainer">
          <xsl:if test="//page/qd/errmess">
            <div class="notepad">
              <xsl:value-of select="//page/qd/errmess/@errmess"/>
            </div>
          </xsl:if>
          <xsl:if test="//page/qd[not (errmess)]">
            <div class="divtablecell">
              <strong>Design Summary</strong> 
             <xsl:for-each select="//page/qd/vmcostfactors1">
             <table class="mcosttable">
               <xsl:for-each select="//page/qd/labels">
                 <tr>
                   <td><xsl:value-of select="@label"/></td>
                   <td style="text-align:left;">
                     <xsl:value-of select="@val"/>
                   </td>
                 </tr>
               </xsl:for-each>

             </table>
             </xsl:for-each>
            </div>
            <div class="divtablecell">
              <strong>Manifold Costs (labor and material)</strong>
              <div class="smallgrid">
                <a href="#">
                    <xsl:attribute name="onclick">
                      $(".formulatext").toggle();
                      return false;
                    </xsl:attribute>                  
                  Show/Hide Detail
                </a> .
                <a href="http://primedataweb.sunhydraulics.com/mcostfactors.aspx" target="costfactors">
                  Cost Factors
                </a> 
              </div>
              <table class="mcosttable">
                <tr>
                  <td>Item</td>
                  <td>Labor Minutes                
                  </td>
                  <td>Cost $
                    <div class="formulatext">
                      Hourly cost + (Hourly Cost * VOH)  
                    </div>
                  </td>
                </tr>
                 <xsl:for-each select="//page/qd/formulatop">

                  <tr>
                    <td>
                      <xsl:value-of select ="@name"/>
                    </td>
                    <td>
                      <xsl:value-of select ="@factor"/>
                      <div class="formulatext">
                        <xsl:value-of select ="@screentextf"/>
                      </div>
                    </td>
                    <td>
                      <xsl:value-of select ="@totalcost"/>
                      <div class="formulatext">
                        <xsl:value-of select ="@screentext" disable-output-escaping="yes"/>
                      </div>
                    </td>

                  </tr>
              </xsl:for-each>
                <tr>
                  <td colspan="2" style="text-align:right">Labor Cost</td>
                  <td>
                    <xsl:value-of select ="//page/qd/sumcost/@sumcost"/>
                  </td>  
                  
                </tr>
								<tr>
									<td colspan="2" style="text-align:right">Coating Cost</td>
									<td>
										<xsl:value-of select ="//page/qd/mprice/@coatingcost"/>
										<div class="formulatext">
											<xsl:value-of select ="//page/qd/mprice/@cscreentext"/>
										</div>
									</td>

								</tr>
								<tr>
                  <td colspan="2" style="text-align:right">Material Cost</td>
                  <td>
                    <xsl:value-of select ="//page/qd/mprice/@mprice"/>
                      <div class="formulatext">
                        <xsl:value-of select ="//page/qd/mprice/@screentext"/>
                      </div>
                  </td>

                </tr>
                <tr class="mcostsubtotals">
                  <td colspan="2" style="text-align:right">Total</td>
                  <td>
                    <xsl:value-of select ="//page/qd/sumcost/@summcost"/>
                  </td>

                </tr>
              </table>

            </div>
            <div style="display:table-row;height:40px;"/>
            <div class="divtablecell">
              <strong>BOM</strong>

                <table class="mcosttable">
                      <tr>
                        <td>Manifold Parts</td>
                        <td>
                          Qty
                        </td>
                        <td>
                          Cost $
                        </td>
                      </tr>
                      <xsl:for-each select="//page/qd/bom[@iscart='0']">
                        <tr>
                          <td>
                            <xsl:value-of select ="@partno"/>
                          </td>
                          <td>
                            <xsl:value-of select ="@qty"/>
                          </td>
                          <td>
                            <xsl:if test="not(@price)">
                              <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select ="@price"/>
                          </td>

                        </tr>
                      </xsl:for-each>
                  <tr class="mcostsubtotals">
                    <td></td>
                    <td>
                      Total
                      
                      
                    </td>
                    <td><xsl:value-of select ="//page/qd/sumcost/@sumplug"/>
                    </td>
                  </tr>
                  <tr>
                    <td>Cartridges</td>
                    <td>
                      Qty
                    </td>
                    <td>
                      Cost $
                    </td>
                  </tr>
                  <xsl:for-each select="//page/qd/bom[@iscart='1']">
                    <tr>
                      <td>
                        <xsl:value-of select ="@partno"/>
                      </td>
                      <td>
                        <xsl:value-of select ="@qty"/>
                      </td>
                      <td>
                        <xsl:if test="not(@price)">
                          <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select ="@price"/>
                      </td>

                    </tr>
                  </xsl:for-each>
                  <tr class="mcostsubtotals">
                    <td></td>
                    <td>
                      Total
                        
                      
                    </td>
                    <td><xsl:value-of select ="//page/qd/sumcost/@sumcart"/>
                      
                    </td>
                  </tr>
                </table>

            </div>
            <div class="divtablecell">
              <strong>Integrated Package Summary</strong>

              <table class="mcosttable">
                <tr>
                  <td>Item</td>
                  <td>
                   Total Cost $
                  </td>
                  <td>
                    40% CM
                  </td>
                </tr>
                <tr>
                  <td>Manifold</td>
                  <td>
                    <xsl:value-of select ="//page/qd/sumcost/@summcost"/>
                  </td>
                  <td>
                  </td>
                </tr>
                <tr>
                  <td>Manifold Parts</td>
                  <td>
                    <xsl:if test="not(//page/qd/sumcost/@sumplug)">
                      <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select ="//page/qd/sumcost/@sumplug"/>
                  </td>
                  <td>
                  </td>
                </tr>
                <tr>
                  <td>Cartridges</td>
                  <td>
                    <xsl:if test="not(//page/qd/sumcost/@sumcart)">
                      <xsl:attribute name="style">background-color:yellow;</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select ="//page/qd/sumcost/@sumcart"/>
                  </td>
                  <td>
                  </td>
                </tr>
                <tr class="mcostsubtotals">
                  <td>Total</td>
                  <td>
                    <xsl:value-of select ="//page/qd/sumcost/@sumpackage"/>
                  </td>
                  <td>
                  </td>
                </tr>

              </table>

            </div>
          </xsl:if>
        </div> 
      </div>
    </div>

  </xsl:template>

</xsl:stylesheet>
