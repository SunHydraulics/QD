<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <div class="container bg--white pad content--wrapper">
      <section class="bg--light-grey pad block bottom-space grid lightborder">
        <h2 class="block-title no-bottom-space">
          Activity Report
        <xsl:if test="//page/qd/selecteddist">
          , Distributor <xsl:value-of select="//page/qd/selecteddist/@code "/> only
        </xsl:if>           
        </h2>
      </section>
      <div class="title">
        User Activity Report (since January 2012)
      </div>
      <xsl:for-each select="//page/qd/usertypes">
        <div style="clear:both;margin-left:30px;">
          <div>
            <xsl:attribute name="style">
              float:left;margin-left:8px;margin-top:4px;height:20px;width:40px;background-color:<xsl:value-of select="@color"/>;
            </xsl:attribute>
            
          </div>
          <div style="float:left;padding-left:5px;padding-top:4px;">
            <xsl:value-of select="@name"/>
          </div>
        </div>
      </xsl:for-each>
      <xsl:for-each select="//page/qd/regions">
        <xsl:variable name="thisregion" select="."/>
        <div class="title" style="clear:both;">
          <xsl:value-of select="@name"/>
        </div>

        <div class="graphdiv" style="clear:both;">
          <table class="graphtable">
            <tr>
              <xsl:for-each select="//page/qd/userstattypes">
                <xsl:variable name="thistype" select="."/>
                <td style="vertical-align:bottom;width:120px;">
                  <table class="graphtable">
                    <tr>
                <xsl:for-each select="//page/qd/userstatitems[@id=$thistype/@id and @regionid=$thisregion/@id]">
                  <td>
                    <xsl:value-of select="@nvalue"/>
                    <div class="graphbox">
                      <xsl:attribute name="style">
                        height:<xsl:value-of select="@npx"/>px;background-color:<xsl:value-of select="@color"/>;
                      </xsl:attribute>
                    </div>
                  </td>
                </xsl:for-each>
                    </tr>
                  </table>
                </td>
              </xsl:for-each>
            </tr>
            <tr>
              <xsl:for-each select="//page/qd/userstattypes">
                <td class="graphlabel">
                  <xsl:attribute name="colspan">1</xsl:attribute>
                  <xsl:value-of select="@name"/>
                </td>
               
              </xsl:for-each>
            </tr>

          </table>
        </div>     

      </xsl:for-each>


      <xsl:if test="//page/qd/showuserdata">
      <hr style="page-break-before: always;"/>        
        <div class="title">
          Users, this distributor
        </div>
        <table class="graphtable">
          <tr>
            <td>Name</td>
            <td>Type</td>
            <td>Days Active</td>
            <td>Total Designs</td>
            <td>Total QuickDesigns</td>
          </tr>
          <xsl:for-each select="//page/qd/userdata">
            <tr>
              <td class="gridcell">
                <xsl:value-of select="@name"/>
              </td>
              <td class="gridcell">
                <xsl:value-of select="@usertype"/>
              </td>
              <td class="gridcell">
                <xsl:value-of select="@daysinsys"/>
              </td>
              <td class="gridcell">
                <xsl:value-of select="@totaldesigns"/>
              </td>
              <td class="gridcell">
                <xsl:value-of select="@totalsubmit"/>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </xsl:if>


      <hr style="page-break-before: always;"/>
      <div class="title">
        Production Orders, by Month
      </div>
      <div class="smallnoteblue">(QD designs ordered through QD)</div>
      <div class="graphdiv">
        <table class="graphtable">
          <tr>
            <xsl:for-each select="//page/qd/prodcustoms">
              <td>
                <xsl:if test="@showyear">
                  <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@ncount"/>
                <div class="graphbox">

                  <xsl:attribute name="style">
                    height:<xsl:value-of select="@par"/>px;
                  </xsl:attribute>
                </div>

              </td>


            </xsl:for-each>

          </tr>
          <tr>
            <xsl:for-each select="//page/qd/prodcustoms">
              <td class="graphcell">
                <xsl:if test="@showyear">
                  <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@mname"/>

              </td>
            </xsl:for-each>
          </tr>
          <tr>
            <xsl:for-each select="//page/qd/prodcustoms">
              <xsl:if test="@showyear">
                <td class="graphcell">
                  <xsl:attribute name="colspan">
                    <xsl:value-of select="@y2months"/>
                  </xsl:attribute>
                  <xsl:value-of select="@y"/>
                </td>
              </xsl:if>

            </xsl:for-each>
          </tr>

        </table>
      </div>
      <div class="smallnoteblue" style="padding-top:10px;">(QD designs manually released by Sun)</div>
      <div class="graphdiv">
        <table class="graphtable">
          <tr>
            <xsl:for-each select="//page/qd/prodcustomsun">
              <td class="graphcell">
                <xsl:if test="@showyear">
                  <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@ncount"/>
                <div class="graphbox">

                  <xsl:attribute name="style">
                    height:<xsl:value-of select="@par"/>px;
                  </xsl:attribute>
                </div>

              </td>


            </xsl:for-each>

          </tr>
          <tr>
            <xsl:for-each select="//page/qd/prodcustomsun">
              <td class="graphcell" valign="bottom" align="center" colspan="1" >
                <xsl:if test="@showyear">
                  <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@mname"/>

              </td>
            </xsl:for-each>
          </tr>
          <tr>
            <xsl:for-each select="//page/qd/prodcustomsun">
              <xsl:if test="@showyear">
                <td class="graphcell" valign="bottom" align="left">
                  <xsl:attribute name="colspan">
                    <xsl:value-of select="@y2months"/>
                  </xsl:attribute>
                  <xsl:value-of select="@y"/>
                </td>
              </xsl:if>

            </xsl:for-each>
          </tr>

        </table>
      </div>



      <hr style="page-break-before: always;"/>
      <div class="title">
        Submittals, by Month
      </div>
      <xsl:for-each select="//page/qd/rgroups">
        <div style="margin-left:12px;margin-top:12px;">
          <div>
            <xsl:value-of select="@name"/>
          </div>

        </div>
        <div class="graphdiv">
          <table class="graphtable">
            <tr>
              <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                <td class="graphcell">
                  <xsl:if test="@showyear">
                    <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@ncount"/>
                  <div class="graphbox">

                    <xsl:attribute name="style">
                      height:<xsl:value-of select="@ncount"/>px;
                    </xsl:attribute>
                  </div>
                </td>
              </xsl:for-each>
            </tr>
            <tr>
              <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                <td class="graphcell">
                  <xsl:if test="@showyear">
                    <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mname"/>

                </td>
              </xsl:for-each>
            </tr>
            <tr>
              <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                <xsl:if test="@showyear">
                  <td class="graphcell" valign="bottom" align="left">
                    <xsl:attribute name="colspan">
                      <xsl:value-of select="@ymonths"/>
                    </xsl:attribute>
                    <xsl:value-of select="@y"/>
                  </td>
                </xsl:if>

              </xsl:for-each>
            </tr>

          </table>
        </div>
      </xsl:for-each>


      <hr style="page-break-before: always;"/>
      <xsl:for-each select="//page/qd/sgroups">
        <div style="margin-left:12px;margin-top:12px;">
          <div>
            <xsl:value-of select="@name"/>
          </div>

        </div>
        <div class="graphdiv">
          <table class="graphtable">
            <tr>
              <xsl:for-each select="//page/qd/scstats">
                <td class="graphcell" valign="bottom" align="center" style="border-bottom:solid 1px silver;">
                  <xsl:if test="@showyear">
                    <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@ncount"/>
                   <div class="graphbox">
                      <xsl:attribute name="style">
                        float:left;height:<xsl:value-of select="@scount"/>px;
                        <xsl:if test="@scount = '0'">
                          background-color:maroon;margin-bottom:-12px;
                        </xsl:if>
                      </xsl:attribute>
                    </div>
                    <div class="graphboxstack">
                      <xsl:attribute name="style">
                        height:<xsl:value-of select="@ccount"/>px;float:left;
                      </xsl:attribute>
                    </div>
                </td>
              </xsl:for-each>
            </tr>
            <tr>
              <xsl:for-each select="//page/qd/scstats">
                <td class="graphcell" valign="bottom" align="center" colspan="1" >
                  <xsl:if test="@showyear">
                    <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="@mname"/>

                </td>
              </xsl:for-each>
            </tr>
            <tr>
              <xsl:for-each select="//page/qd/scstats">
                <xsl:if test="@showyear">
                  <td class="graphcell" valign="bottom" align="left">
                    <xsl:attribute name="colspan">
                      <xsl:value-of select="@ymonths"/>
                    </xsl:attribute>
                    <xsl:value-of select="@y"/>
                  </td>
                </xsl:if>

              </xsl:for-each>
            </tr>

          </table>
        </div>
      </xsl:for-each>




      <hr style="page-break-before: always;"/>

      <div class="hidesuccesspercents" style="display:none">
        <div class="title">
          % Successful Completions, by Month
        </div>
        <xsl:for-each select="//page/qd/rgroups">
          <div style="margin-left:12px;margin-top:12px;">
            <div>
              <xsl:value-of select="@name"/>
            </div>

          </div>
          <div class="graphdiv">
            <table class="graphtable">
              <tr>
                <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                  <td class="graphcell" valign="bottom" align="center" style="border-bottom:solid 1px silver;">
                    <xsl:if test="@showyear">
                      <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="@pfc"/>
                    <div class="graphbox">
                      <xsl:attribute name="style">
                        height:<xsl:value-of select="@pfc"/>px;
                      </xsl:attribute>
                    </div>

                  </td>
                  <!--
              <td class="graphcell" valign="bottom" align="center"
                  style="border-bottom:solid 1px silver;border-right:dotted 1px silver;">

                <xsl:value-of select="@pfc"/>
                <div class="graphbox">

                  <xsl:attribute name="style">
                    background-color:silver;height:<xsl:value-of select="@pfc"/>px;
                  </xsl:attribute>
                </div>
              </td>
              -->

                </xsl:for-each>
                <td style="padding-left:30px;">
                  <!-- <table>
                     <hr/>
                <tr>
                  <td class="graphbox" style="height:10px;"></td>
                  <td class="smallnoteblue">= Body Design Complete %</td>
                </tr>
               
                <tr>
                  <td class="graphbox" style="height:10px;background-color:silver;"></td>
                  <td class="smallnoteblue">= Final Complete %</td>
                </tr>
              </table> -->
                </td>
              </tr>
              <tr>
                <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                  <td class="graphcell" valign="bottom" align="center" colspan="1" >
                    <xsl:if test="@showyear">
                      <xsl:attribute name="style">border-left:solid 1px silver</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="@mname"/>

                  </td>
                </xsl:for-each>
              </tr>
              <tr>
                <xsl:for-each select="//page/qd/stats[@issun=current()/@id]">
                  <xsl:if test="@showyear">
                    <td class="graphcell" valign="bottom" align="left">
                      <xsl:attribute name="colspan">
                        <xsl:value-of select="@y2months"/>
                      </xsl:attribute>
                      <xsl:value-of select="@y"/>
                    </td>
                  </xsl:if>

                </xsl:for-each>
              </tr>

            </table>
          </div>
        </xsl:for-each>
  
      </div>


      <div class="title">
        Activity for this period,  <xsl:value-of select="//page/qd/wdate/@startdate"/> to
        <xsl:value-of select="//page/qd/wdate/@enddate"/>
      </div>

      <table class="reporttable">
        <xsl:for-each select="//page/qd/rgroups">
          <tr>
            <td class="title" colspan="20">
              <xsl:value-of select="@name"/>
            </td>
          </tr>
          <xsl:if test="@ncount &gt; '0'">
            <tr>
              <td>Part No.</td>
              <td  title="QD=Quickdesign, Q=Quote, P=Production, D=Other">
                Status<br/>(now)
              </td>
              <td>QuickDraw</td>
              <td>User</td>
              <td>QQ Zbody</td>
              <td>Nbom Price</td>
              <td>% Const.</td>
              <td>Cavs</td>
              <td>Ports</td>
              <td>Plugs</td>
              <td>Body Design</td>
              <td>Total Time</td>

            </tr>
          </xsl:if>
          <xsl:if test="@ncount='0'">
            <tr>
              <td colspan="20">
                No designs submitted this period
              </td>
            </tr>
          </xsl:if>
          <xsl:for-each select="//page/qd/wreport[@issun = current()/@id]">
            <tr >
              <xsl:if test="@mod='1'">
                <xsl:attribute name="class">gridrow</xsl:attribute>
              </xsl:if>
              <xsl:if test="@mod='0'">
                <xsl:attribute name="class">gridrowA</xsl:attribute>
              </xsl:if>
              <td>
                <xsl:value-of select="@partno"/>
              </td>
              <td>
                <xsl:value-of select="@status"/>
              </td>
              <td>
                <xsl:value-of select="@fromqd"/>
              </td>
              <td>
                <xsl:value-of select="@username"/>
              </td>
              <td>
                <xsl:value-of select="@qqprice"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@nbprice"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@percconst"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@ncavities"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@nports"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@nplugs"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@mintimetoar"/>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
              <td>
                <xsl:value-of select="@mintimetofinal"/>
                <xsl:if test="@comments">
                  <div style="font-size:80%">
                    <xsl:value-of select="@comments"/>
                  </div>


                </xsl:if>
                <img src="images/blank.gif" style="width:2px"/>
              </td>
            </tr>
          </xsl:for-each>
          <xsl:for-each select="//page/qd/avgs[@issun = current()/@id]">
            <tr >
              <xsl:if test="@mod='1'">
                <xsl:attribute name="class">gridrow</xsl:attribute>
              </xsl:if>
              <xsl:if test="@mod='0'">
                <xsl:attribute name="class">gridrowA</xsl:attribute>
              </xsl:if>
              <td>
                <b>
                  Total <xsl:value-of select="@ncount"/>
                </b><br/>
                BD Complete <xsl:value-of select="//page/qd/perccomp[@issun= current()/@issun]/@par"/>%<br/>
                Final Complete <xsl:value-of select="//page/qd/perccomp[@issun= current()/@issun]/@ptf"/>%


              </td>
              <td colspan="2">

              </td>
              <td>
                <b>Averages</b>
              </td>
              <td>
                <xsl:value-of select="@qqprice"/>
              </td>
              <td>
                <xsl:value-of select="@nbprice"/>
              </td>
              <td>
                <xsl:value-of select="@percconst"/>
              </td>
              <td>
                <xsl:value-of select="@ncavities"/>
              </td>
              <td>
                <xsl:value-of select="@nports"/>
              </td>
              <td>
                <xsl:value-of select="@nplugs"/>
              </td>
              <td>
                <xsl:value-of select="@mintimetoar"/>
              </td>
              <td>
                <xsl:value-of select="@mintimetofinal"/>
              </td>
            </tr>

          </xsl:for-each>

        </xsl:for-each>
      </table>
      <div class="smallnoteblue" style="font-size:85%">
        <br/>
        <b>Status codes: </b>
        QD=Quickdesign, Q=Quote, P=Production, D=In design or other<br/>
        <b>QuickDraw codes: </b>
        Yes!=This revision from QuickDraw, yes=the design originated in QuickDraw
      </div>
      <br/>

      <table class="reporttable">
        <tr>
          <td class="title" colspan="20">
            Production Designs (A902 and later)
          </td>
        </tr>
        <tr>
          <td >Distributor</td>
          <td  title="QD=Quickdesign, Q=Quote, P=Production, D=Other">
            Parts (Status)
          </td>
        </tr>
        <xsl:for-each select="//page/qd/proddist">
          <tr >
            <td>
              <xsl:value-of select="@distributor"/> (<xsl:value-of select="@ncount"/>)
            </td>
            <td style="font-size:85%">
              <xsl:for-each select="//page/qd/prodparts[@distributor = current()/@distributor]">
                <xsl:value-of select="@partno"/> (<xsl:value-of select="@status"/>),
              </xsl:for-each>

            </td>
          </tr>
        </xsl:for-each>
        <tr >
          <td colspan="2">
            Total: <xsl:value-of select="//page/qd/prodtotal/@ncount"/>
          </td>
        </tr>
      </table>
      <br/>
      <table class="reporttable">
        <tr>
          <td class="title" colspan="20">
            Users by Region
          </td>
        </tr>
        <xsl:for-each select="//page/qd/usersbyregion">
          <tr >
            <td>
              <xsl:value-of select="@region"/>
            </td>
            <td colspan="1" valign="top" align="right" class="gridcell">
              <xsl:value-of select="@ncount"/>

            </td>
          </tr>
        </xsl:for-each>
      </table>
      <br/>
      <table class="reporttable">
        <tr>
          <td class="title" colspan="20">
            Users by Country
          </td>
        </tr>
        <xsl:for-each select="//page/qd/usersbycountry">
          <tr >
            <td>
              <xsl:value-of select="@region"/>
            </td>
            <td>
              <xsl:value-of select="@country"/>
            </td>
            <td colspan="1" valign="top" align="right" class="gridcell">
              <xsl:value-of select="@ncount"/>

            </td>
          </tr>
        </xsl:for-each>
      </table>
      <br/>
      <table class="reporttable">
        <tr>
          <td class="title" colspan="20">
            Distributor Upgrades
          </td>
        </tr>
        <tr >
          <td>
            Of the
            <xsl:value-of select="//page/qd/distcount/@ncount"/> distributor<sup>*</sup> users,
            <xsl:value-of select="//page/qd/distcount/@hasupgraded"/> of them have been upgraded to
            QuickDesign with SmartConnect.<br/>
            <sup>*</sup>includes users who have created at least one design in the past and who are not Sun employees or QD Customers.
          </td>
        </tr>

      </table>
    </div>
  </xsl:template>
</xsl:stylesheet>
