<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">

    <input type="hidden" name="data_sortby" id="data_sortby">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/sortby"/>
      </xsl:attribute>
    </input>
    <input type="hidden" name="data_partno" id="data_partno">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/partno"/>
      </xsl:attribute>
    </input>
    <input type="hidden" name="data_pageno" id="data_pageno">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/pageno"/>
      </xsl:attribute>
    </input>
    <input type="hidden" name="showfilters" id="showfilters">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/showfilters"/>
      </xsl:attribute>
    </input>
    <input type="hidden" name="showviews" id="showviews">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/showviews"/>
      </xsl:attribute>
    </input>
    <input type="hidden" id="data_viewoption" name="data_viewoption">
      <xsl:attribute name="value">
        <xsl:value-of select="//page/qd/viewoption"/>
      </xsl:attribute>
    </input>

      <div class="container bg--white pad content--wrapper">
        <section class="bg--light-grey pad block bottom-space grid">
          <h2 class="block-title">Search existing projects</h2>

          <div class="col-4-7">
          <div id="screenmessage">
          </div>
          <div>
            <!-- <xsl:value-of select="//page/qd/screenlabels[@id='98']/@label"/>-->
            <!--Project Search -->

          </div>
          <xsl:if test="//page/qd[showfilters='1']">
          <div>
            <xsl:value-of select="//page/qd/screenlabels[@id='91']/@label"/>
            <!--Filters-->

            <img>
              <xsl:if test="//page/qd[showfilters='1' or not(showfilters)]">
                <xsl:attribute name="src">images/redarrowup.gif</xsl:attribute>
                <xsl:attribute name="title">Hide</xsl:attribute>
              </xsl:if>
              <xsl:if test="//page/qd[showfilters='0']">
                <xsl:attribute name="src">images/redarrowdown.gif</xsl:attribute>
                <xsl:attribute name="title">Show</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onclick">
                javascript:
                filterdisplay(this,1);
              </xsl:attribute>
            </img>

            <xsl:value-of select="//page/qd/screenlabels[@id='103']/@label"/>
            <!--Views -->

            <img>
              <xsl:if test="//page/qd[showviews='1' or not(showviews)]">
                <xsl:attribute name="src">images/redarrowup.gif</xsl:attribute>
                <xsl:attribute name="title">Hide</xsl:attribute>
              </xsl:if>
              <xsl:if test="//page/qd[showviews='0']">
                <xsl:attribute name="src">images/redarrowdown.gif</xsl:attribute>
                <xsl:attribute name="title">Show</xsl:attribute>
              </xsl:if>
              <xsl:attribute name="onclick">
                javascript:
                filterdisplay(this,2);

              </xsl:attribute>
            </img>
          </div>
          </xsl:if>
            <div id="divfiltersection">

            <xsl:if test="//page/qd/createdby">
              <strong><xsl:value-of select="//page/qd/screenlabels[@id='87']/@label"/>:<!--Created by--></strong>
              <ul class="horizontal-list">
                <xsl:for-each select="//page/qd/createdby">
                  <li>
                    <input type="radio">
                      <xsl:attribute name="id">data_createdby<xsl:value-of select="@id"/></xsl:attribute>
                      <xsl:attribute name="name">data_createdby</xsl:attribute>

                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="title">
                        <xsl:value-of select="@title"/>
                      </xsl:attribute>
                      <xsl:if test="@selected">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="onclick">
                        filtersubmitit();
                      </xsl:attribute>

                    </input>
                    <label for="data_createdby">
                      <xsl:value-of select="@display"/>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>

            </xsl:if>
              <br/>
              <br/>


              <strong>
                <xsl:value-of select="//page/qd/screenlabels[@id='99']/@label"/>:
                <!--Scope-->
              </strong>
              <ul class="horizontal-list">
                <xsl:for-each select="//page/qd/scopeoptions">
                  <li>
                    <input type="radio">
                      <xsl:attribute name="id">data_scopeoption<xsl:value-of select="@id"/></xsl:attribute>
                      <xsl:attribute name="name">data_scopeoption</xsl:attribute>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="title">
                        <xsl:value-of select="@title"/>
                      </xsl:attribute>
                      <xsl:if test="@selected">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="onclick">
                        filtersubmitit();
                      </xsl:attribute>

                    </input>
                    <label for="data_scopeoption">
                      <xsl:value-of select="@display"/>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>
              <linebreak/>
              <strong>
                <xsl:value-of select="//page/qd/screenlabels[@id='104']/@label"/>
                <!--When Created-->
              </strong>
              <ul class="horizontal-list">
                <xsl:for-each select="//page/qd/dateoptions">
                  <li>
                    <input type="radio">
                      <xsl:attribute name="id">data_dateoption<xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="name">data_dateoption</xsl:attribute>
                      <xsl:attribute name="value">
                        <xsl:value-of select="@id"/>
                      </xsl:attribute>
                      <xsl:attribute name="title">
                        <xsl:value-of select="@title"/>
                      </xsl:attribute>
                      <xsl:if test="@selected">
                        <xsl:attribute name="checked">true</xsl:attribute>
                      </xsl:if>
                      <xsl:attribute name="onclick">
                        filtersubmitit();
                      </xsl:attribute>

                    </input>
                    <label for="data_dateoption">
                      <xsl:value-of select="@display"/>
                    </label>
                  </li>
                </xsl:for-each>
              </ul>
              <xsl:if test="//page/qd/showdistlist">
                <div class="divnowrap">
                  <strong>
                    <xsl:value-of select="//page/qd/screenlabels[@id='90']/@label"/>
                    <!--Distributor-->
                  </strong>
                  <select id="data_distributorid" name="data_distributorid">
                    <xsl:attribute name="onchange">
                      if(typeof data_customerid == "object"){
                      document.getElementById("data_customerid").selectedIndex=0;
                      }
                      filtersubmitit();
                    </xsl:attribute>
                    <xsl:for-each select="//page/qd/distributors">
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
                  <xsl:if test="//page/qd/showallbranch">
                    <br/>
                    <input type="checkbox" id="data_showallbranch" name="data_showallbranch" value="1">
                      <xsl:attribute name="onclick">
                        filtersubmitit();
                      </xsl:attribute>
                      <xsl:if test="//page/qd/isshowallbranch">
                        <xsl:attribute name="checked">
                          true
                        </xsl:attribute>
                      </xsl:if>
                      Show all <xsl:value-of select="//page/qd/showallbranch/@name"/>
                    </input>
                  </xsl:if>
                </div>

              </xsl:if>
              <xsl:if test="//page/qd/customers">
                <div class="divnowrap">
                  <strong>
                    <xsl:value-of select="//page/qd/screenlabels[@id='88']/@label"/>
                    <!--Customer-->
                  </strong>
                  <select id="data_customerid" name="data_customerid">
                    <xsl:attribute name="onchange">
                      filtersubmitit();
                    </xsl:attribute>
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
              </xsl:if>
              <linebreak/>
              <div class="divnowrap">
                <strong>
                <xsl:value-of select="//page/qd/screenlabels[@id='419']/@label"/>
                <!--Status-->
                </strong>
                <select id="data_statusid" name="data_statusid">
                  <xsl:attribute name="onchange">
                    filtersubmitit();
                  </xsl:attribute>
                  <xsl:for-each select="//page/qd/status">
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
              <xsl:if test="//page/qd/customers">
                <div class="divnowrap">
                  <strong>
                    Sun Designer

                  </strong>
                  <select id="data_suncontactid" name="data_suncontactid">
                    <xsl:attribute name="onchange">
                      filtersubmitit();
                    </xsl:attribute>
                    <xsl:for-each select="//page/qd/suncontact">
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
              </xsl:if>
            </div>
          </div> 

          <div class="col-3-7">
              <input type="text" class="col-3-5" id="txtpartno" name="txtpartno" >
                <xsl:attribute name="value">
                  <xsl:value-of select="//page/qd/partno"/>
                </xsl:attribute>
                <xsl:attribute name="onkeydown">
                  if(nthiskey(event)==13){
                  partnosubmit();
                  }
                </xsl:attribute>
              </input>
              <input type="button" class="col-2-5 button bg--darker-grey">
                <xsl:attribute name="value">
                  <xsl:value-of select="//page/qd/screenlabels[@id='370']/@label"/>
                  <!--Go-->
                </xsl:attribute>

                <xsl:attribute name="onclick">
                  partnosubmit();
                </xsl:attribute>
              </input>
          </div>
          
          <div id="divviewsection">
            <xsl:if test="//page/qd[showviews='0']">
              <xsl:attribute name="className">hidden</xsl:attribute>
            </xsl:if>
            <table cellspacing="0" cellpadding="0" style="width:400px;">
              <xsl:if test="//page/qd[adminlevel='1']">
                <tr>
                  <td colspan="1" isheader="true" valign="top">
                    <xsl:value-of select="//page/qd/screenlabels[@id='103']/@label"/>
                    <!--Views -->

                  </td>
                  <td colspan="1">
                    <xsl:for-each select="//page/qd/viewoptions">
                      <div>
                        <a>
                          <xsl:attribute name="onclick">
                            document.getElementById("data_viewoption").value='<xsl:value-of select="@id"/>'
                            document.forms[0].submit();
                          </xsl:attribute>
                          <xsl:value-of select="@display"/>
                        </a> - <xsl:value-of select="@title"/>
                      </div>

                    </xsl:for-each>
                  </td>
                </tr>
              </xsl:if>
            </table>
            <br/>
            <div>
              <xsl:value-of select="//page/qd/viewoptions[@selected='1']/@display"/>
            </div>
          </div>
          <xsl:if test="//page/qd/quotes">
            <a name="projecttable"/>
            <table cellspacing="0" cellpadding="0">
              <thead>
                <th>
                  <a class="cursorpointer">
                    <xsl:attribute name="onclick">
                      sortsubmit(1)
                    </xsl:attribute>
                    <xsl:value-of select="//page/qd/screenlabels[@id='97']/@label"/>
                    <!--Part No -->

                    <xsl:if test="//page/qd[sortby='-1']">
                      <img src="images/redarrowdown.gif"/>
                    </xsl:if>
                    <xsl:if test="//page/qd[sortby='1']">
                      <img src="images/redarrowup.gif"/>
                    </xsl:if>
                  </a>
                </th>
                <th>
                  <a>
                    <xsl:attribute name="onclick">
                      sortsubmit(2)
                    </xsl:attribute>
                    <xsl:value-of select="//page/qd/screenlabels[@id='419']/@label"/>
                    <!--Status -->

                    <xsl:if test="//page/qd[sortby='-2']">
                      <img src="images/redarrowdowntrans.gif"/>
                    </xsl:if>
                    <xsl:if test="//page/qd[sortby='2']">
                      <img src="images/redarrowup.gif"/>
                    </xsl:if>
                  </a>

                </th>
                <th>
                  <a>
                    <xsl:attribute name="onclick">
                      sortsubmit(3)
                    </xsl:attribute>
                    <xsl:value-of select="//page/qd/screenlabels[@id='90']/@label"/>
                    <!--Distributor -->

                    <xsl:if test="//page/qd[sortby='-3']">
                      <img src="images/redarrowdown.gif"/>
                    </xsl:if>
                    <xsl:if test="//page/qd[sortby='3']">
                      <img src="images/redarrowup.gif"/>
                    </xsl:if>
                  </a>
                  <font class="grayitalic">
                    <i>
                      <!--Customer-->
                      <xsl:value-of select="//page/qd/screenlabels[@id='88']/@label"/>
                    </i>
                  </font>

                </th>
                <th>
                  <a>
                    <xsl:attribute name="onclick">
                      sortsubmit(4)
                    </xsl:attribute>
                    <xsl:value-of select="//page/qd/screenlabels[@id='87']/@label"/>
                    <!--Created by -->

                    <xsl:if test="//page/qd[sortby='-4']">
                      <img src="images/redarrowdown.gif"/>
                    </xsl:if>
                    <xsl:if test="//page/qd[sortby='4']">
                      <img src="images/redarrowup.gif"/>
                    </xsl:if>
                  </a>

                </th>
                <th>
                  <xsl:value-of select="//page/qd/screenlabels[@id=558]/@label"/>
                  <!--Order-->

                </th>
                <xsl:if test="//page/qd[adminlevel='1']">
                  <th>
                    <xsl:value-of select="//page/qd/screenlabels[@id='419']/@label"/>
                    <!--Status-->
                  </th>
                </xsl:if>
              </thead>
              <tbody>
              <xsl:for-each select="//page/qd/quotes">
                <tr >
                  <xsl:if test="@mod='1'">
                    <xsl:attribute name="class">gridrow</xsl:attribute>
                  </xsl:if>
                  <xsl:if test="@mod='0'">
                    <xsl:attribute name="class">gridrowA</xsl:attribute>
                  </xsl:if>
                  <td colspan="1" valign="top" nowrap="true">
                    <xsl:if test="//page/qd/ispartnofilter">
                      <xsl:attribute name="style">background-color:#ffff66;</xsl:attribute>
                    </xsl:if>
                    <a>
                      <xsl:attribute name="href">
                        default.aspx?page=documents&amp;quoteid=<xsl:value-of select="@qquoteid"/>
                      </xsl:attribute>
                      <xsl:value-of select="@partno"/>
                    </a>
                  </td>
                  <td colspan="1" valign="top">
                    <xsl:value-of select="@status"/>
                    <xsl:if test="@comments">
                      <br/>
                      <span class="grayitalic"><xsl:value-of select="@comments"/></span>
                    </xsl:if>
                  </td>
                  <td colspan="1" valign="top">
                    <xsl:value-of select="@distributor" disable-output-escaping="yes"/>
                    <br/>
                    <font class="grayitalic">
                      <i>
                        <xsl:value-of select="@customer" disable-output-escaping="yes"/>
                      </i>
                    </font>
                  </td>
                  <td colspan="1" valign="top">
                    <xsl:value-of select="@username" disable-output-escaping="yes"/>
                    <xsl:if test="//page/qd[not (isqdlite)]">
                    </xsl:if>
                    <xsl:if test="//page/qd[adminlevel='1']">
                      <br/>
                      <xsl:if test="@sundesigner">
                        <i>
                          <!--Sun Designer:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='357']/@label"/>:
                        </i>
                        <xsl:value-of select="@sundesigner"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@manifolddesigncontact">
                        <i>
                          <!--Sun Manifld Design Contact:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='358']/@label"/>:
                        </i>
                        <xsl:value-of select="manifolddesigncontact"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@lockedby">
                        <i>
                          <!--Locked By:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='331']/@label"/>:
                        </i>
                        <xsl:value-of select="@lockedby"/>
                        <br/>
                      </xsl:if>
                    </xsl:if>
                  </td>
                  <td colspan="1" valign="top">
                    <xsl:if test="@orderqty">
                      <i>
                        <!--Qty:-->
                        <xsl:value-of select="//page/qd/screenlabels[@id='348']/@label"/>:
                      </i>
                      <xsl:value-of select="@orderqty"/>
                      <br/>
                    </xsl:if>
                    <xsl:if test="@orderdate">
                      <i>
                        <!--Order Date:-->
                        <xsl:value-of select="//page/qd/screenlabels[@id='338']/@label"/>:
                      </i>
                      <xsl:value-of select="@orderdate"/>
                      <br/>
                    </xsl:if>
                    <xsl:if test="@reqshipdate">
                      <i>
                        <!--Req Ship:-->
                        <xsl:value-of select="//page/qd/screenlabels[@id='353']/@label"/>:
                      </i>
                      <xsl:value-of select="@reqshipdate"/>
                      <br/>
                    </xsl:if>

                  </td>
                  <xsl:if test="//page/qd[adminlevel='1']">
                    <td colspan="1" valign="top">
                      <xsl:if test="@designstatdate">
                        <i>
                          <!--Design:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='326']/@label"/>:
                        </i>
                        <xsl:value-of select="@designstatdate"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@prelimstatdate">
                        <i>
                          <!--Prelim:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='341']/@label"/>:
                        </i>
                        <xsl:value-of select="@prelimstatdate"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@apprstatdate">
                        <i>
                          <xsl:value-of select="//page/qd/screenlabels[@id='321']/@label"/>:
                          <!--Appr:-->
                        </i>
                        <xsl:value-of select="@apprstatdate"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@relstatdate">
                        <i>
                          <!--Release:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='352']/@label"/>:
                        </i>
                        <xsl:value-of select="@relstatdate"/>
                        <br/>
                      </xsl:if>
                      <xsl:if test="@onholddate">
                        <i>
                          <!--Hold:-->
                          <xsl:value-of select="//page/qd/screenlabels[@id='329']/@label"/>:
                        </i>
                        <xsl:value-of select="@onholddate"/>
                      </xsl:if>
                     
                    </td>
                  </xsl:if>
                </tr>
              </xsl:for-each>
              </tbody>
            </table>
            <br/>
            <div>
              <div>
                <!--Page:-->
                <xsl:value-of select="//page/qd/screenlabels[@id='339']/@label"/>:
              </div>
              <xsl:for-each select="//page/qd/pages">
                <xsl:if test="@selected">
                  <a href="#">
                    <xsl:attribute name="onclick">
                      return 0;
                    </xsl:attribute>
                    <xsl:value-of select="@pageno"/>
                  </a>
                </xsl:if>
                <xsl:if test="current()[not (@selected)]">
                  <a class="tx--orange bottom-space-half" href="#">
                    <xsl:attribute name="onclick">
                      document.getElementById("data_pageno").value='<xsl:value-of select="@pageno"/>';
                      submitit("default.aspx?page=projects#projecttable");
                    </xsl:attribute>
                    <xsl:value-of select="@pageno"/>
                  </a>
                </xsl:if>

              </xsl:for-each>
              <div/>
            </div>
          </xsl:if>

          <xsl:if test="//page/qd/errormessage">
            <br/>
            <br/>
            <div id="errormessage">
              <xsl:value-of select="//page/qd/errormessage"/>
            </div>
          </xsl:if>
        </section>
      </div>


  </xsl:template>
</xsl:stylesheet>

