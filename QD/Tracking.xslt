<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>
  <xsl:include href="datepicker.xslt"/>
  <xsl:variable name="hdatepicker">
    <xsl:call-template name="datepicker"/>
  </xsl:variable>

  <xsl:template match="/">
    <input type="hidden" id="thisrowgroup" value="1"/>
    <xsl:if test="//page/qd/errormessage">
      <div id="errormessage" class="notecard">
        <xsl:value-of select="//page/qd/errormessage"/>
      </div>
    </xsl:if>
    <div class="site--wrapper">
      <div class="container bg--white pad content--wrapper">
        <section class="bg--light-grey pad block bottom-space grid lightborder">

          <h2 class="block-title">
            Report filters
            <a name="searchblock"/>

          </h2>
          <div class="col-4-7">
            <table id="tablesearchoptions">
              <xsl:if test="//page/qd/statusoptions">
                <tr>
                  <td class="tablestrong">
                    Status
                  </td>
                  <td>
                    <ul class="horizontal-list">
                      <xsl:for-each select="//page/qd/statusoptions">
                        <li>
                          <input type="radio" name="data_statusoption">
                            <xsl:attribute name="value">
                              <xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:if test="@selected">
                              <xsl:attribute name="checked">true</xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="onclick">
                              $('#data_username').val('');
                              saction="default.aspx?page=tracking#searchblock";
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
              </xsl:if>
              <xsl:if test='//page/qd/scopeoptions'>
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
              </xsl:if>
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
                      <xsl:attribute name="placeholder">
                        <xsl:value-of select="//page/qd/screenlabels[@id=574]/@label"/>
                        <!--Distributor name or code-->
                      </xsl:attribute>
                      <xsl:attribute name="onkeydown">
                        if(event.keyCode==13){
                        saction="default.aspx?page=tracking#searchblock";
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
                        saction="default.aspx?page=tracking#searchblock";
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
                <tr>
                  <xsl:if test='//page/qd/showmore'>
                    <xsl:attribute name='class'>rowfiltermore</xsl:attribute>
                  </xsl:if>
                  <td class='tablestrong'>
                    Sales Person
                  </td>
                  <td>
                    <input id="data_spname" name="data_spname" type="text" maxlength="20" class="distcustbox">
                      <xsl:attribute name="placeholder">First or last name</xsl:attribute>
                      <xsl:attribute name="onkeydown">
                        if(event.keyCode==13){
                        saction="default.aspx?page=tracking#searchblock";
                        submitit(saction);
                        }
                      </xsl:attribute>
                      <xsl:if test="//page/qd/spname">
                        <xsl:attribute name="value">
                          <xsl:value-of select='//page/qd/spname/@stext'/>
                        </xsl:attribute>
                      </xsl:if>
                    </input>
                  </td>
                </tr> 
              </xsl:if>
            </table>
            <xsl:if test='//page/qd/showmore'>
              <div class="divmore">
                <a href="#" title="Display more filters">
                  <xsl:attribute name="onclick">
                    $(".rowfiltermore").show();
                    $(".divmore").hide();
                    return false;
                  </xsl:attribute>
                  <xsl:value-of select="//page/qd/screenlabels[@id=674]/@label"/>
                  <!--More filters-->
                </a>
              </div>
            </xsl:if>

          </div>
          <div class="col-3-7">
            <table id="tablesearchoptions">
              <tr>
                <td>Project Number</td>
                <td>
                  <input id="data_partno" name="data_partno" type="text" maxlength="20" class="distcustbox">
                    <xsl:attribute name="placeholder">
                      <xsl:value-of select="//page/qd/searchplaceholder/@stext"/>
                    </xsl:attribute>
                    <xsl:attribute name="onkeydown">
                      if(event.keyCode==13){
                      submitit();
                      }
                    </xsl:attribute>
                    <xsl:if test="//page/qd/partno">
                      <xsl:attribute name="value">
                        <xsl:value-of select='//page/qd/partno'/>
                      </xsl:attribute>
                    </xsl:if>
                  </input>                  
                </td>
              </tr>
            </table>
            <div class='reportnotes'>
              <ul>
              <xsl:for-each select='//page/qd/reportnotes'>
                <li>
                  <xsl:value-of select ='@note'/>
                </li>
              
              </xsl:for-each>      
            </ul>     
            </div>


            <div>
            <input type="button" class="col-2-5 button bg--darker-grey partnosearch">
              <xsl:attribute name="value">
                <xsl:value-of select="//page/qd/screenlabels[@id=675]/@label"/>
                <!--Search-->
              </xsl:attribute>

              <xsl:attribute name="onclick">submitit();</xsl:attribute>
            </input>
              <input type="button" id="cmdtrackingexcel" class="col-2-5 button bg--darker-grey partnosearch">
                <xsl:attribute name="value">Excel</xsl:attribute>
              </input>
            </div>
          </div>
        </section>

        <section class="bg--light-grey pad block bottom-space lightborder">
          <h3 class="block-title">
            <xsl:value-of select="//page/qd/screenlabels[@id=575]/@label"/>
            <!--Project list-->
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
                    <th id="pagemessage">
                      Page 1 of <xsl:value-of select ="//page/qd/rowgroups[@ismax='1']/@num"/>
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
            <div id="tablesearch">
              <!-- class="search-table-masker closed bottom-space">-->
              <table class="table">
                <thead>
                  <tr>
                    <th>
                      Project
                      <div class="trackinggridline2">
                        Created By
                      </div>
                    </th>
                    <th>
                      Customer
                      <div class="trackinggridline2">
                        Est. Annual Units / Pricing
                      </div>
                    </th>
                    <th>
                      Sales Person
                    </th>

                    <th nowrap="true">
                      Status

                      <div class="trackinggridline2">
                        Offer - Follow up 
                      </div>
                      <div class="trackinggridline2">
                        Comments
                      </div>
                    </th>

 
                  </tr>
                </thead>

                <xsl:for-each select="//page/qd/rowgroups">
                  <tbody>
                    <xsl:attribute name="id">rowgroup<xsl:value-of select="@num"/></xsl:attribute>
                    <xsl:attribute name="class">
                      <xsl:if
                  test="@selected">qdrowgroup</xsl:if>
                      <xsl:if
                  test="not(@selected)">qdrowgroup nodisplay</xsl:if>
                    </xsl:attribute>
                    <xsl:for-each select="//page/qd/recent[@rowgroup = current()/@num]">
                      <tr>
                        <td>
                            <a class="tx--orange underline linkspace" title="Open the summary page to see the current information">
                              <xsl:attribute name="href">
                                default.aspx?page=summary&amp;quoteid=<xsl:value-of select="@quoteid"/>
                              </xsl:attribute>
                              <xsl:value-of select="@partno"/>
                            </a>

                          <div class="trackinggridline2 divnowrap">
                            <xsl:value-of select="@createdby"/>, <xsl:value-of select="@qstatus"/>
                          
                          </div>

                        </td>
                        <td>

                          <xsl:value-of select="@customer"/>
                         
                           <div class="trackinggridline2"> 
                            <xsl:value-of select="@eau"/>
                             /
                            <a href="#" class="tx--orange underline linkspace" title="Pop up the current pricing">
                              <xsl:attribute name="onclick">
                                surl='default.aspx?page=summary&amp;quoteid=<xsl:value-of select="@quoteid"/>#currencyanchor';
                                var nwin = window.open(surl,
                                'tdpricing' , 'toolbar=1,scrollbars=1,height=800,width=700,left=30,top=30,resizable=yes')
                                nwin.focus();
                                return false;
                              </xsl:attribute>
                              Pricing
                            </a>
                          </div>
                        </td>
                        <td>
                          <xsl:value-of select="@salesperson"/>
                          <div class="trackinggridline2">
                            <xsl:value-of select="@email"/>
                          </div>
                        </td>
                        <td>
                          <xsl:attribute name="id">td<xsl:value-of select="@quoteid"/></xsl:attribute>
                          <div class="divpaddingbottom">
                            <span class="nopad">
                              <xsl:attribute name="id">spanstatus<xsl:value-of select="@quoteid"/></xsl:attribute>
                              <xsl:value-of select="@pmstatus"/>
                            </span>
                            
                            <a href="#" class="trackingeditbutton" title="Edit the tracking data">
                              <xsl:attribute name="id">eb<xsl:value-of select="@quoteid"/></xsl:attribute>
                             <xsl:attribute name="onclick"> loadXMLDoc("qd_qdtrackingeditform", this);
                             return false;
                              </xsl:attribute>
                            
                             edit
                            </a>
                          </div>
                          <div class="trackinggridline2">
                            <div style="overflow:hidden:width:100%">
                              <div style="float:left">
                                <span class="nopad">
                                  <xsl:attribute name="id">spanod<xsl:value-of select="@quoteid"/></xsl:attribute>
                                  <xsl:value-of select="@offerdate"/>
                                </span>

                              </div>
                              <div style="float:right;">
                                <span class="nopad">
                                  <xsl:attribute name="id">spanfd<xsl:value-of select="@quoteid"/></xsl:attribute>
                                  <xsl:value-of select="@followdate"/>
                                </span>
                              </div>
                              
                            </div>
                          </div>

                          <div class="trackinggridline2">
                            <xsl:attribute name="id">spancomm<xsl:value-of select="@quoteid"/></xsl:attribute>
                            <xsl:value-of select="@comments"/>
                          </div>

                        </td>


                      </tr>
                    </xsl:for-each>
                  </tbody>
                </xsl:for-each>
              </table>
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
            </xsl:for-each>
          </section>
        </xsl:if>

      </div>
      <!-- .container -->
     <div class="trackingeditform">
      <div class="close">x</div>
      <br/>
      <h2 class="block-title" id="editformtitle">
        Tracking Data
      </h2>
       <br/>
       <div id="divqdtrackingeditform" class="col-2-2 bottom-space-double">

       </div>
    </div>
    </div>

    <div class="backdrop"/>

  </xsl:template>
</xsl:stylesheet>
